

#number of 1s in binary representation of number


library(tidyverse)
library(scales)

nums <- c(1: 2^10)

getones <- function(X){

	paste(rev(as.integer(intToBits(X))), collapse="") %>% strsplit(., "") %>% table() %>% as_tibble() %>% filter(.==1) %>% pull(n)
}

n.ones <- lapply(nums, function(t) getones(t)) %>% unlist()



data.frame(n=nums, n.ones=n.ones) %>% as_tibble() %>% ggplot(aes(x=n, y=n.ones)) + geom_point(size=2) + geom_line(alpha=0.85) + geom_hline(yintercept = c(1:10), color="grey80", alpha = 0.5)  + theme_minimal() + theme(panel.border = element_rect(color="black", fill="transparent")) + theme(panel.grid=element_blank())  + scale_y_continuous(name="Minimum Hamming Weight", limits=c(0,8), breaks=c(1:8)) + scale_x_continuous(name="Base-10 Number",limits=c(2^0, 2^7), breaks=2^c(1:7)) + theme(axis.text=element_text(size=10), axis.title=element_text(size=16), axis.ticks=element_line(color="black", size=0.7))