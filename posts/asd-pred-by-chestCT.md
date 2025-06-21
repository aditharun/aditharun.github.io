---
layout: main
---

#### Thoughts on using chest CTs to screen for ASD  

A recent preprint written by a friend from high school looked at using chest CT images as a biomarker for predicting autism spectrum disorder (ASD). Here is the paper: [Islam et al, 2023](https://arxiv.org/pdf/2301.05777.pdf).   

It is surprising that lung geometries can be informative in diagnosing ASD, a predominately neurological and behavioral condition. A paper in 2013 [Stewart and Klar, 2013](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6959546/) retrospectively identified "doublets", branching anomalies in lung airways, in all patients with ASD (n=49) and never in non-ASD patients (n=410).   

Other respiratory signs of ASD have been identified related to cycles of apnea and hyperventiliation [McCormick et al, 2018](https://pubmed.ncbi.nlm.nih.gov/29360264/). **Could we continuously monitor breath sounds with a phone and detect these dysrythmias?** A device placed near a baby's crib could record, analyze, identify these dysregulated breathing patterns (algorithms for detecting pre-defined patterns in audio time series are well-developed), and raise notification to the parent if it occurs consistently over time.   

Other markers for ASD are being developed like those at the Wall lab at Stanford looking at WGS [genomic algorithms](https://wall-lab.stanford.edu/projects/genome_algorithms/), and [gut microbiome](https://wall-lab.stanford.edu/projects/microbiome-autism/) composition. As far as I am aware, [Islam et al, 2023](https://arxiv.org/pdf/2301.05777.pdf) is the first study assess ASD status from a chest CT. In summary, their approach was to: 1) extract lung geometry of conducting airways from chest CT images, 2) extract 13 bifurcations worth of angles (26 angles), 3) normalize angles to N(0,1) per patient, 4) Project down to k dimensions by PCA, 5) leave one out cross-validation with SVM model. Average classification accuracy was around 0.7 (Figure 5) looking across PC dimensions. It may be interesting to also consider AUCs as the performance metric to evaluate. To be more disciplined, the choice of k for the dimensionality reduction could be set to k such that 90% of the variance is explained by the PC vectors.   

Before step 4, a subset of the 26 angles was chosen. This was done combinatorically by evaluating all 26 choose p combinations of angles with p going from 2 to 8. Beyond 8, the combinationarial options were infeasible for their computing setup. Maximum classification accuracy (across all k PC dimensions tested) approached 0.85 across angle subsets (Figure 6). This maximum measure does not capture the overall performance across PC dimensions which may be misleading. Figure 6 could be reconfigured to be a boxplot at each subset value where each point is the model performance at a given k dimensional subspace. In my view, a more disciplined biologically-informed approach for angle selection would be preferred.   

Performance and machine learning considerations aside, let us dig into the clinical utility of a chest CT based biomarker for ASD should it be validated. The target population for such a screening population is young children presenting with illness requiring a chest CT to a hospital. Chest CTs are not a light undertaking. Therefore, this tool would be best for young children before they reach major developmental milestones from which ASD can start to be diagnosed. **Children presenting with enough concern for a chest CT likely have respiratory disease. Do respiratory illnesses affect bifurcation angles?** Answering this question is critical in establishing the possibility of using such an approach to inform ASD status.   

The patients in this study were ~15 years old on average, which is significantly older than a target screening population (likely <3 years old). There is some evidence that these branching anomalies are established *in utero* and are maintained as people age [Stewart and Klar, 2013](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6959546/). Further assessment of a chest CT approach to ASD diagnosis would require a larger sample size of the target patient population described above and principled design of a ML model for classification.  

The discovery of airway doublets and respiratory dysrythmias suggests that there is some connection between ASD and lung development and coordination. Cerebellar and other brain region differences have been noted in patients with ASD and these differences may contribute to systemic effects - lung and beyond. **More broadly, this encourages us to look for biomarkers in places beyond sequencing the genome and in the primary affected organ system.**  








