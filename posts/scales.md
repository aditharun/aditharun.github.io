---
layout: default
---

#### Getting a feel for the logarithmic scale

A pH of 6 is 10 times more acidic than a pH of 7. Starting from a pH of 7, what would a pH 5 times more acidic be? Conceptualizing the relationship between a logarithmic and linear scale for incomplete base powers (e.g., not an integer power of 10 for the pH scale) is unintuitive for me. Maybe we can understand this a little better by playing around with a simple system like pH.

Logarithmic scales are often used to visualize and model data. Take for example the common $-log_{10}(x)$ transformation of p-values used in genomics and medical research. So, getting a feel for the logarithmic scale is not a totally vain exercise.

Let's define our pH transform. For ease of notation, we represent pH as $y$ and the concentration of hydrogen ions as $h$. So, $y(h) = -log_{10}(h)$.

  data.frame(h = 10^c(0:-14)) %>% mutate(y = -log(h, base = 10)) %>% ggplot(aes(x=h, y=y)) + geom_point() + theme_minimal() + theme(panel.grid = element_blank(), panel.background = element_blank(), panel.border = element_rect(color = "black", fill = "transparent")) + ylab("pH") + xlab("[H+]") + theme(axis.title = element_text(size = 16), axis.text = element_text(size = 14), axis.ticks = element_line(color = "grey20")) + scale_y_continuous(breaks = scales::pretty_breaks(14))

We are interested specifically in understanding what the new pH, $y$, is if the initial hydrogen ion $h_{i}$ concentration changes by a factor of $x$. Well, $h_{i} = 10^{-y}$, $h_{f} = h_{i} * x$, and $y_{f} = -log_{10}(h_{f})
