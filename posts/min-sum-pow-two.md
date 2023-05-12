---
layout: post
---


#### Toying around with powers of two

Suppose I have a positive integer $x$ in base 10. It is possible to write $x$ as a sum of powers of two. This raises an interesting question: *What is the minimium number of non-zero summands using the powers of two required to a given positive integer $x$?* 

For example, if the number was 9, the minimum number of summands of powers of two is 2 since $2^3 + 2^0 = 9$. If the number is 12, the minimum number is $2^3 + 2^2$. 

*We have stumbled upon the minimum Hamming weight problem in base 2.* As such, let us define the minimum Hamming weight of a positive integer $x \in \mathbb{Z}^{+}$ as $M_{HW}(x)$.

When $x$ is a power of two (e.g., 1, 2, 4, 8, 16), $M_{HW}(x) = 1$. When $x$ is a power of two minus 1 (e.g., 7, 15, 31), we are forced to set all the previous powers of two to one in order to reach $x$. For instance $(1)2^0 + (1)2^1 + (1)2^2 = 7$ and $(1)2^0 + (1)2^1 + (1)2^2 + (1)2^3 = 15$. Therefore, when $x = 2^n - 1 \forall n \geq 2$, $M_{HW}(x) = n - 1$. **For $x \in \mathbb{Z}^{+}$, $1 \leq M_{HW}(x) \leq n + 1$ where $n = \lfloor log_{2}(x) \rfloor$.**

Given an integer $x$, let us write an iterative algorithm to compute $M_{HW}(x)$. 
	
	$r_{hw} = 0$

	while $log_{2}(x) \neq 0$

		$p = \lfloor log_{2}(x) \rfloor

		$x = x - 2^p$

		$r_{hw} = r_{hw} + 1$

The value of $r_{hw} at the end is $M_{HW}(x)$. This algorithm runs in $O(log x)$ because, at worst, we take $log_{2}(x)$ times through the while loop. Essentially, what we are doing here is converting $x$ to binary and counting the number of 1's in the binary representation. 

Is it possible to find a closed form analytical expression for $M_{HW}(x)$ such that we have a constant time solution, $O(1)$ to the problem? 

Why would this be important? Minimum Hamming weights are used to generate secure cryptographic keys, discover DNA motifs, align DNA sequences, compress data, and detect errors in binary. 

Let us graph the behavior of $M_{HW}(x)$

![<img src="min-hamming-weight.png" width="100"/>](/posts_code/min-hamming-weight.png)  

























