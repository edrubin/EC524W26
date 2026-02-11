# Classification

**Due Tuesday, 17 February 2026 11:59 PM (Pacific Time)**

Submit your write up with code and output (a knitted/rendered PDF or HTML) on Canvas.

Let's switch gears and do some classification.

Specifically, we're going to predict the winner of NBA games. If you're not a basketfall fan, don't worry. The goal is to let the data and the modeling guide you (though contextual insight/experience is usually good).

**Purpose** We have three main goals with this project.

- Apply your new tools/knowledge to a classification problem.
- Experience prediction within a different context from the last projects.
- Continue building your intuition for tuning and validation (plus coding skills).

## Getting started

**README** The dataset contains information about bank customers and whether they churned (i.e., stopped being a customer). The goal is to predict whether a customer will churn based on their characteristics. This *churn* variable is the target variable for our classification task—and an important one for businesses to understand and manage.

**[00]** Start by loading packages and the data.

*Note:* The data originate from [Kaggle](https://www.kaggle.com/datasets/gauravtopre/bank-customer-churn-dataset/data). You can find a description of the dataset there.

**[01]** Explore the data. Make a few visualizations to understand the distribution of the target variable and its relationship with some of the features.

**[02]** Do we have class imbalance in our target variable? Why does class imbalance matter?

**[03]** What would the accuracy be for the null model?

## Getting started

**[04]** Set a seed and then randomly split the data into a training set (80%) and a test set (20%).

*Hint:* You can use the [`initial_split`](https://rsample.tidymodels.org/reference/initial_split.html) function from the `rsample` package here (followed by the `training()` and `testing()` functions). Or you can do it yourself with `sample` and `set.seed`.

## Linear probability model

**[05]** Fit a linear probability model to the tratining data. Use all of the features as predictors. Then test this linear probability model in the *test* data. What is the *test* accuracy for this model?

*Note:* Make sure you convert the predicted proabilities (outputted by `predict`) into class predictions (`0` or `1`) before calculating the accuracy.

**[06]** What are the *test* sensitivity and precision for your linear probability model?

*Hint:* It might be easiest to fist create a confusion matrix from the predicted values and the true values (and then calculate sensitivity and precision from that).

**[07]** How do the *test* accuracy, sensitivity, and precision for the linear probability model compare to the null model?

**[08]** How do the *test* accuracy, sensitivity, and precision for the linear probability model change if you use a threshold of `0.3` instead of `0.5` to convert predicted probabilities into class predictions?

## Logistic regression

**[09]** Fit a logistic regression model to the training data (e.g., using `glm`). Use all of the features as predictors. Then test this logistic regression model in the *test* data. What is the *test* accuracy for this model?

*Hint:* Remember you want to specifcy `type = 'response'` in the `predict` function to get predicted probabilities from a logistic regression model. Then you can convert those probabilities into class predictions.

**[10]** What are the *test* sensitivity and precision for your logistic regression model?

**[11]** How do the *test* accuracy, sensitivity, and precision for the logistic regression model compare to the linear probability model?

## A little fancier

**[12]** Set up a `tidymodels` recipe to process that data for a logistic elastic net model. Add interactions, polynomials, and whatever else you think could make sense here (and remember to make dummy variables from your categorical predictors). Don't forget to normalize.

**Important:** Define the recipe relative to the training data.

**Also important:** You will want to make sure your outcome variable is a factor (with levels `0` and `1`) for the logistic elastic net model. You might as well just convert the variable in the dataset (e.g., with `mutate` and `as.factor`).

*Note:* If you added any predictions to your dataset in the previous problems, remove them now.

**[13]** Set up a workflow that combines your recipe with a logistic elastic net model (with the `glmnet` engine).

**[14]** Now set up a 5-fold CV resampling object (e.g., with `vfold_cv`) and use it to tune the hyperparameters of a logistic elastic net model (`tune_grid`). 

*Remember:* You can parallelize the tuning process with the `future` package. (I don't think you'll need to parallelize here, but it's good to know how to do it.)

**[15]** Plot the results of your tuning (e.g., `autoplot`).

**[16]** Do the same combinations of hyperparameters maximize each of the metrics (accuracy, sensitivity, precision)? Does there seem to be a tradeoff between some of the metrics? Explain.

**[17]** Pick the best model according to the metric you think is most important. Then test this model in the *test* data. What is the *test* accuracy, sensitivity, and precision for this model?

*Hints:* For the workflow `wf`, we can finalize it with the best hyperparameters from tuning with `finalize_workflow` and `select_best`, e.g.,

```{r}
# Finalize the workflow with the best hyperparameters
wf_final = wf |> finalize_workflow(select_best(tune_res, 'roc_auc'))
```

The code above selects the best model according to the `roc_auc` metric, but you can change that to whatever metric you think is most important. Then you can fit the final model on the training data and predict on the test data, e.g.,

```{r}
# Fit the final model on the training data
final_fit = fit(wf_final, data = train_df)
# Predict on the test data
pred_final = predict(final_fit, new_data = test_df, type = 'prob')
```

Notice that the predicted values from the final model are probabilities again (for each class). You will need to convert those into class predictions again.

**[18]** How do the *test* accuracy, sensitivity, and precision for the tuned logistic elastic net model compare to the untuned logistic regression model?

**[19]** What are your final conclusions? Which model would you choose to use in practice? Why?

**[20]** What are your takeaways from this project? What did you learn? What was challenging? What was fun? What would you do differently next time?
