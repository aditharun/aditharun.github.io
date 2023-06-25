---
layout: default
---

#### Protein structure prediction for unique structures

Suppose we want to predict a protein's three-dimensional structure from its sequence, how might we do it?  

AlphaFold is the closest we have gotten. From their 2021 paper: 

> Predicting the three-dimensional structure that a protein will adopt based solely on its amino acid sequence—the structure prediction component of the ‘protein folding problem’8—has been an important open research problem for more than 50 years9. Despite recent progress10,11,12,13,14, existing methods fall far short of atomic accuracy, especially when no homologous structure is available. Here we provide the first computational method that can regularly predict protein structures with atomic accuracy even in cases in which no similar structure is known. 



How does the AlphaFold architecture work? 

https://www.nature.com/articles/s41586-021-03819-2 + supplementary information (both in downloads folder of computer)


Allison Didychuk at Yale who was working on predicting crystal structure of HHV8 (Kaposi Sarcoma causing virus) molecular motor protein. 

Thesis: This protein is unique and she is not sure alphaFold is producing a valid structure for this especially because there are no real homologs for this protein. So, how are we to know whether this protein structure is valid? Can we test for this? How can we know without actually running the full x-ray cyrstallography experiment? 

Energy landscape of protein folding (https://en.wikipedia.org/wiki/Protein_folding, see that named subsection in wikipedia). Basically, the native conformation of a protein is the one that minimizes the free energy of the structure. Maybe we ask alphaFold for the structure, compute its energy, then 'shock' the system a bit (to try to get out of a local minimum if we are in one) and run it through thermodynamic folding program and see if it can find a lower energy level. There are also certain things we know about this HHV8 protein probably like XYZ domain is transmembrane - we can incorporate such rules into possible structures for vetting