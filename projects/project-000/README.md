# Prediction

**Due Tuesday, 20 January 2026 11:59 PM (Pacific Time)**

Submit your write up with code and output (a knitted/rendered PDF or HTML) on Canvas.

It's time to do some actual prediction.

We're going to start with a classic: predicting housing-sales prices using a pretty rich set of housing features. With *real-life data*.

**Purpose** We have three main goals with this project.

- We want you to **start thinking about** and **experiencing prediction** scenarios and how they may differ from other settings in econometrics—goals, challenges, data, decisions, *etc*.
- We also thought you could use a **refresher/review of `R`**.
- We want you to experience real-life data in all their messiness/glory. These data come straight from the [Cook County Open Data Portal](https://datacatalog.cookcountyil.gov/Property-Taxation/Assessor-Archived-05-11-2022-Residential-Sales-Dat/5pge-nu6u/about_data). They are the kind of data you will receive in real life applications—poorly named, messy, incomplete, *etc.*.

## Getting started

1. [Read](https://datacatalog.cookcountyil.gov/Property-Taxation/Assessor-Archived-05-11-2022-Residential-Sales-Dat/5pge-nu6u/about_data) about [the dataset](https://github.com/edrubin/EC524W26/blob/master/projects/project-000/sales-data.fst). (To download from Github: look for the download button on the top right of the file view.)

*Note:* I took a subset of the original dataset that focuses on the "regression classes" of residential properties listed by the [Cook County Assessor's Office](https://prodassets.cookcountyassessoril.gov/s3fs-public/form_documents/classcode.pdf).

2. Load the data. (I'm assuming you already downloaded the dataset and set up your project folder.)

*Hint:* The original dataset from Cook County were a CSV, but I saved them for you with the `fst` package in `fst` format. To load the data, you will need to (1) make sure the `fst` package is already installed and (2) use the `read_fst()` function, *e.g.*,
```{r}
# Install and load the fst package
pacman::p_load(fst)
# Load the dataset
sales_df = 'assessor-residential-sales.fst' |> read_fst()
```

3. Now that you (a) know which variables you should see and (b) have the data loaded, check out what the data actually look like. Some useful function for this step include:

   - `head()`
   - `summary()`
   - `glimpse()` from `dplyr`
   - `skim()` from `skimr`

4. Now you should better understand what I meant above by "messy" data. (They would be worse if you had the *full* dataset.) We should clean the data a bit before we start modeling. Some ideas (you're free to do whatever you want):

   - Clean the variable names so they don't have spaces. I like `janitor::clean_names()`.
   - Clean up variables that are coded as `character` but should be `numeric`, *e.g.*, `Land Square Feet` and `Sale Price`. For this task, the `parse_number()` function from the `readr` package is helpful.
   - Code categorial variables that are currently `numeric` as `factor`, *e.g.*, `Property Class`, `Neighborhood Code`, and the various material types.
   - Deal with missing values (`NA`s and blanks) in some (fairly reasonable) way for variables that you want to eventually use.
   - *Optional:* Grab any `date` information from the `Sale Date` variable that you might want—*e.g.*, using the `lubridate` package.

## Get to work

5. Randomly split your dataset into (approximately) 80% training data and 20% testing data.

   - *Hint:* Make sure you set a seed with `set.seed()` before you do the random sampling so that your results are reproducible.
   - *Another hint:* One way to do this is to create create a new variable with random uniform numbers (with `runif`) and then `filter` on that variable (e.g., `< 0.8` for training and `>= 0.8` for testing). Alternatively, you could check out the `slice` and `sample_frac` functions from `dplyr`.

7. Which type of resampling approach are we setting up here? Explain.

8. Estimate three linear regression models of varying complexity for the `Sale Price` using the training sample.

   - You can estimate more than three if you want...
   - Remember: The ultimate goal is to get **good out-of-sample predictions** on the test data. But don't touch that test dataset yet!
   - You *could* use the `lm()` function, but other modeling functions are fine too, for example, `feols` from the `fixest` package is really fast with large dataset and many fixed effects.
   - Start simple and build up.
   - You're in charge here, do whatever you think will achieve the goal of **good out-of-sample predictions**—interactions, polynomials, lots of variables, *etc.*

9. For your three favorite models from step 7, do the following:

   - Predict `Sale Price` in the **training** data—likely with the `predict()` function.
   - Calculate the training root mean squared error (RMSE) for each model. It's just the square root of MSE (the square root gets us back to dollars).

10. Which of your three models performed best on the training data? Why do you think that is?

11. Now, finally, it's time to evaluate your models on the test data. For each of your three models from steps 7 and 8, do the following:

   - Predict `Sale Price` in the **test** data.
   - Calculate the test root mean squared error (RMSE) for each model.

11. Which of your three models performed best on the test data? How does this compare to the training data results? Explain.

12. Which model would you choose to use for actual prediction? Why?

13. How well is your best model doing at predicting `Sale Price`? Explain/justify your answer. 

14. Do you think you could improve your predictions further? If so, how? In other words: What modeling decisions do you think you could change to get better predictions?

15. Suppose your test-set RMSE is lower than a classmate's test-set RMSE. Does that imply your model is better than their model? Explain your answer. 
