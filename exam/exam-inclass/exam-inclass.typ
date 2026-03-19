#set page(
  paper: "us-letter",
  margin: (x: 1.1in, y: 1.1in),
  numbering: "1",
)

#set text(
  font: "Fira Sans",
  size: 10.5pt,
)

#set par(
  justify: false,
  leading: 0.78em,
)

// Some handy macros
#let eg = [_e.g._,]
#let ie = [_i.e._,]

// Macros for formatting questions and answers.

#let question(num, points: 4, body) = [
  #text(weight: "bold")[#num.] (#points points) #body
]

// Set to `true` to show answers, `false` to hide them.
#let showanswers = false
#let showanswers = true
// Function to conditionally show answers.
#let answer(body) = if showanswers [
  #set par(justify: true)
  #pad(left: 0.2in, right: 0.5in)[#text(fill: orange)[#body]]
] else [
  #set par(justify: true)
  #pad(left: 0.2in, right: 0.5in)[#text(fill: orange)[#hide[#body]]]
]

*Name:* #line(length: 6.3in, stroke: 0.5pt)

#v(16pt)

#align(center)[
  #text(size: 16pt, weight: "bold")[In-class final, EC524/424, Winter 2026]
  #linebreak()
  #v(4pt)
  #text(size: 12pt)[120 points possible]
]

#v(16pt)

*Instructions* A short response and/or sketch suffices for most of the following questions.
#linebreak() Do not write more than necessary. Excessively long responses will be penalized.

#v(10pt)

#question(1)[Briefly explain how prediction fundamentally differs from causal inference.]

#answer([
In prediction, we are primarily concerned with accurately estimating the *outcome variable* based on the observed data, without necessarily understanding the underlying causal relationships. Given a set of features, we want a good estimate of the outcome. In contrast, causal inference aims to identify and estimate the effect of one variable on another, #ie understanding how a small change in one feature translates to changes in the outcome. Accordingly, prediction generally focuses on minimizing prediction error with potentially complex models. Causal inference typically relies on simpler, more interpretable models that are unbiased/consistent within some set of assumptions.
])

#v(1fr)

#question(2)[Explain the difference between supervised and unsupervised learning.]

#answer([
In _supervised_ learning, we have a task and dataset that includes both the input features _and_ the corresponding output labels (or target variable). The goal is to learn a mapping from the inputs to the outputs, so that we can make predictions on new, unseen data.

With _unsupervised_ learning, we only have the input features and no corresponding output labels. The goal is to find patterns, structure, or relationships within the data itself.
])

#v(1fr)

#pagebreak()

#question(3)[When we say one model is more _flexible_ or less _parametric_ than another, what do we mean? Give one example of a relatively flexible model and one example of a relatively less flexible model.]

#answer([
A more _flexible_ or less _parametric_ model makes fewer assumptions about the relationship/functional form that maps the inputs to the output. K-nearest neighbors and random forests are two relatively flexible and less parametric approaches. 

In contrast, linear regression and logistic regression are relatively less flexible and more parametric, as they assume a specific functional form (linear or logistic) for the relationship between the inputs and the output.
])

#v(1fr)

#question(4)[Define _irreducible error_. Why can no learning algorithm eliminate it completely?]

#answer([
The _irreducible error_ is the component of the total error ($y-hat(y)$) that is independent of the features. Because it is independent of the features, no matter how good of an estimate of $f$ we produce, there is still a component of $y$ that is not explainable by our features and cannot be learned/reduced by any model that uses the features.
])

#v(1fr)

#question(5)[In the context of the bias-variance tradeoff, define what we mean by _bias_.]

#answer([
Let $y = f(X) + epsilon$, where $f$ is the function that maps the features to the output and $epsilon$ is the irreducible error. The _bias_ of a learning algorithm is the difference between the expected value of $hat(f)$ and the true function $f(X)$.
])

#v(1fr)

#pagebreak()

#question(6)[In the context of the bias-variance tradeoff, define what we mean by _variance_.]

#answer([
The _variance_ of a learning algorithm is the variability of the model's predictions for different training sets: how much the fitted $hat(f)$ and the resulting predictions would change if we estimated it using a different training set.
])

#v(1fr)

#question(7)[Describe how increasing a model's flexibility typically affects training error and test error.]

#answer([
Increasing a model's flexibility generally decreases the training error; however, increasing a model's flexibility _does not_ always decrease the test error. At some point, with increased flexibility, we begin overfitting the training data, #ie training on the irreducible error, which will increase the test error. 
])

#v(1fr)

#question(8)[Why do we generally prefer _k_-fold cross-validation over the validation-set approach?]

