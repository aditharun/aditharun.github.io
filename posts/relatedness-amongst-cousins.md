---
layout: default
---

#### Relatedness amongst cousins

Let's think about how much DNA two people share based on their connection within the family tree. Then we'll arrive at a formula to determine how much DNA you share with any given cousin.  

We assume that if two people share the same biological parents, then they share 50% of their DNA. This is an approximation and not always true, but more or less it works. (Even at random humans share a lot of base-pair similarity, but here we refer to shared genetic material in the coloquial popular science way)

My mother and her siblings share 50% of their DNA. My mother's siblings childrens share 25% of their DNA with my mother. Note that I share 50% of my DNA with my mother. Therefore, I share 12.5% (0.25 * 0.5 = 0.125) of my DNA with my mother's siblings children, or first cousins. **Any two first cousins share 12.5% (1/8) of their genetic material**

Now, let us consider second cousins. We know that your father and his first cousin share 12.5% of their genetic material. Your father's first cousin's (your uncle's) children share 6.25% (0.125 * 0.5) with your father. **This means you and your second cousins share a mere 3.13% (1/32) of genetic material.** 

We can start to see a pattern emerge here. Let $i$ represent the degree of cousin, with siblings being $i = 0$. Then, the amount of genetic material two people of degree $i$ share is $(1/2)^(2i + 1)$.  