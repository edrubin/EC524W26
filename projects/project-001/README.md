# Prediction

**Due Sunday, 01 February 2026 11:59 PM (Pacific Time)**

*As before:* Submit your write up with code and output (a knitted/rendered PDF or HTML) on Canvas.

## Overview

**What?** Let's integrate what we've been discussing about tuning, resampling, and penalization into the prediction context from our last project.

**Purpose** We have three main goals with this project.

- See/build your own *k*-fold cross-validation routine from scratch.
- Get first-hand experience with penalized regression.
- Start working with [`tidymodels`](https://www.tidymodels.org/). (You'll want to make sure you have the package installed, along with `glmnet`.)

*Remember:* These data come straight from the [Cook County Open Data Portal](https://datacatalog.cookcountyil.gov/Property-Taxation/Assessor-Archived-05-11-2022-Residential-Sales-Dat/5pge-nu6u/about_data). [Read](https://datacatalog.cookcountyil.gov/Property-Taxation/Assessor-Archived-05-11-2022-Residential-Sales-Dat/5pge-nu6u/about_data) about [the dataset](https://github.com/edrubin/EC524W26/blob/master/projects/project-000/sales-data.fst). (To download from Github: look for the download button on the top right of the file view.) I took a subset of the original dataset that focuses on the "regression classes" of residential properties listed by the [Cook County Assessor's Office](https://prodassets.cookcountyassessoril.gov/s3fs-public/form_documents/classcode.pdf).

## Data cleaning

0. Let's start by cleaning the data. Load the data into `R` along with the necessary packages.

1. Using `tidymodels` define a `recipe` for to preprocess (clean) the data. This `recipe` *could* include (1) log transformations of skewed numeric predictors (`step_log`), (2) creating dummy variables for categorical predictors (`step_dummy`), (3) standardizing numeric predictors (`step_normalize`), (4) removing predictors with near-zero variance (`step_nzv`), (5) adding interactions (`step_interact`), (6) adding polynomial terms (`step_poly`), (7) cutting numeric variables into bins (`step_cut`), or anything else that could make sense.

*Note:* Remember to `y ~ .` will define `y` as the outcome and all other variables as predictors. Also remember that some variables' roles may need to be changed (e.g., IDs should be set as `role = 'ID'`). Other variables may need to be defined as categorical even if they are stored as numeric (e.g., zip codes).

Explain your `recipe` choices.

2. Using the `recipe` above, `prep()` and `bake()` the data to create a cleaned dataset ready for modeling.

## DIY cross-validation

In this section, you will build your own *k*-fold cross-validation routine from scratch (i.e., **without** using `tidymodels`' built-in functions).

3. Randomly assign each observation to one of five groups (cleverly named `1`, `2`, `3`, `4`, and `5`). (These groups will be your folds.)

*Hint:* Make sure you `set.seed` before sampling the folds so that your results are reproducible.

*Hint:* You can use the `sample()` function.

4. Define three models with varying degrees of flexibility/complexity. For example, you could define (1) a linear regression model with only "main effects", (2) a linear regression model with some interactions and/or polynomial terms, and (3) a more complex model with many interactions and/or polynomial terms. You should be able to fit each of these models using the `lm()` function.

By *define*, I want you to (a) briefly describe the models (in words) and (b) define each as a formula in `R`, e.g.,

```{r}
# Model 1
model1_formula = y ~ x1 + x2 + x3
# Model 2
model2_formula = y ~ x1 + x2 + x3 + I(x1^2) + x1:x2
# Model 3
model3_formula = y ~ x1 + x2 + x3 + I(x1^2) + I(x2^2) + I(x3^2) + x1:x2 + x1:x3 + x2:x3
```

5. First, let's start the CV by 

## Penalized regression with `tidymodels`
