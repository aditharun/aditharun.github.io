---
layout: default
---


### Catching Up On Lectures

Suppose that in medical school there are lectures every weekday. You are trying to keep up but are currently X days behind on lecture. To catch up with lectures Y days from now, how many lectures per day must you watch?

For notation, assume that if today is Tuesday and you are two days behind on lecture, then you have lectures from both Monday and Tuesday to catch up on. 

Consider the integer number line. There are two dots on this line. The 'L'-dot, lecture dot, starts at 0 and the 'M'-dot, me dot, starts at 0 - X where X is the number of days behind on lecture that I currently am. 

Now, the L-dot has a pre-determined moving pattern. It moves foward by one 5 times in a row (weekdays), then does not move for 2 time steps (weekends). It repeats its behavior in perpetuity.

We can model L-dot's movement as: 
	
$L_{d}$ = if (d mod 6 | d mod 7) = 0 then $L_{d-1}$ else $L_{d-1} + 1$ 

where d refers to the day count; d starts at 0 and, by definition, $L_{0}$ = 0 

We can model M-dot's movement as: 
	
$M_x = M_0 + Z * x$ where $ M_x $ is the position of M at day x, $M_0$ is the number of days I am currently behind on lecture, and Z is the average number of lectures consumed per day


At an average rate of Z moves (lectures) per time step (day), how many days from now will the L-dot and M-dot meet (i.e., when will I be caught up)?

We seek to find the first value of x for which $M_x \geq L_x$. We can solve this with a simple simulation. Here is some R code to do it:  

	#set these values
	M_init <- -4 #number of days behind on lecture you currently are 
	Z <- 2  #average number of lectures you plan to consume per day
	##


	L_init <- 0

	L <- c(L_init)
	M <- c(M_init)

	x <- 0

	while (tail(M, 1) < tail(L, 1)){

		x <- x + 1
		
		if ((x %% 6 == 0)|(x %% 7 == 0)){

			L <- c(L, tail(L, 1))

		} else{

			L <- c(L, tail(L, 1) + 1)
		}

		M <- c(M, (M[1] + x*Z) )


	}

	print(paste0(x, " calendar days from now you will be caught up"))


Now invert that question. What should my average rate of lecture catch up per day be if I want to be caught up in T days?

We compute $L_T$ using the recurrent expression above or more simply: $L_T = T - (floor(T / 6) + floor(T / 7))$. Then, set $L_T = M_0 + Z * T$, and find Z by taking the ceiling of $(L_T - M_0)/T$. 


Adith Arun
Jan 2023

[back](./)






