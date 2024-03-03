---
layout: default
---

### Quantifying hair density and coverage over time

During spring 2022, [Marc](https://www.linkedin.com/in/marc-d-mello) and I put together an app that allows you to monitor and measure your hair density and coverage over time and track it in response to different therapies (e.g., shampoos, medications). 

Basically, you take a picture of the top of your head, we compute the area of your scalp that is covered with hair and track this metric over time. We allow you to label each measurement with the therapies you are on at the moment so you can figure out if things are working for you or not and adjust accordingly. This can also help companies developing new hair loss strategies roll out more accessible remote decentralized trials making patient recruitment and monitoring easier. 

Pictures are stored in-app to avoid polluting your camera roll. This is meant for people concerned about their hair thinning. In 18-49 year old men, the proportion of men with moderate to extensive hair loss is about 42% [Rhodes et al](https://pubmed.ncbi.nlm.nih.gov/9865198/). That's ~43 million Americans. 

A demo of the app can be found [here](https://www.youtube.com/watch?v=4mOnFqH24XQ). 

The primary technical problem here is developing a good ML model to do image segmentation of hair from scalp. 

A natural extension of this is turning primarily qualitative health values into quantifiable metics that can be tracked with consistent and standardization. For example, skin mole growth for melanoma, belly volume in profile for weight management, and wound healing progress.