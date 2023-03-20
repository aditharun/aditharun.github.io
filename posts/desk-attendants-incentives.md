---
layout: default
---

#### Structuring a model for desk attendants at help desks in airports

I flew JetBlue from JFK to PUJ (Punta Cana, DR) with a layover in San Juan, Puerto Rico both ways. The flights were moved 11 times between both trips. We were informed by email each time with the new departure time. 

The main inefficiency I see is in the pre-TSA help desk experience. Staff at all three airports moved with little urgency despite long lines and ansy travellers with flight plans that were constantly being changed. The pace at which the agents moved in this setting was slow. I do not blame them - it is impossible to be alert and efficient all the time. But, maybe there are incentives we can insititue to motivate a better customer experience.

I have no idea how the compensation for airline employees are structured, but these are my thoughts. 

How would we structure an incentive program? Well, what outcome do we want. We want each agent to see as many people as they can so that the wait in line is never too long and people can have their time-sensitive flight problems addressed. An incentive structured strictly on throughput will lead to behavior where customers with more intricate or time consuming problems are left behind. We want to minimize wait time in the help desk line and also the number of customers with problems that are ultimately ignored. 

One solution would be to measure time spent with each customer and tag the complexity of each problem. Therefore, for each agent, we define a pair $(t_i, c_i)$ for all $i = 1:n$ customers they see each day where $t_i$ is the time taken to resolve the problem and $c_i$ is the complexity of the problem. More complex problems are assigned a larger $c_i$ value. Assigning complexity scores is an entire subproblem by itself, one we will not investigate here. 

How could we ensemble this data into a single metric of productivity that can be used to assess each agent? We will define a productivity measure $P(x)$ for each agent $x$ where higher $P(x)$ corresponds to more productive agents. Some options for $P(.)$ are: 
	a) $\sum_{i=1}^{n} \frac{c_i}{t_i}$
	b) $\frac{\sum_{i=1}^{n} c_i}{\sum_{i=1}^{n} t_i}$
	c) $median(\frac{c_i}{t_i})$
	d) $\frac{median(c_i)}{median(t_i)}$ 

Option A takes the average ratio of complexity to time for each customer an agent sees in a day. Option B takes the ratio of the average complexity to the average time for each customer an agent sees in a day. Option C and D are the exact analogoues of A and B respectively, but uses a median instead of an average. I prefer to use the median because it is more robust to outliers than the mean. And, when thinking about the desk attendants, I can imagine that there will be a customer or two each day that take much longer than expected for any number of reasons. 

Are there factors that influence $P(x)$ that are out of the control of the agent $x$? Sure. There is variation in customer behavior and attitude, agents can feel tired, etc. We can account for this by measuring $P(x)$ every shift the agent works in a given period (e.g., month) and throw away the bottom Y% (e.g. 3%) of scores. This allows for bad days. Those without bad days (i.e., consistent performance) conversely should be rewarded. We can measure var(P(x)) in a given period to establish this measure. 

So, what is our net metric $M_T(x)$ for a given period T? We have $P_1(x), P_2(x), ..., P_T(x)$ and $V(P(x))$ to work with. One possible choice for $M_T(x) is $$\frac{\sum_{i=1}{T}(P_i(x))}{V(P(x))}$ which takes into account the individual $P_i(x)$ performances and rewards workers with lower variance. Thus, those with higher $M_T(x)$ should be compensated more. 

From here, we have data that we can tie to monetary compensation. Those with higher M(x) should be compensated better. This can be structured as a base salary for all agents like realtors and then the opportunity to add to that pay considerably with a metric-based pay option. 

One thought on how to pay out based on M(x) measurements is to rank order all employees in a given airline at a given airport from 1 to n by their M(x) outcomes. Person with the highest M(x) gets rank 1 and so forth. Assume we have alloted P dollars for the total bonus pool for these employees. Now, we need to assign weights $w_i$ for each employee such that $\sum_{i=1}^{n}w_i$ = 1$ and $w_j \geq w_k$ if $M_j(x) > M_k(x)$. How to choose these weights is another topic, one we can explore later.   


