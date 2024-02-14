---
layout: default
---

#### Prognostic features in cancer

https://www.ncbi.nlm.nih.gov/pmc/articles/PMC9042322/pdf/nihms-1793836.pdf

These analyses typically seek to leverage survival data as clinical validation of the importance of a gene of interest in cancer biology. If the overexpression or mutation of some gene is associated with metastasis and patient death, then this is sometimes presented as evidence that that gene is a driver of cancer progression. Alternately, if the overexpression of a gene is associated with favorable prognosis, then it may be assumed that this gene has tumor-suppressive properties. Similar reasoning can underlie the prioritization of targets for therapeutic development: genes that are associated with poor prognosis are presumed to make the best drug targets due to their conjectured role as cancer drivers, while genes associated with favorable prognosis may be disregarded as non-essential for cancer progression (Kaelin, 2017)

To our knowledge, the assumptions underlying these inferences have never been directly tested. While it seems intuitive that the presence of a genetic alteration that drives cancer progression would be associated with worse outcomes, it is not currently known whether real-world data supports this link. Moreover, the prognostic correlations of successful
and unsuccessful cancer drug targets have not been investigated. To gain insight into the molecular differences between aggressive and indolent human cancers, and to critically evaluate the use of prognostic data in preclinical research, we performed unbiased survival analysis from all cancer patients and all genomic data platforms included in TCGA

Clinical endpoints were selected based on the updated data and recommendations provided in Liu et al. (2018): overall survival was used as an endpoint in 24 cancer types, while progression-free intervals were used in 9 cancer types for which few deaths were observed during the study period (Table 1). For every patient cohort, we extracted information on
six different features that were measured in individual tumors: point mutations, CNAs, gene expression, microRNA expression, DNA methylation, and protein expression. For the mutational analysis, we considered only non-synonymous mutations, and in each patient cohort we excluded genes that were mutated in <2% of patients in that cohort (see STAR Methods). We then generated Cox proportional hazard models to assess the relationship between patient outcome and each individual gene for every tumor feature.


First, we generated univariate models, in which individual genomic features were directly associated with patient outcome (Table S1). Secondly, we generated multivariate (“fully adjusted”) models, in which patient age, sex, tumor stage, and tumor grade were incorporated along with the genomic data (Table S2). For each Cox model, we report the Z score, which encodes both the directionality and significance of a survival relationship. (MULTIPLE HYPOTHESIS TESTING CORRECTION??)


Z scores across cancer types were combined using Stouffer’s method (Stouffer, 1949, https://en.wikipedia.org/wiki/Fisher%27s_method#Relation_to_Stouffer.27s_Z-score_method)


(FOR THE ANALYSES WE ARE LOOKING AT GOOD AND BAD PROGNOSIS BUT ALL SAMPLES ARE CANCER I BELIEVE, I DO NOT THINK WE ARE COMPARING CANCER TO NONCANCER)

A Z score >1.96 indicates that the presence or upregulation of a tumor feature is associated with shorter survival times at a p
< 0.05 threshold, while a Z score < −1.96 indicates that the presence or upregulation of a feature is associated with longer survival times at a p < 0.05 threshold. In general, the Z scores produced by the univariate and fully adjusted models were highly concordant within individual data types (median R = 0.96) and within individual cancer types (median R = 0.95), suggesting that few prognostic markers were affected by the inclusion of additional clinical variables


 In general, gene expression, DNA methylation, and CNAs provided the most prognostic information, while mutational analysis provided the least


 Cancers that arose from related tissues of origin tended
to display similar survival profiles (Figure 1F). For instance, Z scores derived from DNA methylation profiles were similar between renal clear cell carcinomas and renal papillary cell carcinomas
