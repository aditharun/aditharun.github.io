---
layout: main
---

#### Guessing numbers on the 1-100 interval

Consider the numbers 1 to 100 inclusive. You get six guesses to guess the number I picked on this interval. After each guess, I will tell you if my number is higher or lower than your guess. The dollar payouts are (5, 4, 3, 2, 1, 0, -1, -2, -3) dollars if you guess the number on guess number (1, 2, 3, 4, 5, 6, 7, 8, 9). So, if you guess the number after 6 guesses, you need to pay me. 

This is the game Microsoft's Steve Ballmer would propose to interview candidates. Let's approach it. 

First, as with any game, we need to figure out if we should even bother playing the game. How often can we get his number within 6 guesses? What is the expected value of this game? 

What is the optimal strategy? Intuitively, the most consistent strategy to get the number is to deploy a binary search like approach since we are given information about whether the number is higher or lower each time meaning we can halve our search interval with each guess. We should always guess 50 first, then if he says lower, guess 25, then if he says higher, guess 38, then if he says higher guess 44, then if he says lower guess 41, then if he says higher guess 43, and if that is not his number you know his number is 42. We are garaunteed with this approach to get the result within $\lceil log_{2}(100) \rceil$ or 7 guesses. So, we, at worst, are going to lose 1 dollar. We can get the number in six guess if we happen to guess the right number on the sixth guess or not. It's a 50-50 chance every time. In our example, we could have chosen 42 on the sixth guess instead of 43 by chance and gotten the answer in six. Note that the numbers 1 and 100 are guessable with 7 guesses (e.g., the flow of guesses for 1 would look like 50, 25, 13, 7, 4, 2, 1). 

Consider that Ballmer has likely thought through this too. How might he pick numbers? Our strategy is known to him since binary search in this setting is openly known to be the best approach. What numbers can he pick that are trap numbers - numbers that garauntee we get the result in six or seven guesses?

How many trap numbers exist on the interval 1-100? Note that 42 and 43 are such numbers. So too is 39 and 40 as well as 36 and 37. The pattern here is that every multiple of three and the next integer are trap numbers. Only number with a remainder of 2 when divided by 3 are non-trap numbers. 33 of the 100 numbers are non-trap numbers. That makes 69 trap numbers -- 67 trap numbers plus the 2 trap numbers on the bounds (1 and 100). This approximately results in losing half a dollar 69% of the time (i.e., lose either 0 or 1 dollars). 


The expected value of this game is $0.01\cdot5 + 0.02\cdot4 + 0.04\cdot3 + 0.08\cdot2 + 0.16\cdot1 - 0.69\cdot0.5$ or 0.23. Suprinsingly, it is very slightly positive. Conventional widsom would tell us to play since expected value is above zero. But, we need to re-remember that Ballmer is smart and the strategy we will use is easy to infer. Since he gets to pick the number, he can choose the number that garauntees him to lose no money and a 50% chance of gaining a dollar. A riskless dollar payout for him. He simply has to choose of these 69 numbers. Playing this game with him multiple times is futile since he can just keep hiding and winning off these numbers. 

We have no agency and our approach is transparent. Aside from a new strategy that we can come up with, we should not play this game. On the other hand, if you can find somebody who wants to play this game with you and try guessing, take them up on it. 

