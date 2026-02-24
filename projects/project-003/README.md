# Trees, ensembles, and boosting

**Due Tuesday, 01 March 2026 11:59 PM (Pacific Time)**

Submit your write up with code and output (a knitted/rendered PDF or HTML) on Canvas.

**Purpose** We have two main goals with this project.

- Continue to build your tools/knowledge of classification problems.
- Experience prediction with decision trees and tree ensembles.

## Getting started

**README** We are using the same [dataset](https://github.com/edrubin/EC524W26/blob/master/projects/project-003/data-churn.csv) from `project-002`. Recall that the data contain information on European bank customers and whether they _churned_ (stopped being a customer). As with the last problem set, the goal is to predict whether a customer will churn based on their characteristics. This *churn* variable is the target variable for our classification task—and an important one for businesses to understand and manage.

**[00]** Start by loading packages and the [data](https://github.com/edrubin/EC524W26/blob/master/projects/project-003/data-churn.csv).

*Recall:* The data originate from [Kaggle](https://www.kaggle.com/datasets/gauravtopre/bank-customer-churn-dataset/data). You can find a description of the dataset there.

## Make a split

Let's start at the beginning... the first split.

**[01]** For the first five (real) variables (`credit_score` through `tenure`), how many possible splits are there for each variable? (*Hint:* It may help to start small and scale up.)

**[02]** For the first five observations (rows `1:5`) and the first five (real) variables (`credit_score` through `tenure`), calculate the Gini and entropy for the target variable (`churn`) for each possible split of each variable.

**[03]** Which variable and which split would be chosen for the first split in a decision tree? Would entropy and Gini lead to the same first split?

## Grow a tree

Now that you know how to grow a tree, we can just let `tidymodels` do it for you.

**[04]** Use `tidymodels` to [grow a tree](https://parsnip.tidymodels.org/reference/decision_tree.html) (actually multiple trees). Remember: We can (**need to**) *tune* the cost complexity (`cost_complexity`) to try to restrict the tree from overfitting.

**[05]** How did it go? Did the best tree need pruning?

## And now forests

Why stop at one tree?

**[06]** How does _bagging_ relate to _random forests_?

**[07]** Now use `tidymodels` to tune (with CV) a [random forest](https://parsnip.tidymodels.org/reference/rand_forest.html). Make sure you tune the relevant parameters (what are they?).

_Hint:_ Remember that you will need to tell the `ranger` engine that you want to do classification (e.g., with `mode = 'classification'`). Also remember that tuning _many_ parameters with _many_ trees can be computationally expensive. You may want to start with a relatively small number of trees and hyperparameters to make sure your code is working before you scale up.

**[08]** How does the best random forest's performance compare to the best single tree? Which model would you choose in practice?

## Boosting

One more tree-based model to try: boosting.

**[09]** What is boosting? How does it differ from bagging and random forests?

**[10]** Use `tidymodels` to tune (with CV) a [boosted tree](https://parsnip.tidymodels.org/reference/boost_tree.html). Make sure you tune the relevant parameters (what are they?).

**[11]** How does the best boosted tree's performance compare to the best single tree and the best random forest? Which model would you choose in practice?

## Wrapping up

**[12]** In a few sentences, summarize your findings. Which model performed best? Why do you think that is? What are the trade-offs between the different models you tried?

**[13]** How did your best model in this project compare to your best model in `project-002`? Why do you think that is?

**[14]** What are the advantages and disadvantages of tree-based models compared to the models you tried in `project-002`? When might you prefer one over the other?

**[15]** What is one thing you learned in this project that you found interesting or surprising? What is one thing you found confusing or difficult? What is one thing you would like to learn more about?
