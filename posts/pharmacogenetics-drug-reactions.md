---
layout: default
---

#### Drug choice informed by genome sequencing

A [2023 Lancet article](https://www.thelancet.com/journals/lancet/article/PIIS0140-6736(22)01841-4/fulltext) ran a clinical trial to understand whether a 12-gene pharmacogenetic panel could prevent adverse drug reactions. 

"The benefit of pharmacogenetic testing before starting drug treatment has been well documented for several single gene–drug pairs." What is the reason for doing such testing in the first place? We want to avoid bad clinical side effects when a patient is placed on a drug and want the most efficacious drug prescribed to each patient (e.g., some drugs are metabolized quickly by patients with specific variant enzymes making them not work well). The sequence of certain genes in a patient can inform us of potential harmful drug-body and drug-drug interactions. Logically, therefore, pre-treatment testing of multiple gene-drug pairs should add value if, at minimum: *the cost of testing in a population + cost of treating adverse reactions in the tested population is less than the cost of treating adverse reactions in an untested population*. (These two populations must resemble one another as best they can). This study began to investigate this exact question.  

A few international consortiums have assembled over 100 gene-drug pair relationships. In a large population, the allele frequencies of any specific variant is low (.1-5%) but taking the 12 most important pharmacogenes identifies "at least 1 actionable genotype in 90-95% of individuals across multiple populations". 50 germline-variant alleles within 12 genes (CYP2B6, CYP2C9, CYP2C19, CYP2D6, CYP3A5, DPYD, F5, HLA-B, SLCO1B1, TPMT, UGT1A1, VKORC1) was genotyped for each patient using the SNPline workflow. Blood or saliva was collected for DNA isolation from each patient, and relevant drug recommendations were returned within 7 days of drug initiation. Each patient was also given a card that included a QR code storing their pharmacogenetic test results and recommendations. 

Of the 6944 patients enrolled, 93.5% carried at least one actionable variant. Within this group, 81.8% carried at least actionable variants. About 70% of pharmacogenetic guided recommendations were accepted by physicians and pharmacists for their patients, a high number. The incidence of a causal cliniclly relevant adverse drug reaction in patients with an actionable test result was 21% (152 of 725) in the study group and 28% (231 of 833) in the control group. Intervention reduced adverse drug reaction risk by 30% (odds ratio 0.7). During follow up, 14% of patients received a second prescription with an actionable recommendation, which marginally decreased the odds ratio to 0.69. These odds ratios reflect filtering of adverse reactions for severity and causality. **The odds ratio is 0.55 when considering any adverse drug reactions between patients in study and control group.**

During the course of this study, the guidelines for some of the drug-gene pairs changed and actionability statuses changed for oxycodone, voriconazole, escitalopram, clomipramine, CYP2B6, and DPYD. Variant statuses are constantly evolving - managing these changes and staying current requires diligent effort and design of a platform for connecting ongoing research with prescribing centers and providers.  

Centers that prescribe an increased amount of drugs with a high toxicity profile (e.g., capectiabine and tacrolimus) for which alternatives can be identified by known gene-drug interactions represent places where pharmacogenetic initiatives may be most beneficial.   

**What might the economic benefits of pharmacogenetic testing be?** [A large retrospective analysis](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC8949247/) of a 23-gene panel in 5288 patients aged 65 years or older compared with 22357 controls showed a reduction of ~$7000 USD per patient in the study group in direct medical charges.  

Pharmacogenetics holds great promise for improving patient outcomes and reducing healthcare costs. Implementing this, however, requires combining genomics, software reporting platforms, incorporating new guidelines based on research, and EHR integration. It can also extend beyond assessing efficacy and adverse reactions between a single drug and the patient's genome and include drug-drug interactions within a patient, a problem with comparatively less known. The demonstrated cost savings of prescribing drugs based on pharmacogenetics testing should be enticing to health insurance companies.   

We are still finding things out - we do not know what genes and alleles will be important for drugs yet to be developed and most drugs that we currently have. Therefore, it makes sense to sequence a larger subset of the genome (WGS, WES, etc.) as cost-effectively as possible (e.g., what is the minimal sequencing depth we need?). Can we do sequencing in tiers? We can collect a sample (blood/saliva) from a patient and then send some of it for SNP or deep sequencing at regions we suspect are highly important and then send the rest, upon patient consent, for WGS at low coverage. The broader sequencing approach is immediately most beneficial for patients on multiple medications or with a high likelihood of being on multiple mediciations - it becomes more likely that sequencing wider will lead to something actionable.  

[Ultima genomics](https://www.ultimagenomics.com/) can sequence a genome for $100 and from what I have seen, the results are comparable to other platforms. How long is the turn around time for this sequencing though? Is it shorter than the SNP workup which took 7d? Once sequenced, data storage, compression, and retrieval are of paramount importance. All drug queries into the developed pharmacogenetics reporting platform should be tracked for patient records and privacy - patients should have a right to know who is searching for what.      

















