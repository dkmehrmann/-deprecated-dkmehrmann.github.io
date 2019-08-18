---
layout: post
title: "Data Science Interview Guide"
author: "Andrew Mehrmann"
date: "August 17, 2019"
output: html_document
tags: technical
---

## Things Inteviewers Like to Hear
<hr>

### "It depends"

### "I'd probably start with something simple"

### "I'd want to talk to the business partners"

A common example of this is to think about a data scientist choosing a classification model of a set of possible models. She might want to minimize false positives, or minimize false negatives, or somehow balance the two. It comes down to the relative cost to the business of a false positive vs. a false negative.

### "I don't know"


## Statistics
<hr>

### Distributions

### CLT

### Statistical Tests



## Modeling and Machine Learning
<hr>

### Algorithms

Regression (GLMs), Trees (Random Forest and GBM), and Neural Nets (CNN, RNN) are going to do most of your heavy lifting. Brush up on benefits and drawbacks of each.

Don't worry much about SVMs

### Model Evaluation and Metrics (Train/Tune/Test, Cross-Validation)

Be able to write the CV algorithm out. What happens as you change the number of folds in a k-fold cross validation? CV provides a variance estimate of the prediction error that results from permutations of the data but also changes in the model structure.

### Regularization and Hyperparameter Tuning

Regularization helps control overfitting. It can also help select variables in the case of LASSO regression, for example. Remember though that your parameter estimates in a regularized regression will be *biased*, meaning they lose some of their interpretability. As an aside, I'm generally not a fan of greedy methods like forward/backward selection. They're often computationally slow and leave you with a somewhat arbitrary set of variables in the final model. If you're analyzing a wide dataset, that's a good sign you shouldn't be using linear regression.

Tuning of regularization parameters or other hyperparameters can be done in an automated way using brute force techniques like grid search or probabalistic techniques like randomized search, or even smarter techniques.

Grid/Random Search, LASSO/Ridge, Overfitting/Underfitting)


### Model Metrics (Gini/AUC, F1, Precision, Recall, Accuracy)

Don't forget in-time versus out-of-time test sets. Will your prediction be made on data in the future? Your out-of-time data should be scored as few times as possible, *after* the parameters have been tuned. It's possible to hack the test set if you have enough iterations of CV and tuning!


### Regression Assumptions



## Programming
<hr>

### Python/R

### SQL

### Big Data Tech (Spark, Hive, NoSQL)

### Git

### Algorithmic Complexity

## Other Topics

### Experimentation

### Time Series Analysis

### Recommender Systems
