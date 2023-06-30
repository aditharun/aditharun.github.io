---
layout: default
---

#### Scholar Trends: Visualizing publication trends for scientists using google scholar data

Scholar Trends is an R Shiny app I created that takes, as input, a person's google scholar url and outputs a set of graphics summarizing their indexed publication history. 

ScholarTrends adds transparency to a scientist's publication history. Google scholar provides a list view with no representation of publication trajectory or journey outside of a few global summary statistics (e.g., h-index) that do not capture a scientists record. The graphics created by this app aim to better characterize and summarize a scientist's publication trends over time.

Here is a demo of the app: 

<iframe width="560" height="315" src="https://www.youtube.com/embed/cZQcAU8D-BM" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share; modestbranding" allowfullscreen></iframe>

The output graphics are: 
* a) plot of the number of publications published each year
* b) plot of the running cumulative number of publications published each year (the final point is the total number of publications)
* c) ranked list of the most frequently published journals for that author
* d) chart of the total number and percent of publications where the author is listed as a 1st, 2nd, 3rd, and 4th author (separate bar for each one)
* e) plot of the number of citations the author had each year
* f) plot of the running cumulative number of citations each year
* g) heatmap of most frequently published in journals (overall) by year - entries are colored on a grayscale according to the number of publications published in that journal in that given year

Not all data here is for papers. All indexed items on google scholar are considered to be publications. Google scholar indexes lots of article types including peer-reviewed scientific papers, conference abstracts, preprints, and patent documents. 

There are some problems with hosting this app on a server that boil down to the `GET` requests sent to scholar.google.com to collect the data. For a short writeup on this please see the [problems with deployment]((https://github.com/aditharun/gs-profiler)) section. I still need to solve this problem. However, running this app locally on your own computer works perfectly - simply download the code (here)[https://github.com/aditharun/gs-profiler] and follow the instructions on the landing page (takes <1 min). 

Here are some of my takeaways after using this app to look at some of my mentors, scientists I've worked with, and scientists I look up to but have never met. Everyone starts at zero. And, in the beginning, there are many years of few publications and then there is a steep increase in output. For scientists currently publishing at a high rate, their lifetime graph of publications per year resembles a logistic S-curve. They may be an endowed chair of a department with a large lab and spinoff companies, but they started off just like everyone else - from scratch, tried many things, and eventually found the intersection of what they loved and what they could add value to. Most of these scientists started with many first and second author works. All together, on average, about 15-20% of their total contributions come from such lead authorships. Citations follow publications, meaning that as publications/year increase so too does citations/year with a couple year time delay. Citations are one measure of impact and so this finding supports the notion that such scientists do not improve their success rate over time but instead increase output while holding a constant success rate (see [take more at bats](https://fictivekin.github.io/pmarchive-jekyll/age_and_the_entrepreneur.html)).

This app can also be useful in helping assess whether a given scientist may be the right person for you to work with, particularly for trainees (undergrads, graduate students, etc.). This is obviously no substitute for talking to the scientist and figuring out if the vibes are a match. Each trainee has their own criteria of what they are looking for and ScholarTrends is a tool to assist them in their search.










