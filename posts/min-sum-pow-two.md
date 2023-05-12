---
layout: default
---

#### Toying around with powers of two

Suppose I have a positive integer $x$ in base 10. It is possible to write $x$ as a sum of powers of two. This raises an interesting question: *What is the minimium number of non-zero summands using the powers of two required to a given positive integer $x$?* 

For example, if the number was 9, the minimum number of summands of powers of two is 2 since $2^3 + 2^0 = 9$. If the number is 12, the minimum number is $2^3 + 2^2$. 

We have stumbled upon the minimum Hamming weight problem in base 2. As such, let us define the minimum Hamming weight of a positive integer $x \in \mathbb{Z}^{+}$


8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32
1 2 2  3  2  3  3  4  1  2  2  3  2  3  3  4  2  3  3  4  3  4  4  5  1 
