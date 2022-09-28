---
layout: post
---

<!--Written Jan 2022. -->


### Investigating the convergence in distribution of the sum of two dice rolls

_"If the four didn't roll as much for you as it did, I would have won"._
Things like this are said all the time after a game of Catan. 
Traditionally, we expect that 7s are rolled twice as often as 4s because there are six different ways to roll a 7 but only three to roll a 4. 
This distribution we expect is theoretical and true only in the limit. 
What is this limit when the empirical distribution of the sum of two dice rolls converges to the theoretical distribution? 
Is it 10 rolls? 100? 1000?  

Most people implicitly assume that this holds in games like Catan,
and their decisions reflect that. In my experience, a Catan game with four players takes 60 to 90 rolls. Does basing our decisions on the theoretical two-dice roll distribution make sense? Is this a good simplifying assumption to make?

Here is one realization of the outcomes when two dice are rolled 70 times. 

![Realization_Two_Dice_Rolls](/posts_code/catan_dice_instance.png)

There is significant deviation from the theoretical distribution. For instance, notice that a 2 was not rolled in 70 tries. And, both 3s and 4s were ooverrepresented whereas 8s were grossly underrepresented. In fact, for the most part, there appears to be no real relationship between the empirical (red) and theoretical (blue) frequencies. 

<!--necessary?-->
As a quick aside, the law of large numbers ~basically~ holds even at 70 rolls.
Across 100 70-roll games, the 95% empirical quantiles for the mean roll value is (6.48 to 7.47). Though it roughly holds, it tells us only of the mean of the distribution, not the actual distribution itself - which is what we care about when making decisions in Catan.

Now, the most important question with respect to Catan and other such two dice based board games is at what number of rolls does the empirical distribution of dice outcomes effectively equal the theoretical or expected distribution.

We can assess this convergence. First, we simulate an _n_-roll game and note the empirical probabilities. We can measure the deviation of this realization to the theoretical probabilities by looking at the largest absolute difference between the two cumulative distribution functions, the Kolmogorov-Smirnov (KS)statistic. The larger the KS value, the more deviant the empirical dice sums are from the theoretical. Doing this across for many _n_-roll games, repeating it 100 times at each _n_, we observe: ![KS_Catan](/posts_code/catan_ks.png)

The KS statistic decreases as a function of the number of dice rolls - an expected result. Further, we observe that the variance (approximated by the height of the boxes in the boxplot) increases as the number of rolls decreases - another expected result. Between 100 and 200 roll games, there appears to be a plateau in convergence to the theoretical probabilities. For our purposes, 50 and 75 dice rolls produce sums that are indeed quite different from the theoretical levels. 

So, what does this mean for Catan-like games? I would argue that less emphasis be placed on the theoretical probabilities of rolling a number because of the stark divergence from expectation in 70-roll games. Take advantage of the increased variance in these games and play a little more freely. 

I would be less likely to shy away from placing settlements on 4s and 10s. 



Adith Arun
Jan 2022


[back](./)







