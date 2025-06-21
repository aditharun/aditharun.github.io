---
layout: main
---

#### Efficient Bootstrapping


##### Defining the problem

Suppose we have a matrix A with n rows and m columns. We perform matrix multiplications $f(A,q)$ where $q$ is a constant matrix to estimate $p$. In this case, $p$ is the percent of incident cancers in the U.S. with a given mutation. The matrix A is actually data from $n$ different mutations concatenated together such that the $f(A)$ results in a vector of length $n$ of the estimated $p$'s for each of the $n$ mutations. 

Now, we care about estimating 95% confidence intervals for each $p$.   

Each element of A, $A_{ij}$ is assumed to be drawn from a Poisson random variable with mean equal to $A_{ij}$. Therefore we can randomly resample $A$ and for each resample compute $f(A)$ to re-estimate $p$. Doing this $j$ many times, we arrive at $j$ estimates for each $p$ and can take the empirical 2.5% and 97.5% quantiles to estimate 95% confidence intervals. This is a classic bootstrap approach. But, consider that we have, in total, $10^6$ mutations or rows and $65$ columns in $A$ and we want $10^4$ resamples. 

**How do we design an approach that accomplishes this task on a single local machine in the shortest time possible?**


##### What are the steps?

The steps of the bootstrap are: 

	1) resample A
	2) perform the matrix multiplications $f(.)$ on A to estimate $p$
	3) store the estimated $p$'s
	4) do this 10,000 times
	5) calculate the 2.5% and 97.5% quantiles

We can also choose to chunk A into smaller bits to ease up on memory use. 

##### Naive implementations

Since we have 20 amino acids, it is naturally to chunk A by amino acid since downstream steps of our pipeline compute statistics per amino acids. So, we have chunked A into 20 relatively equal pieces. 

We can use the standard poisson sampling function in whatever language we want and feed in the values of the matrix as a vector into the function to generate indepdent samples. This takes a while in R (on the order of 2 minutes for 100,000 rows). We use a for loop to cycle through each of the $j$ resamples, so this would take 111 hours. Unacceptable. 

The for loop enables each random resampling. So, quickly, we can write C++ code to do the exact task we were writing in R given that C++ is much faster. Running this on a small set of A (100 rows) and scaling up, it would still take ~50 hours.

We need to try something else. 


##### Dense matrix approach

The step that takes the most time is the for loop resampling and element-by-element multiplication. Let us leverage the matrix properties of this problem. 

Neural networks perform millions of matrix operations extremely quickly. And computations on resampled random matrices are done all the time (see for example [this paper](https://arxiv.org/abs/2002.09976)). Our resampling problem is equal to computing a statistic on a random matrix. 

Let us load our matrix A into Python and turn it into a numpy array. And we can use $np.random.poisson(lam=A[np.newaxis, :, :], size=(10000, *A))$ and pass the matrix into the function. And, we can specify the number of samples to get which we will set to $10^5$. 

In the limit, to maximize our ability to chunk, we can have A be 1 row. We can write out results from this 1 row and save our progress more readily if the program was to be interrupted. But, this approach would still take 6 hours. If we split A into 20 equal chunks, this approach would take ~4 hours. Still not good enough. 

We have been working with dense matrix representations, the default in numpy. But, our matrix A is filled with lots of zeros. In fact, only ~1% of the values are non-zero. 

##### Sparse matrix approach

Our matrix is sparse. Sparse matrices are typically defined as < 10% non-zero values. We can use $scipy.sparse$ to represent our matrix as a sparse matrix which offers us time and memory advantages. Specifically, since we are sampling a Poisson, values of zero will always have a zero value when resampled. So, we need not resample these values. We can store non-zero values in the original $A$, and only resample these values as such: 

	A_sparse = sp.csr_matrix(A)
	rows, cols = A_sparse.nonzero()  
	nonzero_values = A_sparse.data

	num_samples = 10000
	resampled_values = np.random.poisson(lam=nonzero_values[np.newaxis, :], size=(num_samples, len(nonzero_values)))

	resampled_sparse_matrices = [sp.csr_matrix((resampled_values[i], (rows, cols)), shape=A_sparse.shape) for i in range(num_samples)]

This takes about 50 seconds to run when A has 100,000 rows. Doing this 20 times (since we split A into each amino acid), resampling will take 20 minutes in total. 

From here, we can iterate through each resampled matrix stored in a list, perform the matrix operations defined by $f$. This will add another ~7 minutes and generates the 10000 different estimates for each $p$. Finally, we need to compute the 2.5% and 97.5% quantiles for each $p$ which can be done by using numpy's hstack feature to stack lists into a matrix and numpy's quantile to extract the quantiles. This adds another ~7 minutes in total. 

It takes 1 hour on a personal computer to generate 95% confidence intervals for mutation rates using 10,000 bootstrap samples of 1,000,000 mutatations across 65 cancer types. 

We split this matrix of 1M rows into 20 even pieces corresponding to each amino acid. So, we have 20 jobs to do which will all roughly take 3 minutes. My computer has 8 cores, so I can run 8 matrices at the same time. At maximum, a core will have to process 3 sub-matrices meaning the entire task takes 9 minutes. 






