#answer([
The validation-set approach uses only a single split of the data into training and validation sets, which can lead to high variability in the estimate of test error depending on how the data is split. In contrast, _k_-fold cross-validation averages the test error across multiple splits of the data, providing a more stable and reliable estimate of the model's performance on unseen data, without increasing computational demands very much.
])

#v(1fr)

#pagebreak()

#question(9)[What does it mean to _tune_ a model?]

#answer([
To _tune_ a model means to select the optimal value of one or more hyperparameters that control the learning process. This is typically done by evaluating the model's performance on a validation set or through cross-validation, and choosing the hyperparameter values that minimize the estimated test error.
])

#v(1fr)

#question(10)[What is bootstrapping, and why is it useful in prediction problems?]

#answer([
Bootstrapping is a resampling technique that involves repeatedly drawing samples (with replacement) from the original dataset and fitting the model to each of these samples. This approach allows us to estimate the variability of a set of estimates. The approach is also useful for generating additional training data, which can be used to reduce the variance of a model's predictions, especially for flexible models that are prone to overfitting (#eg trees).
])

#v(1fr)

#question(11)[Why might we prefer shrinkage methods despite their potential for bias?]

#answer([
Shrinkage methods, such as ridge regression, lasso, and elasticnet, can reduce the variance of a model's predictions by introducing some bias. In many cases, the reduction in variance more than compensates for the increase in bias, resulting in better overall predictive performance on unseen data.
])

#v(1fr)

#pagebreak()

#question(12)[Why do we normalize our predictors before fitting a penalized regression model?]

#answer([
We normalize our predictors before fitting a penalized regression model because the penalty term is applied to the coefficients of the predictors. If the predictors are on different scales, the penalty will affect them differently, which can lead to suboptimal model performance. Normalizing the predictors ensures that the penalty is applied uniformly across all predictors, allowing for a fair comparison of their importance and improving the model's performance.
])

#v(1fr)

#question(13)[What is the key difference between ridge and lasso? Which one can set coefficients exactly equal to zero?]

#answer([
The key difference between ridge and lasso is the type of penalty they use. Ridge regression uses an L2 penalty, which adds the squared magnitude of the coefficients to the loss function, while lasso regression uses an L1 penalty, which adds the absolute value of the coefficients to the loss function. Lasso can set coefficients exactly equal to zero, effectively performing variable selection, while ridge regression shrinks coefficients towards zero but does not set them exactly to zero.
])

#v(1fr)

#question(14)[Explain how _k_-nearest neighbors (KNN) makes a prediction for a new observation.]

#answer([
KNN makes a prediction for a new observation by identifying the _k_ closest training observations in the feature space and then aggregating their corresponding output values. For regression tasks, KNN typically takes the average of the output values of the nearest neighbors to make a prediction. For classification tasks, KNN often uses a majority vote among the nearest neighbors to determine the predicted class for the new observation.
])

#v(1fr)

#pagebreak()

#question(15)[Why might we prefer logistic regression over linear regression for classification tasks?]

#answer([
We may prefer logistic regression over linear regression for (binary) classification tasks because it models the probability of the outcome variable being in a particular class using the logistic function, which ensures that the predicted probabilities are between 0 and 1. Logistic regression also relaxes the assumption of a linear relationship between the features and the output variable, allowing for a more flexible decision boundary. 
])

#v(1fr)

#question(16)[Suppose you raise a classifier's probability cutoff from 0.5 to 0.8. What would likely happen to sensitivity and precision?]

#answer([
Raising the probability cutoff from 0.5 to 0.8 would likely decrease sensitivity (_true positive rate_ or accuracy among true positives) because fewer observations would be classified as positive, leading to more false negatives. On the other hand, precision (accuracy among predicted positives) would likely increase because the observations that are classified as positive are more likely to be true positives, resulting in fewer false positives.
])

#v(1fr)

#question(17)[Draw a confusion matrix for a binary classifier and explain what information it provides.]

#answer([
A confusion matrix for a binary classifier is a 2x2 table that summarizes the performance of the classifier by showing the counts of true positives (TP), false positives (FP), true negatives (TN), and false negatives (FN). The rows typically represent the actual classes, while the columns represent the predicted classes. Together, these values allow us To see the types of correct and incorrect predictions that the model makes rather than clumping all correct guesses and errors together.

#table(
  columns: 3,
  align: center,
  stroke: none,
  [], [*Pred:* Positive], [*Pred:* Negative],
  [*Truth:* Positive], [TP], [FN],
  [*Truth:* Negative], [FP], [TN],
)

])

#v(1fr)

#pagebreak()

#question(18)[Define the _null classifier_. Why is it a useful benchmark, especially when classes are imbalanced?]

