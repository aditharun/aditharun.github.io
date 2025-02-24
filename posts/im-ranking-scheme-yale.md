---
layout: default
---

#### Glimpse into an internal medicine ranking scheme

The program director for Yale's internal medicine residency wrote a [post](https://medicine.yale.edu/news-article/recruitment-is-everything/) explaining parts of his process for ranking applicants. 

Here are the columns and what I think they stand for. I have no idea if I'm right or wrong, just my best guess. 

![<img src="rank-snippet-yale.png" width="50"/>](/posts_code/rank-snippet-yale.png)

Column F - SclSr - School Score - 1-5 rating
Column G - Clin - Clinical Performance - 3 is presumable upper bound
Column H - Step2 - Step 2 score - score from 1 to 300 with most > 220
Column I - Res - Research - 1-5 rating
Column J - Vol - Volunteering (+ possibly other extracurriculars) - 1-5 rating
Column K - PS - Personal Statement - 1-5 rating
Column L - AD - Additional Data or possibly adversity - 0-2 rating
Column M - AOA - AOA status - 0, 0.5, or 1
Column N - GH - Gold Humanism Honor Society status - 0, 0.5, or 1
Column O - AWRD - Awards - 0-2 rating
Column P - Int - Interview - 1-5 rating
Column Q - Dist T - Distinguished track (research or global health certificate?) or thesis with honors or institutional or local ties (per chatgpt o1) - 0 or 1
Column R - Disc - Discretionary or Discussion or Decision - 0 or 1
Column S - SA - Spouse Application (this is the one I am least confident about) - Not factored into formula posted

Here is the formula shared: 
	=F2:F567*100+(G2:G567^2)*50+((H2:H567)/2)^1.25+(I2:I567^1.75)*15+(J2:J567^1.75)*15+(K2:K567^1.75)*5+ L2:L567*5+ M2:M567*10+ N2:N567*10+ O2:O567*10+(P2:P567^1.75)*125+ Q2:Q567*100+R2:R567*100

So, this is what it may represent: 

School Score * 100 
(Clinical Performance ^ 2) * 50
(Step 2 Score / 2)^1.25
(Research ^ 1.75) * 15
(Volunteering ^ 1.75) * 15
(Personal Statement^ 1.75) * 5
Additonal data * 5
AOA status * 10
Gold Humanism status * 10
Awards * 10
(Interview ^ 1.75) * 125
Distinction Track * 100
Discretionary * 100

School score ranges from 100 to 500
Clinical performance ranges from 0 to 450
Step 2 score (220 - 280) ranges from 356 to 481
Research ranges from 15 - 250
Volutneering ranges from 15 - 250
Personal statement ranges from 5 - 84
Additional data ranges from 0 - 10
AOA ranges from 0 - 10
Gold Humanism ranges from 0 - 10
Awards ranges from 0 - 10
Interview ranges from 125 - 2089
Distinction Track franges from 0 - 100
Discretionary ranges from 0 - 100

So, we can see that interview, school score, clinical performance, step 2, research and volunteering in that order are the most important factors in determining your rank on the programs list. 


Now, this is for applicants that were interviewed. The methodology to choose applicants to interview is not clear. 


