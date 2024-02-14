---
layout: default
---

#### Proteomics for ASCVD Risk Assessment

[Helgason et. al, 2023](https://jamanetwork.com/journals/jama/fullarticle/2808522) developed a proteomics-based approach for predicting risk of atherosclerotic cardiovascular disease (ASCVD). Let's take a deeper look at this paper. 

There were two cohorts to which they built and deployed their models. In cohort 1, they looked at 13,540 Icelandic individuals with no history of major ASCVD events at recruitment and the end-point considered was the first major ASCVD event (myocardial infarcation, ischemic hemmorraghic stroke, coronary heart disease-related death). A plasma sample was collected under non-fasting conditions for proteomics and other assays (e.g., SNP array/NGS for polygenic risk scores). Plasma sampling was done from 2000-2006 and follow-up was continued till 2018. In cohort 2, data was collected from 6,791 participants with stable ASCVD receiving statin therapy and the end-point was a secondary ASCVD event. Here, participants fasted for at least 9 hours before plasma collection. 

Before interpreting the modeling results, let us understand their modeling approach. Some simplifications have been made to give a high-level overview to non-statisticians. Consider cohort 1. They randomly performed a 70-30 split of the participants. The model was trained on 70% of the data and evaluated on the 30% of the data. A Cox-Lasso modeling approach was implemented. A Cox proportional hazards (CPH) model, often used in survival analysis, captures the relationship between measured variables and the hazard rate for censored data. The hazard rate here is the probability of a ASCVD event occuring at a given time conditional on the fact that it has not happened before. So, in a CPH, we estimate the coefficients ($\beta$) for each of these variables which determines how the hazard rate changes as a function of the underlying variable. For a given set of estimated coefficients, we can compute the negative partial likelihood ($-\ell(\beta)$) which measures how well that speicfic CPH model fits the observed training data. The better the fit, the smaller the negative partial likelihood. But, we have thousands of variables. The more variables we use, the better we will be able to fit the training data and the more likely we are to be overfitting. So, as a check against this, they set up a Lasso penalty where the penalty is proportional to the absolute values of the coefficients. This means that models with less variables are perferred and given less penalties. So, instead of just minimizing $-\ell(\beta)$, we now $\arg \min_{\beta} -\ell(\beta) + \lambda \sum_{j=1}^{p} \lvert \beta_{j} \rvert$. Thus, we acheive simultaneous coefficient estimation and variable selection. The $\lambda$ term is the "harshness" of our Lasso penalty and we need to find a best $\lambda$. They do this with a 10-fold cross-validation setup (split the training data into 10 equal groups and train the model with different $\lambda$ values on 9 of the groups or "fold" and assess the quality of the choice on the 10th group) (see eFigure 2 in Supplement 1). 

There are many different types of models they estimated within this Cox-Lasso framework. They reported a) clinical risk factors + proteomics + polygenic risk scores, b) clinical risk factors + polygenic risk scores, c) clinical risk factors, d) age and sex, e) proteomics + age + sex. When using proteomics, a subset of 70 proteins was selected from the 4963 proteins. A repeated 1000 sample bootstrap revealed which proteins are most likely to appear in the model (i.e., most important) and which proteins have the highest average coefficient weight (eFigure3, Supplement 1). The 10 proteins with the highest weights are NPPB, MMP12, EPOR, WFDC2, ARL5B, GDF15, CD248, MFGE8, PCSK9, CCDC126. This makes some sense biologically for ASCVD risk. For instance, PCSK9 inhibitors are a new class of LDL lowering drugs and PCSK9 degrades LDL-R which affects plasma LDL levels. 

So, how do we evaluate the models? In this case, there are two main ways: Area Under the Curve (AUC) and the Wolber's C-Index (C-index). AUC is a metric that assesses the performance of a binary classification algorithm (i.e., an algorithm that predicts whether an observation belongs to class X {positive} or not to class X {negative}). It is an aggregate measure of performance. The AUC ranges from 0 to 1 and is the probability that the model ranks a random positive observation more highly than a random negative observation. The closer to 1 the better. The C-index measures the ability of a survival model to rank-order pairs of subjects with respect to their predicted survival times. It assesses how well the model's predicted probabilities align with the actual outcomes in terms of the order of events occurring. Also ranging from 0 to 1, the closer to 1 the more accurate the predictions. Which do we prefer and should we value more in this study? In ASCVD, we are likely more interested in figuring out who is at more immediate risk and less immediate risk of ASCVD and less so whether a person will develop ASCVD some time in the future or not. Therefore, we should place more emphasis on the C-index over the AUC. 