#answer([
The _null classifier_ is a classifier that ignores the features and always predicts the same class, usually the majority class. It is a useful benchmark because, when classes are imbalanced, a model can have high overall accuracy simply by always guessing the majority class. A good classifier should beat this baseline.
])

#v(1fr)

#question(19)[Describe, at a high level, how a decision tree is grown.]

#answer([
A decision tree is grown recursively---typically via greedy, binary, recursive splitting. Starting with all of the training data, we search over predictors and possible split points, choose the split that most improves fit (for example, lowers RSS or impurity), and then repeat the process within each resulting branch. We continue until some stopping rule is met.
])

#v(1fr)

#question(20)[Why do we prune decision trees?]

#answer([
We prune decision trees because a very deep tree tends to overfit the training data and have high variance. Pruning removes splits that add little out-of-sample value, which usually improves test performance (and makes the tree easier to interpret).
])

#v(1fr)

#pagebreak()

#question(21)[Why do classification trees usually split with Gini or entropy rather than accuracy?]

#answer([
Accuracy is a coarse criterion because many different splits can produce the same classification accuracy at a node. Gini and entropy are more sensitive to changes in class proportions, so they better measure how _pure_ a node is and give the algorithm a more informative objective when choosing splits.
])

#v(1fr)

#question(22)[Explain how combining many weak or unstable learners can improve prediction. #linebreak() Give one example of an algorithm that uses this idea.]

#answer([
If each learner is noisy or unstable, combining many of them can average out idiosyncratic mistakes and produce a more stable, accurate predictor. The basic idea is that the ensemble can be much better than any one weak learner. (Random forests are a classic example.)
])

#v(1fr)

#question(23)[What is the difference between bagging and boosting?]

#answer([
Bagging fits many models independently on bootstrap samples and then averages their predictions, mainly to reduce variance. Boosting fits models sequentially, with later models focusing more on the earlier mistakes, so it builds a strong learner by combining many weak learners in stages (rather than averaging independent many high-variance predictions).
])

#v(1fr)

#pagebreak()

#question(24)[How do random forests decorrelate trees?]

#answer([
Random forests decorrelate trees by forcing each split to consider only a random subset of predictors rather than all predictors. This makes different trees use different variables and split patterns, so their prediction errors are less correlated.
])

#v(1fr)

#question(25)[Explain the ROC curve. Specifically: What does it plot and what does it tell us?]

#answer([
The ROC curve plots the true positive rate against the false positive rate as we vary the classification cutoff. It shows the tradeoff between catching more positives and creating more false alarms. A curve closer to the upper-left corner indicates a better classifier---#ie a higher true positive rate with a low rate of false positives. 
])

#v(1fr)

#question(26)[In an SVM, what makes an observation a _support vector_?]

#answer([
A _support vector_ is an observation that lies on the margin, inside the margin, or across the margin, so it helps determine the location of the separating hyperplane (specifically, the support vectors are the data points that define the margin---the points for which the classifier _paid_ the penalty). Moving these points would change the fitted separator.
])

#v(1fr)

#pagebreak()

#question(27)[What role does the _cost_ (or penalty) parameter play in a soft-margin SVM?]

#answer([
The cost parameter controls how heavily the SVM penalizes margin violations and misclassifications. A large cost tries hard to classify the training data correctly and allows a narrower margin. A smaller cost allows more violations, producing a wider margin and more regularization.
])

#v(1fr)

#question(28)[At a high level, how does a kernel allow an SVM to fit a nonlinear decision boundary?]

#answer([
A kernel lets the SVM measure similarity as if the data had been transformed into a higher-dimensional feature space, without explicitly computing all of those new features. A linear separator in that transformed space can correspond to a nonlinear decision boundary in the original space.
])

#v(1fr)

#question(29, points: 8)[A classmate says, "K-means clustering is basically KNN without labels."

#v(0.75em)
a. In words, describe how K-means works.

#v(0.35em)
b. Give one clear reason your classmate's statement is wrong.]

#answer([
a. K-means starts by choosing $K$ cluster centers. It assigns each observation to the nearest center, recomputes each center as the mean of the observations assigned to it, and repeats those two steps until the assignments stop changing meaningfully. The goal is to minimize within-cluster variation.

b. The statement is wrong because K-means and KNN solve different problems. K-means is an _unsupervised_ clustering method that groups observations and estimates centroids, while KNN is a _supervised_ prediction method that uses labeled neighbors to predict an outcome for a new observation. Beyond solving different tasks, KNN produces predictions based upon *an observation's nearest neighbors*, while K-means produces cluster assignments (or potentially predictions, if you forced a prediction) based on *the nearest cluster centers*.
])

#v(1fr)
