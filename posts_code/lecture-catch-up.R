
#feed in these values
M_init <- -4
Z <- 2

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