Finally, what is a hazard ratio (HR)? A HR quantifies the relative likelihood of an event occuring in one group compared to another and captures how the risk of an event changes for one group to another for a given variable. The hazard ratio per standard deviation for a covariate in an estimated Cox proportional hazards model quantifies the change in the hazard rate associated with a one-standard-deviation change in the covariate's value, while holding other covariates constant. This provides a way to interpret the impact of a covariate on the risk of the event of interest. HR per SD greater than 1 indicates a greater risk of the event, less than 1 indicates decreased risk, and equal to 1 means no effect on the event. 

A model with protein scores, age, and sex in cohort 1 had a C-index of 0.737. A model with only sex and age had a C-index of 0.719. The variable associated with the protein score had a hazard ratio (HR) of 1.93 per SD with 95% CI of 1.75 to 2.13. The confidence interval lies comfortably away from 1 suggesting that elevated protein scores are indicative of increased ASCVD risk. But, as we see with the C-index change of ~0.02, it is not particularly informative. Further, a model with clinical risk factors, age and sex had a C-index of 0.736 which increased to 0.750 when adding proteomics data - a very modest increase. If confidence intervals were measured around the reported C-indices, I would suspect that the proteomics data C-index lies within the 95% interval of the base models. **A model with protein risk scores, age, and sex is as good as one with clinical risk factors, age, and sex**. And, clinical risk factors are a lot easier to obtain from a patient than a plasma sample followed by a proteomics assay. 

C-indexes capture the risk as a function of time, but we can also ask about the power of the model to predict whether an ASCVD event will occur or not by looking at the AUCs. From eFigure6B, the clinical risk factors + protein + polygenic risk score model has an AUC ~0.825. Models with either clinical risk factors with and without polygenic risk scores have AUCs around ~0.8. A 0.025 increase is observed with the addition of proteomics data, another modest increase. Rather interestingly, a model with just age and sex had an AUC of 0.775! All things considered, only using age and sex (extremely easy to get anywhere in the world), has good discriminatory power and predictive capabilities (AUC: 0.78, C-index 0.72).

The authors observed that individuals who died of causes other than ASCVD within 10 years tended to have higher predicted risk than those who survived 10 years without ASCVD across all models. The model may be capturing "overall unwellness" in general. Intuitively, this makes sense given that people who may develop ASCVD are also more likely to develop non-ASCVD conditions relative to people who never develop ASCVD (they are just healthier). 

In cohort 2, performance with respect to C-indices and AUCs were lower than cohort 1. This is to be expected because the background population of cohort 2 is less healthy in general making differences in cases and controls more subtle than cohort 1. The standard risk tool for predicting secondary ASCVD events is the SMART2 score composed of age, sex, some clinical risk factors, CRP and non-HDL protein levels, blood pressure, and eGFR. The C-index of SMART2 was 0.651 and protein risk score, age, and sex was 0.667 with a confidence interval that spanned the SMART2 C-index suggesting that proteomics is near equivalent to the SMART2 approach. Adding SMART2 to proteomics very modestly increased C-index to 0.684. To note, models with just age and sex perform poorly relative to SMART2 or proteomics approaches (e.g., AUC 0.55 relative to AUC 0.65) in predicting second ASCVD events. 

This cohort is largely white, but the protein risk score HR remained significant when applying the modeling approach to patients who self-reported Asian and African ancestry. The primary event population in Iceland was transferable to a group
of individuals in the secondary event population who self-reported as White as well as Asian and African. In contrast, it
has been demonstrated that polygenic risk scores do not transfer well between different racial groups and are limited by the
lack of genome-wide association studies data in people who are not White. This may suggest that protein risk scores may be more robust across different ancestral populations than polygenic risk scores. This result is extremely preliminary and needs to be validated and investigated much more to reach any sort of conclusion. 

From the authors, they reach the conclusion that "when added to a model that included clinical risk factors and treatment-related variables and also polygenic risk scores for coronary artery disease and stroke, the protein risk score modestly improved risk prediction for first and recurrent ASCVD events". Further, they state, "the protein risk score and polygenic risk scores may not be able to improve prediction when added to clinical risk factors over all risk groups". I agree with this statement. SMART2 scores are sufficiently good relative to SMART2 + proteomics in secondary ASCVD prediction and clinical risk factors are equivalent to proteomics in primary ASCVD prediction. Adding proteomics achieves littles in primary ASCVD prediction too and just age and sex do almost as well in this situation. 

The potential gain in ASCVD risk assessment using this proteomics approach is limited even without considering the cost of implementing such an assay (logistics, transport, assay running, server and algorithm training costs). It is possible that considering different or more proteins may help and a different modeling approach (deep neural nets, and other nonlinear approaches). 












































