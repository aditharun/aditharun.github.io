---
layout: default
---

#### A Barbie theme for R plots

Barbie was a great movie. What if you could make graphics in R that were Barbie-esque?


We need to first define colors that are representative of Barbie. (If we were to do a Ken palette, one possibility would be something like faux fur white, black, racing stripe red, and light blue.) I chose the following colors: plum, mauve, fuschia, bright magenta, and light pink. Then, I set up a theme object with these customizations and called the function `theme_barbie()`. 

```R

colors_barbie <- c(
    text    = '#931E67FF',
    border  = '#C23D91FF',
    light   = '#F4C3DFFF',
    medium  = '#E56FAAFF',
    dark    = '#D032A6FF'
)

theme_barbie <- function(...){



  #set custom theme elements
  ggplot2::theme(
        panel.grid = element_blank(),
        text = element_text(color = colors_barbie["text"]),
        plot.title = element_text(size=20, hjust=0.5),
        panel.background = element_blank(),
        panel.border = element_rect(fill = "transparent", color = "white"),
        axis.line = element_line(color = colors_barbie["border"], linewidth = 1),
        axis.title = element_text(size=18),
        axis.text = element_text(size=12,color = colors_barbie["text"]),
        axis.ticks = element_line(color = colors_barbie["border"]),
        legend.background = element_blank(),
        strip.background = element_rect(fill = "transparent", colour = colors_barbie["border"]),
        strip.text = element_text(colour = colors_barbie["text"]),
        ...
       )
}

```

And, this is what a sample Barbie style-figure looks like: 

```R
library(tidyverse)
ggplot(mpg, aes(class, cty)) + geom_boxplot(color = colors_barbie["border"], outlier.alpha = 0, fill = colors_barbie["light"]) + labs(title = "", x = "Vehicle Class", y = "Mileage") + geom_jitter(width = 0.05, color = colors_barbie["dark"], alpha = 0.85) + theme_barbie()

```

![<img src="barbie-plot.png" width="50"/>](/posts_code/barbie-plot.png)

Looks Barbie-like! With this setup, we can swap out the color palette and do this for other movies, TV, and media. All you have to do is replace the hex color codes for `text, border, dark, light, and medium` in `colors_barbie`. 


















