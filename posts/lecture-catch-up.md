---
layout: default
---


### Catching Up on Lectures

Suppose that every weekday there are lectures. You are trying to keep up but are currently X days behind on lecture. To catch up with lectures Y days from now, how many lectures per day must you watch?

We assume that any computation related to the above question happens every day at night. This makes notation easier. If today is Tuesday and you are two days behind on lecture, then you have both Monday and Tuesday lectures to catch up on. 

Imagine a number line labelled at each integer. There are two players or dots on this line. The dot labeled 'L' for lecture starts at 0 and the dot labeled 'M' for me starts at 0 - X where X is the number of days behind on lecture that I currently am. 

Now, the L-dot has a pre-determined moving pattern. It moves up by 1 for 5 times, then by 0 for 2 times, and repeats its behavior in perpetuity. This models lectures being on weekdays and never on weekends. The M-dot has agency. We can now ask: 

	- At an average rate of Z moves (lectures) per time step (day), at what value will the L-dot and M-dot meet? This number is the number of days from now that I will be caught up.

	- If I want to be caught up in T days, what must my average rate of movement be per day?

We can model the L-dot's movement as such: 
	
	$$L_{x} = if (x mod 6 | x mod 7) = 0 then L_{x-1} else L_{x-1} + 1$$ 

x refers to the day count, starting at 1 where $$L_0 = 0$$

We can model the M-dot's movement as such for the first question: 

	- M_x = M_0 + Z*x where M_d is the position of M at day x, M_0 is the number of days behind to start, and Z is the average number of lectures consumed per day


Let us tackle the question of: given an average rate of lecture catch up per day, how many days from now will I be caught up? We seek to find the first value of x for which M_x >= L_x. We can solve this with a simple simulation. 


Let us tackle the question of: what should my average rate of lecture catch up per day be if I want to be caught up in T days. We compute L_T, set L_T = M_0 + Z * T, and find Z by taking the ceiling of (L_T - M_0)/T. 

#WE assume this starts on a monday for our counter, what if we start on a thursday!!


Suppose I do not adhere to the calculated rate of Z per day. Say, I falter and do zero one day or step up and do a ton one day, can we update my rate to account for this? or estimate a new time I will catch up?

Adith Arun
November 2022

[back](./)