---
layout: default
---

#### Testing for "statistically significant" differences between groups: code and some theory

Clinical medical research often involves the following setup: There are a number of patients for which we collect a bunch of clinical data and record their condition status. The condition status is categorical and represents the key response variable of interest. It is often binary (e.g., "got sepsis", "did not get sepsis"). For each clinical variable, we are often interested in comparing the distribution of that variable as a function of the response variable. We can understand how the distribution of the variable changes as a function of the response variable by visualizing it (e.g., boxplot for each response variable option), summarizing it into a metric (e.g., likelihood ratios), or computing a p-value that captures whether the differences between groups for a given variables is "statistically significant".

If we assume that the data is drawn from a normal distribution, which is an okay assumption according to the law of large numbers if we have a large sample size, then we can use a t-test. [Carey Priebe](https://engineering.jhu.edu/faculty/carey-priebe/), who taught the applied math 730 course statistical pattern recognition I took my junior year at Hopkins, made me a fan of non-parametric tests for hypothesis testing. Why assume the data is normal, especially when sample size is small in a decent amount of clinical research applications? Instead, use a [Wilcoxon rank-sum test aka Mann-Whitney U test](https://en.wikipedia.org/wiki/Mann%E2%80%93Whitney_U_test) for non-matched samples and [Wilcoxon signed-rank test](https://en.wikipedia.org/wiki/Wilcoxon_signed-rank_test) for matched samples.

Non-parametric tests are less sensitive than their parametric counterparts when the parametric tests' assumptions are met. In these instances, this means that larger differences between the groups are needed before the null hypothesis can be rejected by a non-parametric test. We are more likely to commit a type II error (fail to reject null when the null is false) which is, in my opinion, the best type of error to make - we would rather be conservative and only call things different when the difference is large rather than call them different when we see any small amount of difference.

Before doing any test, we should set a threshold p-value $\alpha$ below which we deem the difference "significant". Usually, $\alpha$ is set to 0.05 or 0.01 and represents the probability of making a type I error. At $\alpha = 0.05$, we reject the null hypothesis when it is in fact true 5% of the time. Smaller $\alpha$ values minimizes the risk of incorrectly rejecting the null hypothesis. It is conservative to choose small values for $\alpha$. Choose small $\alpha$ values to be more certain that the things you term as "significantly different" are in fact different.  

For testing whether a single variable is sufficiently different between groups, the above choice of $\alpha$ is appropriate. But, we are testing multiple variables. We are testing multiple hypotheses.

We need to adjust our threshold for what we deem as significant. It can no longer be 0.05, or 0.01 or whatever $\alpha$ we chose above when considering a single test. If we test enough variables, some of them are bound to be different. How do we perform a multiple hypothesis testing correction? At base, I would recommend we use either the Benjamini-Hochberg (BH) correction or the Bonferroni correction.

How to do a Bonferroni correction? Take the $\alpha$ you set for a single test and divide it by $n$, the number of total hypotheses (i.e., variables) you tested. Very simple. Any p-values less than $\frac{\alpha}{n}$ are significant.

How to do a BH correction? Rank the p-values in increasing order such that the smallest p-value is given a rank of 1 and the largest is given a rank of $n$. Calculate the BH critical value for each p-value by $\frac{r}{n}Q$ where $r$ is the rank, $n$ is the total number of tests, and $Q$ is the false discovery rate that you chose a priori. Find $r_{crit}$, the rank of the largest p-value that is less its BH critical value. All ranks equal to and less than $r_{crit}$ are deemed significant. The false discovery rate, $Q$, is the proportion of variables where we mistakenly reject the null - the ones that are just "noise". A good value for $Q$ may be 0.05 but this really depends on your field and specific problem. Choose $Q$ before observing your data.

The Bonferroni correction is preffered when you want to be as conservative as possible and try to limit the existence of false positives in your results. If you are testing lots of hypotheses (large $n$), then this correction will likely lead to a high rate of false negatives. The BH correction is less punishing, we will have some more false positives but less false negatives. The choice of correction is a personal one and depends on the problem statement. I would add that if you want to be more certain that the variables you call "significantly different" are in fact different, choose the harsher Bonferroni.

So, we can write some code that takes in a response column and a variable column, and computes an unpaired two-sample Wilcoxon or t-test test statistic and p-value based on what the user wants.

```
  library(tidyverse)

  test_hypothesis <- function(df, var, response, type = "wilcox"){

    data <- df %>% select(!!sym(var), !!sym(response)) %>% group_by(!!sym(response)) %>% group_split()

    if (type == "wilcox"){
      stat <- wilcox.test(data[[1]][[var]] , data[[2]][[var]], alternative = "two.sided", paired = FALSE)
      tstat <- stat$statistic[["W"]]
    } else{
      stat <- t.test(data[[1]][[var]], data[[2]][[var]], alternative = "two.sided", paired = FALSE)
      tstat <- stat$statistic[["t"]]

    }

    data.frame(variable = var, response = response, test_statistic = tstat, p_value = stat$p.value)


  }
```

Now, assume you have an excel file with the data. There are multiple sheets, each with one response variable and many columns with variables to test. We want to read all that data in, and then test those hypotheses.

```
    library(tidyverse)
    library(readxl)

    #read all excel data in
    #filepath is the path to file
    #n.sheets is the number of sheet in the excel file
    get_excel_data <- function(filepath, n.sheets){

      lapply(1:n.sheets, function(x) read_excel(path = filepath, sheet = x) %>% mutate(sheet = x))

    }


    #wrapper function for testing all the hypotheses for a given sheet's worth of data
    #response is the name of the response variable as a character
    #type is the type of test to run - either "t" or "wilcox"
    wrap_test <- function(df, response, type = "wilcox"){

      vars <- setdiff(colnames(df), c(response, "sheet"))

      lapply(vars, function(x) test_hypothesis(df, x, response, type)) %>% do.call(rbind, .) %>% as_tibble() %>% mutate(sheet = unique(df$sheet))

    }

    #multiple hypothesis testing correction
    #alpha is single test alpha
    #correction is either bonferroni or benjamini
    #fdr is the false discovery rate which only needs to be set if correection_type is benjamini
    mult_test <- function(df, alpha, fdr = 0.05, correction_type = "bonferroni"){

      n <- nrow(df)

      if (correction_type == "bonferroni"){
        df %>% mutate(thresh = alpha / n) %>% filter(p_value < thresh)
      } else{
        df %>% arrange(p_value) %>% mutate(rank = 1:n()) %>% mutate(bh_crit = (rank/n)*fdr) %>% mutate(diff = bh_crit - p_value) %>% filter(diff > 0) %>% select(-diff)
      }

    }

    filepath <- "path/to/excel/file"
    n <- 12 #or whatever the total number of sheets is
    response_name <- "name of response column, make it standard across sheets"
    test_type <- "wilcox" #or t if you want to do t-test
    single_test_alpha <- 0.01 #or whatever the single test threshold you want is
    FDR <- 0.05 #false discovery rate, only needed if BH correction used
    correction_method <- "bonferroni"
    data <- get_excel_data(filepath, n)
    results <- lapply(data, function(x) wrap_test(x, response_name, test_type)) %>% do.call(rbind, .) %>% as_tibble()
    adjusted <- mult_test(df = results, alpha = single_test_alpha, fdr = FDR, correction_type = correction_method)
```

Run the following code in R (make sure you have installed readxl and tidyverse packages before) and it will read in an excel file with many sheets, compute p-values, and correct for multiple tests. It spits out a dataframe with the variable names, sheet it was found on, p-value and test statistic value for each "significantly" different variable.
