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

*Note:* Remember to `y ~ .` will define `y` as the outcome (`Sale Price`) and all other variables as predictors. Also remember that some variables' roles may need to be changed (e.g., IDs should be set as `role = 'ID'`). Other variables may need to be defined as categorical even if they are stored as numeric (e.g., zip codes).

Explain your `recipe` choices.

2. Using the `recipe` above, `prep()` and `bake()` the data to create a cleaned dataset ready for modeling.

## DIY cross-validation

In this section, you will build your own *k*-fold cross-validation routine from scratch (i.e., **without** using `tidymodels`' built-in functions).

3. Randomly assign each observation to one of five groups (cleverly named `1`, `2`, `3`, `4`, and `5`). (These groups will be your folds.)

*Hint 1:* Make sure you `set.seed` before sampling the folds so that your results are reproducible.

*Hint 2:* You can use the `sample()` function.

4. Define three models with varying degrees of flexibility/complexity. For example, you could define (1) a linear regression model with only "main effects", (2) a linear regression model with some interactions and/or polynomial terms, and (3) a more complex model with many interactions and/or polynomial terms. You should be able to fit each of these models using the `lm()` function.

By *define*, I want you to (a) first, briefly describe the models (in words) and then (b) second, define each as a formula in `R`, e.g.,

```{r}
#| eval: false
# Model 1
model1_formula = y ~ x1 + x2 + x3
# Model 2
model2_formula = y ~ x1 + x2 + x3 + I(x1^2) + x1:x2
# Model 3
model3_formula = y ~ x1 + x2 + x3 + I(x1^2) + I(x2^2) + I(x3^2) + x1:x2 + x1:x3 + x2:x3
```

5. Time to actually begin the cross validation. Let's start simply by focusing on fold 1. Now that you've defined each of the three models you want to estimate, estimate them on the folds that don't include 1 (i.e., folds 2–5) and then predict the observations in fold 1. 

In this step, you should

- use the formulas you defined in the previous problem,
- use `subset`/`filter`/`data.table`/whatever in the `data` and `newdata` arguments to focus on the correct subset of folds.

*Hint:* It will make your life much easier if you do everything relative to fold 1.

For example, you could do something like

```{r}
# Estimate the models on folds that exclude fold 1
model1_fit = lm(model1_formula, data = filter(my_df, fold != 1))
model2_fit = lm(model2_formula, data = filter(my_df, fold != 1))
model3_fit = lm(model3_formula, data = filter(my_df, fold != 1))
# Predict onto fold 1
model1_pred = predict(model1_fit, newdata = filter(my_df, fold == 1))
model2_pred = predict(model2_fit, newdata = filter(my_df, fold == 1))
model3_pred = predict(model3_fit, newdata = filter(my_df, fold == 1))
```

6. Calculate the RMSE (root mean squared error) for each of your models from your predictions for the observations in fold 1 (i.e., the previous step).

7. Now we increase the level of difficulty a bit. The goal is to perform the full 5-fold cross-validation for all three models across all five folds (you already did fold 1 above). Follow the steps below:

- copy your work from 5. and 6. above,
- integrate the copied code into a "loop"-like routine (e.g., `for`, `lapply`, or `map`),
- for each fold/iteration (1 through 5), estimate the out-of-sample RMSE for each of the three models that you defined.

*Hint:* You will want to output the results in a helpful object, for example, a data frame with columns like `fold`, `model`, and `rmse`. Within each fold, you might do something like

```{r}
data.frame(
  fold = current_fold,
  model = c('model1', 'model2', 'model3'),
  rmse = c(model1_rmse, model2_rmse, model3_rmse)
)
```

8. Create a table that summarizes the results from your cross-validation routine. For each model, report

- the average RMSE across the five folds,
- the standard deviation of the RMSE across the five folds,
- how many terms (predictors) are in the model.
   
9. Summarize your results. Which model performed best? Was it the most flexible?

10. Is RMSE a reasonable metric for this problem? Explain.

11. Is 5-fold cross-validation with totally independent sampling into folds reasonable for this problem? Explain.


## Penalized regression with `tidymodels`

Now let's see how `tidymodels` does with cross-validation and penalized regression. I will try to guide you through the process step by step. That said, remember that our [class notes](https://raw.githack.com/edrubin/EC524W26/master/lecture/005/slides.html#69) have an exmaple.

*Note:* At this point, you need to have `tidymodels` and `glmnet` installed.

12. Decide whether you are going to use a ridge, lasso, *or* elastic net regression model. Explain your choice.

13. Use `linear_reg` from `parsnip` (in `tidymodels`) to formally define the penalized regression model (with `glmnet` as the `engine`). For help, see [our class notes](https://raw.githack.com/edrubin/EC524W26/master/lecture/005/slides.html#69).

*Reminder:* You will definitely need to `tune` the `penalty` parameter. You *may* need to also `tune` the `mixture` parameter.

14. Now combine your defined `model` and your prior `recipe` into a `workflow`.

15. Use the `vfold_cv` function from `rsample` to create a 5-fold cross-validation object.

16. Tune the model via cross validation—i.e., use `tune_grid` to estimate the out-of-sample RMSE for a grid of penalty (and possibly mixture) values.

17. Create a visualization that shows how the out-of-sample RMSE varies with the penalty (and possibly mixture) parameter.

18. Which value of the penalty (and possibly mixture) parameter minimizes the out-of-sample RMSE? (Use your visualization and/or the `show_best` function from `tune`.)

19. What does the chosen value of lambda/mixture tell you about the need to restrain model flexibility in this problem?

20. Do you think you gave the model enough flexibility? How could you do better?