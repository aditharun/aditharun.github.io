library(tidyverse)

set.seed(1498)

dice.vals <- c(1:6)
prob.val <- 1/length(dice.vals)
prob.vector <- rep(prob.val, length(dice.vals))


simulateTwoDiceOutcomes <- function(n.rolls=70, dice.vals=dice.vals, prob.vector=prob.vector){

	roll1 <- sample(x=dice.vals, size=n.rolls, replace=TRUE, prob=prob.vector)
	roll2 <- sample(x=dice.vals, size=n.rolls, replace=TRUE, prob=prob.vector)

	sim_roll <- roll1 + roll2

	return(sim_roll)
}


adjust_prob <- function(sim_roll, n.rolls){
	#empirical frequencies
	e.freq <- table(sim_roll) %>% as_tibble() %>% rename(value=sim_roll) %>% type.convert(as.is=TRUE)

	#theoretical probabilities for two-dice rolls going from values 2 to 12
	theory.probs <- c(1, 2, 3, 4, 5, 6, 5, 4, 3, 2, 1)/36
	th <- data.frame(value=2:12, theory=theory.probs)

	#join empirical results with theoretical values
	#account for values not rolled in the empirical sim
	df <- left_join(th, e.freq, by=c("value"="value")) %>% mutate(n=ifelse(is.na(n), 0, n)) %>% mutate(emp=n/n.rolls) %>% select(-n)

	return(df)
}

sim_roll <- simulateTwoDiceOutcomes(n.rolls=70, dice.vals=dice.vals, prob.vector=prob.vector)
df <- adjust_prob(sim_roll=sim_roll, n.rolls=70)
#visualization
#show as animation? or show a still image?
dice.fig <- df %>% pivot_longer(-value, names_to="type", values_to="prob") %>% ggplot(aes(x=value, y=prob, color=type)) + geom_point(size=2) + theme_bw() + xlab("Sum of Two Dice Rolls") + ylab("Probability") + labs(color="")

#one hundred simulated 70-roll games, does LLN hold?
means <- unlist(lapply(1:100, function(x) simulateTwoDiceOutcomes(n.rolls=70, dice.vals=dice.vals, prob.vector=prob.vector) %>% mean() ))

quantile(means, c(0.025, 0.975))

#measure deviation from theoretical distribution

#cdf area difference, library(pracma) for this
#area_diff <- abs(trapz(df$value, cumsum(df$theory)) - trapz(df$value, cumsum(df$emp)))

#cdf ks distance
ks.calc <- function(df){
	diff <- abs(cumsum(df$theory)-cumsum(df$emp))
	ks <- max(diff)

	return(ks)
}

n.dice.rolls <- c(10, 25, 50, 75, 100, 125, 150, 175, 200, 500, 1000)

outcomes <- lapply(n.dice.rolls, function(x) unlist(lapply(1:100, function(y) simulateTwoDiceOutcomes(n.rolls=x, dice.vals=dice.vals, prob.vector=prob.vector) %>% adjust_prob(n.rolls=x) %>%  ks.calc())) )

outcomes.df <- do.call(cbind, outcomes) %>% as_tibble() %>% magrittr::set_colnames(n.dice.rolls)


long.outcomes <- outcomes.df %>% mutate(iter=1:n()) %>% pivot_longer(-iter, names_to="# of dice rolls", values_to="ks") 

#figure of ks statistics as a function of dice rolls, 100 iterations each
 ks.fig <- long.outcomes %>% mutate(`# of dice rolls`=factor(`# of dice rolls`, levels=n.dice.rolls)) %>% ggplot(aes(x=`# of dice rolls`, y=ks)) + geom_boxplot() + theme_bw() + geom_hline(yintercept=0, color="red") + ylab("KS Statistic")

ggsave(dice.fig, filename="catan_dice_instance.png", units="in", width=4, height=4, device="png")

ggsave(ks.fig, filename="catan_ks.png", units="in", width=6, height=6, device="png")

#distribution of empirical outcomes in 70 roll games
results_70rolls <- lapply(1:1000, function(x) simulateTwoDiceOutcomes(n.rolls=70, dice.vals=dice.vals, prob.vector=prob.vector) %>% adjust_prob(n.rolls=70) %>% mutate(game=x) )







