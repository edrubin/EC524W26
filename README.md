# EC 524/424, Winter 2026

Welcome to Economics 524 (424): Prediction and machine-learning in econometrics, taught by [Ed Rubin](https://edrub.in) and [Jose Rojas Fallas](https://jose-rojas-fallas.quarto.pub/).

## Schedule

**Lecture** Tuesdays and Thursdays, 10:00a-11:20a (Pacific), [105 Esslinger](https://classrooms.uoregon.edu/esslinger-105/)

**Lab** Friday, 10:00a–10:50a (Pacific), [072 PLC](https://classrooms.uoregon.edu/plc-72/)

**Office hours**

- **Ed Rubin** Tu. 2p–3p ([PLC 530](https://map.uoregon.edu/b83e556a1))
- **Jose Rojas Fallas** TBA ([PLC 525](https://map.uoregon.edu/6794b993e))

## Syllabus

[**Syllabus**](https://raw.githack.com/edrubin/EC524W26/master/syllabus/syllabus.pdf)

## Books

### Required books

- [Introduction to Statistical Learning](https://www.statlearning.com/)
- [The Hundred-Page Machine Learning Book](http://themlbook.com/)
- [Data Visualization](https://socviz.co/)

### Suggested books

- [R for Data Science](https://r4ds.had.co.nz/)
- [Introduction to Data Science](https://www.springer.com/us/book/9783319500164) (not available without purchase)
- [The Elements of Statistical Learning](http://web.stanford.edu/~hastie/ElemStatLearn/)
- [Data Science for Public Policy](https://link.springer.com/book/10.1007/978-3-030-71352-2) (ebook available through UO library)

## Lecture notes

**Note:** Links to topics that we have not yet covered lead to older slides. I will update links to the new slides as we work our way through the term/slides.

[**000 - Overview (Why predict?)**](https://raw.githack.com/edrubin/EC524W26/master/lecture/000/slides.html)

1. Why do we have a class on prediction?
2. How is prediction (and how are its tools) different from causal inference?
3. Motivating examples

**Formats** [.html](https://raw.githack.com/edrubin/EC524W26/master/lecture/000/slides.html) | [.pdf](https://github.com/edrubin/EC524W26/blob/master/lecture/000/slides.pdf) | [.rmd](https://github.com/edrubin/EC524W26/blob/master/lecture/000/slides.rmd)

**Readings** Introduction in *ISL*

[**001 - Statistical learning foundations**](https://raw.githack.com/edrubin/EC524W25/master/lecture/001/slides.html)

1. Why do we have a class on prediction?
2. How is prediction (and how are its tools) different from causal inference?
3. Motivating examples

**Formats** [.html](https://raw.githack.com/edrubin/EC524W25/master/lecture/001/slides.html) | [.pdf](https://github.com/edrubin/EC524W25/blob/master/lecture/001/slides.pdf) | [.rmd](https://github.com/edrubin/EC524W25/blob/master/lecture/001/slides.rmd)

**Readings**

- [Prediction Policy Problems](https://www.aeaweb.org/articles?id=10.1257/aer.p20151023) by Kleinberg *et al.* (2015)
- *ISL* Ch1
- *ISL* Start Ch2

**Supplements** [Unsupervised character recognization](https://colah.github.io/posts/2014-10-Visualizing-MNIST/)

[**002 - Model accuracy**](https://raw.githack.com/edrubin/EC524W25/master/lecture/002/slides.html)

1. Model accuracy
1. Loss for regression and classification
1. The variance-bias tradeoff
1. The Bayes classifier
1. KNN

**Formats** [.html](https://raw.githack.com/edrubin/EC524W25/master/lecture/002/slides.html) | [.pdf](https://github.com/edrubin/EC524W25/blob/master/lecture/002/slides.pdf) | [.rmd](https://github.com/edrubin/EC524W25/blob/master/lecture/002/slides.rmd)

**Readings** 

- *ISL* Ch2–Ch3
- *Optional:* *100ML* Preface and Ch1–Ch4

[**003 - Resampling methods**](https://raw.githack.com/edrubin/EC524W25/master/lecture/003/slides.html)

1. Review
1. The validation-set approach
1. Leave-out-out cross validation
1. k-fold cross validation
1. The bootstrap

**Formats** [.html](https://raw.githack.com/edrubin/EC524W25/master/lecture/003/slides.html) | [.pdf](https://github.com/edrubin/EC524W25/blob/master/lecture/003/slides.pdf) | [.rmd](https://github.com/edrubin/EC524W25/blob/master/lecture/003/slides.rmd)

**Readings**

- *ISL* Ch5
- *Optional:* *100ML* Ch5

[**004 - Linear regression strikes back**](https://raw.githack.com/edrubin/EC524W23/master/lecture/004/004-slides.html)

1. Returning to linear regression
1. Model performance and overfit
1. Model selection—best subset and stepwise
1. Selection criteria

**Formats** [.html](https://raw.githack.com/edrubin/EC524W23/master/lecture/004/004-slides.html) | [.pdf](https://github.com/edrubin/EC524W23/blob/master/lecture/004/004-slides.pdf) | [.Rmd](https://github.com/edrubin/EC524W23/blob/master/lecture/004/004-slides.Rmd)

**Readings**

- *ISL* Ch3
- *ISL* Ch6.1

**In between: `tidymodels`-ing**

- [An introduction to preprocessing with `tidymodels`](https://www.kaggle.com/edwardarubin/intro-tidymodels-preprocessing). (Kaggle notebook)
- [An introduction to modeling with `tidymodels`](https://www.kaggle.com/edwardarubin/intro-tidymodels-modeling). (Kaggle notebook)
- [An introduction to resampling, model tuning, and workflows with `tidymodels`](https://www.kaggle.com/edwardarubin/intro-tidymodels-resampling) (Kaggle notebook)
- [Introduction to `tidymodels`: Follow up for Kaggle](https://www.kaggle.com/edwardarubin/intro-tidymodels-split-kaggle)

[**005 - Shrinkage methods**](https://raw.githack.com/edrubin/EC524W25/master/lecture/005/slides.html)

(AKA: Penalized or regularized regression)

1. Ridge regression
1. Lasso
1. Elasticnet

**Formats** [.html](https://raw.githack.com/edrubin/EC524W25/master/lecture/005/slides.html) | [.pdf](https://github.com/edrubin/EC524W25/blob/master/lecture/005/slides.pdf) | [.Rmd](https://github.com/edrubin/EC524W25/blob/master/lecture/005/slides.Rmd)

**Readings**

- *ISL* Ch4
- *ISL* Ch6

[**006 - Classification intro**](https://raw.githack.com/edrubin/EC524W25/master/lecture/006/slides.html)

1. Introduction to classification
1. Why not regression?
1. But also: Logistic regression
1. Assessment: Confusion matrix, assessment criteria, ROC, and AUC

**Formats** [.html](https://raw.githack.com/edrubin/EC524W25/master/lecture/006/slides.html) | [.pdf](https://github.com/edrubin/EC524W25/blob/master/lecture/006/slides.pdf) | [.Rmd](https://github.com/edrubin/EC524W25/blob/master/lecture/006/slides.Rmd)

**Readings**

- *ISL* Ch4

[**007 - Decision trees**](https://raw.githack.com/edrubin/EC524W25/master/lecture/007/slides.html)

1. Introduction to trees
1. Regression trees
1. Classification trees—including the Gini index, entropy, and error rate

**Formats** [.html](https://raw.githack.com/edrubin/EC524W25/master/lecture/007/slides.html) | [.pdf](https://github.com/edrubin/EC524W25/blob/master/lecture/007/slides.pdf) | [.rmd](https://github.com/edrubin/EC524W25/blob/master/lecture/007/slides.rmd)

**Readings**

- *ISL* Ch8.1–Ch8.2

[**008 - Ensemble methods**](https://raw.githack.com/edrubin/EC524S24/master/lecture/008/slides.html)

1. Introduction
1. Bagging
1. Random forests
1. Boosting

**Formats** [.html](https://raw.githack.com/edrubin/EC524S24/master/lecture/008/slides.html) | [.pdf](https://github.com/edrubin/EC524S24/blob/master/lecture/008/slides.pdf) | [.rmd](https://github.com/edrubin/EC524S24/blob/master/lecture/008/slides.rmd)

**Readings**

- *ISL* Ch8.2

[**009 - Support vector machines**](https://raw.githack.com/edrubin/EC524S24/master/lecture/009/slides.html)

1. Hyperplanes and classification
2. The maximal margin hyperplane/classifier
3. The support vector classifier
4. Support vector machines

**Formats** [.html](https://raw.githack.com/edrubin/EC524S24/master/lecture/009/slides.html) | [.pdf](https://github.com/edrubin/EC524S24/blob/master/lecture/009/slides.pdf) | [.rmd](https://github.com/edrubin/EC524S24/blob/master/lecture/009/slides.rmd)

**Readings**

- *ISL* Ch9

[**010 - Dimensionality reduction and unsupervised learning**](https://raw.githack.com/edrubin/EC524W25/master/lecture/010/notebook.html)

0. MNIST dataset (machines with vision)
1. *K*-means clustering
2. Principal component analysis (PCA)
3. UMAP

**Formats** [.html](https://raw.githack.com/edrubin/EC524W25/master/lecture/010/notebook.html) | [.qmd](https://github.com/edrubin/EC524W22/blob/master/lecture/010/notebook.qmd)

## Projects

Past, present, and future projects.

**000** Predicting sales price in housing data (Kaggle)

**Help:** 

- [A simple example/walkthrough](https://www.kaggle.com/edwardarubin/project-000-example)
- [Kaggle notebooks](https://rpubs.com/Clennon/KagNotes) (from Connor Lennon)

**001** Validation and out-of-sample performance

**002** Penalized regression, logistic regression, and classification

**003** Trees, ensembles, and imputation

**004** Prediction finale

## Class projects

[**Class project 01: Application**](https://github.com/edrubin/EC524W26/tree/master/projects/class-project-01)
<br>*Selected topic due by 30 January 2026*
<br>*Project due 04 March 2026*

[**Class project 02: Extension**](https://github.com/edrubin/EC524W26/tree/master/projects/class-project-02)
<br>*Selected topic due by 06 February 2026*
<br>*Project due 11 March 2026*

## Final exam

**In-class exam**: *Tuesday (17 March 2026) at [8:00a–10:00a](https://registrar.uoregon.edu/dates-deadlines/exams)*
<br>
*Note:* Some previous years had a take-home portion of the final exam. This year, we will only have an in-class exam.

**Prep materials**
<br>
Previous in-class exams: [2023](exam/past-class/inclass-23.pdf) | [2024](exam/past-class/inclass-24.pdf) | [2025](exam/past-class/inclass-25.pdf)
<br>
Previous take-home exam: [2023](exam/past-home/home-23.md) | [2024](exam/past-home/home-24.md) 
<br>
*Note:* We will not provide keys.

## Lab notes

Approximate/planned topics... or at least for reference...

[**000 - Workflow and cleaning**](https://raw.githack.com/edrubin/EC524W22/master/lab/000-cleaning/000-slides.html)

1. General "best practices" for coding
2. Working with RStudio
3. The pipe (`%>%`)
4. Cleaning and Kaggle follow up

**Formats** [.html](https://raw.githack.com/edrubin/EC524W22/master/lab/000-cleaning/000-slides.html) | [.pdf](https://raw.githack.com/edrubin/EC524W22/master/lab/000-cleaning/000-slides.pdf) | [.Rmd](https://raw.githack.com/edrubin/EC524W22/master/lab/000-cleaning/000-slides.Rmd)

[**001 - Workflow and cleaning: An example**](https://raw.githack.com/edrubin/EC524W25/refs/heads/master/lab/001-projects/doc001.html)

Follow these steps to get started on the lab this week.

1. Install Quarto. Follow this [link](https://quarto.org/docs/getting-started/installation.html), download the installer for your operating system, and follow the instructions to install Quarto
2. Download (_and unzip_) the [Housing data](https://github.com/edrubin/EC524W22/raw/master/lab/001-cleaning/data/house-prices-advanced-regression-techniques.zip) and the [Quarto document](https://github.com/edrubin/EC524W25/blob/master/lab/001-projects/doc001.qmd) (download button top right corner of page)
3. Create a project in RStudio in a separate folder
4. Copy/move the data files and the Quarto document to a folder dedicated to this lab
5. Open the Quarto document in RStudio and follow the instructions to get started on this weeks lab


**Formats** [.html](https://raw.githack.com/edrubin/EC524W25/refs/heads/master/lab/001-projects/doc001.html) | [.qmd](https://github.com/edrubin/EC524W25/blob/master/lab/001-projects/doc001.qmd)

[**002 - Validation**](https://raw.githack.com/edrubin/EC524W25/refs/heads/master/lab/002-validation/doc002.html)

1. Creating a training and validation data set from your observations dataframe in R
2. Writing a function to iterate over multiple models to test and compare MSEs

**Download**: This [zip](https://github.com/edrubin/EC524W25/raw/master/lab/002-validation/lab002.zip) file

**Formats** [.html](https://raw.githack.com/edrubin/EC524W25/refs/heads/master/lab/002-validation/doc002.html) | [.qmd](https://github.com/edrubin/EC524W25/blob/master/lab/002-validation/doc002.qmd)

[**003 - Practice using `tidymodels`**](https://www.kaggle.com/edwardarubin/intro-tidymodels-preprocessing)

1. Cleaning data quickly and efficiently with `tidymodels`

**Formats** [.html](https://www.kaggle.com/edwardarubin/intro-tidymodels-preprocessing)

[**004 - Practice using `tidymodels`**](https://www.kaggle.com/edwardarubin/intro-tidymodels-preprocessing) (continued)

1. [An introduction to preprocessing with `tidymodels`](https://www.kaggle.com/edwardarubin/intro-tidymodels-preprocessing) (refresher from last week) 
2. [An introduction to modeling with `tidymodels`](https://www.kaggle.com/edwardarubin/intro-tidymodels-modeling)
3. [An introduction to resampling, model tuning, and workflows with `tidymodels`](https://www.kaggle.com/edwardarubin/intro-tidymodels-resampling) (will finish up next week)

[**005 - More practice with `tidymodels`**](https://raw.githack.com/edrubin/EC524W25/refs/heads/master/lab/003-tidymodels/doc003.html)

Change an OLS workflow to a Lasso or Ridge regression workflow.
- [Updated verion of the lab document with penalized regression](https://raw.githack.com/edrubin/EC524W25/refs/heads/master/lab/003-tidymodels/doc003-update.html)

**Download**: lab project [zip file](https://github.com/edrubin/EC524W25/raw/master/lab/003-tidymodels/lab003.zip)

**Formats** [.html](https://raw.githack.com/edrubin/EC524W25/refs/heads/master/lab/003-tidymodels/doc003.html) | [.qmd](https://github.com/edrubin/EC524W25/blob/master/lab/003-tidymodels/doc003.qmd)


**007 - Decision trees**

Setting up decision trees, with and without `tidymodels`.

**Download**: [Quarto document](https://github.com/edrubin/EC524W25/blob/master/lab/004-decision-trees/doc004.qmd)

**Formats** [.html](https://raw.githack.com/edrubin/EC524W25/refs/heads/master/lab/004-decision-trees/doc004.html) | [.qmd](https://github.com/edrubin/EC524W25/blob/master/lab/004-decision-trees/doc004.qmd)

## Additional resources

### Jobs

I wrote a very short guide to [finding a job](jobs).

For programming-related jobs, get some practice on 

- [LeetCode](https://leetcode.com/)
- [StataScratch](https://www.stratascratch.com/)
- [Kaggle](https://www.kaggle.com/)
- [Codewars](https://www.codewars.com/)
- [HackerRank](https://www.hackerrank.com/)

### R

- [UO library resources/workshops](https://researchguides.uoregon.edu/library_workshops)
- [RStudio's recommendations for learning R](https://education.rstudio.com/learn/), plus cheatsheets, books, and tutorials
- [YaRrr! The Pirate’s Guide to R](https://bookdown.org/ndphillips/YaRrr/) (free online)
- [Advanced R](https://adv-r.hadley.nz/) (free online)
- [R for Data Science](https://r4ds.had.co.nz/) (free online)
- [R Graphics Cookbook](https://r-graphics.org/) (free online)
- [Data Visualization](https://socviz.co/) (free online)

### SQL

- [Learn SQL with interactive exercises](https://sqlbolt.com/)
- [Mode SQL Tutorial](https://mode.com/sql-tutorial/)
- [W3Schools SQL Tutorial](https://www.w3schools.com/sql/)

### Data Science

- [Happy Git and GitHub for the useR](https://happygitwithr.com/) by Jenny Bryan, the "STAT 545 TAs", and Jim Hester
- [Python Data Science Handbook](https://jakevdp.github.io/PythonDataScienceHandbook/) by Jake VanderPlas
- [Elements of AI](https://course.elementsofai.com/)
- [Caltech professor Yaser Abu-Mostafa: Lectures about machine learning on YouTube](https://www.youtube.com/user/caltech/search?query=Yaser+Abu-Mostafa)
- From Google:
  - [Machine-learning crash course](https://developers.google.com/machine-learning/crash-course/ml-intro)
  - [Google Cloud training for data and machine learning](https://cloud.google.com/training/data-ml)
  - [General Google education platform](https://ai.google/education/)
- [3Blue1Brown's Youtube channel](https://www.youtube.com/c/3blue1brown) (has great videos on neural networks and other math topics)
- [Fast.ai](https://www.fast.ai/) (free online courses on deep learning and machine learning)

### Spatial data

- [Geocomputation with R](https://geocompr.robinlovelace.net) (free online)
- [Spatial Data Science](https://r-spatial.org/book/) (free online)
- [Applied Spatial Data Analysis with R](https://asdar-book.org)
