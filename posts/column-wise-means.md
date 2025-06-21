---
layout: main
---

### The column-wise mean in a matrix where each row sums to 1 preserves the simplex probability


Suppose I have a set of probabilities across categories representing something important for a given year. I have this data for many such years. The probabilities necessarily sum to 1 in a given year - they live on a [probability simplex](https://ericmjl.github.io/blog/2021/5/5/probability-simplex/). I would like to combine the probabilities across years for a given category with the condition that the final probabilities across categories sum to 1. What is the simplest way I can do this?

| Year      | Group A| Group B| Group C| Group D|
| -- | -- | -- | --| -- |
| 2018   |    0.2 | 0.6 | 0.1 | 0.1 |
| 2019   |     0.15  | 0.65 | 0.05 | 0.15 |
| 2020 	 | 		0.15 | 0.7 | 0.1 | 0.05 |

This matrix A is of dimension $n$ (rows) by $m$ (columns). Each row sums to 1. I want a vector $V$ of dimension $1$ by $m$ where $\sum_{l = 1}^{m}V_l$ = 1 and $V_l$ must be some measure that summarizes the probability of group $L$ across the rows ($1$ to $n$). 

Note that $\sum_{i,j}A_{ij} = n$ since each row sums to one and there are $n$ rows in the matrix. Dividing this by $n$ necessasily equals 1. This is the same operation as taking the average of each column and therefore the sum of the average vector across columns must be equal to 1 too. To make this clear, if $V_l$ is taken to be the average of group $l$ across the $n$ rows, $V_l = \frac{\sum_{i=1}^{n} A_{i,l}}{n}$. The total value of $V$ across all groups $l$ is $\frac{\sum_{i,l}A_{il}}{n}$ which is $1$. 

Creating a vector made up of the column-wise mean in a matrix where each row sums to 1 results in a vector that also sums to 1. 