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

