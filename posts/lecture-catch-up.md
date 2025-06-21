---
layout: main
---


#### Catching Up On Lectures

Suppose that in medical school there are lectures every weekday. You are trying to keep up but are currently X days behind on lecture. To catch up with lectures Y days from now, how many lectures per day must you watch?  

For notation, assume that if today is Tuesday and you are two days behind on lecture, then you have lectures from both Monday and Tuesday to catch up on. 

Consider the integer number line. There are two dots on this line. The L-dot, lecture dot, starts at 0 and the M-dot, me dot, starts at 0 - X where X is the number of days behind on lecture that I currently am. 

Now, the L-dot has a pre-determined moving pattern. It moves foward by one 5 times in a row (weekdays), then does not move for 2 time steps (weekends). It repeats its behavior in perpetuity.

We can model L-dot's movement as: 
	
$L_{d}$ = if (d mod 6 OR d mod 7) = 0 then $L_{d-1}$ else $L_{d-1} + 1$ 

where d refers to the day count; d starts at 0 and, by definition, $L_{0}$ = 0  

We can model M-dot's movement as: 
	
$M_x = M_0 + Z * x$ where $M_x$ is the position of M at day x, $M_0$ is the number of days I am currently behind on lecture, and Z is the average number of day's worth of lecture I plan to consume per day.    

At an average rate of Z days of lecture watcher per time step (day), how many days from now will the L-dot and M-dot meet (i.e., when will I be caught up)? To clarify, if you set Z to 2 that means that you plan, on average, to watch 2 days worth of lecture each day. If Z is 0.5 then you plan to watch 1 day's worth of lecture every 2 days on average.

We seek to find the first value of x for which $M_x \geq L_x$. We can solve this with a simple simulation. Here is some (inefficient) R code to do it:  

	#set these values
	M_init <- -4 #number of days behind on lecture you currently are 
	Z <- 2  #average number of day's worth of lectures you plan to consume per day


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

Now invert that question. How many day's worth of lecture should I watch each day if I want to be caught up in T days?

We compute $L_T$ using the recurrent expression above or more simply: $L_T = T - ( floor(\frac{T}{6}) + floor(\frac{T}{7}) )$. Then, set $L_T = M_0 + Z * T$, and find Z by taking the ceiling of $\frac{(L_T - M_0)}{T}$.  

What if we specify the average number of lectures we watch per day and want to find out how many days it will take to be caught up? Here, we need to adjust our model as such:  


L-dot: $L_{d}$ = if (d mod 6 OR d mod 7) = 0 then $L_{d-1}$ else $L_{d-1} + p_d$ where p_d is the number of lectures on day d. Here, $L_d$ is the total number of lectures given up till and including day d where $L_0 = 0$ by definition.  

$p_d$ is specific to each setting. For example, in medical school $p_d$ is almost always between 2 to 4. Without counting the number of 2-lecture, 3-lecture, and 4-lecture days, the easiest assumption to make is a flat prior on their frequencies - each has an equal chance of appearing for any given $p_d$.  

M-dot: $M_x = M_0 + Z * x$ where $M_x$ is the total number of lectures covered up to and including day x, $M_0$ is the number of lectures that I am currently behind on lecture, and Z is the average number of lectures I watch per day.    

Again, we seek to find the first value of x for which $M_x \geq L_x$. We can make small tweaks to the simulation above to answer this:  

	#set these values
	M_init <- -4 #number of lectures behind you currently are 
	Z <- 2  #average number of lectures you plan to consume each day
	p <- c(2,3,4) #possible number of lectures given each day

	flat_prior <- rep(1/length(p), length(p)) #number of lectures given each day is uniformly sampled from the options provided in p, adjust this probability distribution depending on your prior knowledge of the number of lectures given each day


	L_init <- 0

	L <- c(L_init)
	M <- c(M_init)

	x <- 0

	while (tail(M, 1) < tail(L, 1)){

		p <- sample(x=p, size = 1, prob = flat_prior)

		x <- x + 1
		
		if ((x %% 6 == 0)|(x %% 7 == 0)){

			L <- c(L, tail(L, 1))

		} else{

			L <- c(L, tail(L, 1) + p)
		}

		M <- c(M, (M[1] + x*Z) )


	}

	print(paste0(x, " calendar days from now you will be caught up"))

Likewise, we can now invert this question. How many lectures should I watch each day if I want to be caught up in T days?

We compute $L_T$ using the recurrent expression above or more simply: $L_T = T*p_{ave} - ( floor(\frac{T}{6}) + floor(\frac{T}{7}) )$. Then, set $L_T = M_0 + Z * T$, and find Z by taking the ceiling of $\frac{(L_T - M_0)}{T}$.  

Note that $p_{ave}$ is the expected value of $p$. For a uniform (flat) prior, as we assume here, $p_ave$ is simply the average of the possible values for $p$ specified above. In the sample case of medical school, $p_{ave}$ is 3.  


































