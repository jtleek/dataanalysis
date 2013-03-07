---
title       : Prediction study design
subtitle    : 
author      : Jeffrey Leek, Assistant Professor of Biostatistics 
job         : Johns Hopkins Bloomberg School of Public Health
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow  # 
widgets     : [mathjax]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
---





## Key ideas

* Motivation
* Steps in predictive studies
* Choosing the right data
* Error measures
* Study design


---

## Why predict? Glory!

<img class=center src=assets/img/volinsky.png height='60%'/>


[http://www.zimbio.com/photos/Chris+Volinsky](http://www.zimbio.com/photos/Chris+Volinsky)



---

## Why predict? Riches!

<img class=center src=assets/img/heritage.png height='60%'/>


[http://www.heritagehealthprize.com/c/hhp](http://www.heritagehealthprize.com/c/hhp)



---

## Why predict? For sport!

<img class=center src=assets/img/kaggle.png height='60%'/>


[http://www.kaggle.com/](http://www.kaggle.com/)

---

## Why predict? To save lives!

<img class=center src=assets/img/oncotype.png height='40%'/>

[http://www.oncotypedx.com/en-US/Home](http://www.oncotypedx.com/en-US/Home)

---

## Steps in building a prediction

1. Find the right data
2. Define your error rate
3. Split data into:
  * Training 
  * Testing
  * Validation (optional)
4. On the training set pick features
5. On the training set pick prediction function
6. On the training set cross-validate
7. If no validation - apply 1x to test set
8. If validation - apply to test set and refine
9. If validation - apply 1x to validation 


---

## Find the right data

1. In some cases it is easy (movie ratings -> new movie ratings)
2. It may be harder (gene expression data -> disease)
3. Depends strongly on the definition of "good prediction".
3. Often [more data > better models](http://www.youtube.com/watch?v=yvDCzhbjYWs)
4. Know the bench mark
5. You need to start with raw data for predictions - processing is often cross-sample. 


---

## Know the benchmarks

Probability of perfect classification is approximately $\left(\frac{1}{2}\right)^{test \; set \; sample \; size}$

<img class=center src=assets/img/benchmark.png height='70%'/>

[http://www.heritagehealthprize.com/c/hhp/leaderboard](http://www.heritagehealthprize.com/c/hhp/leaderboard)

---

## Defining true/false positives

In general, __Positive__ = identified and __negative__ = rejected. Therefore:

__True positive__ = correctly identified

__False positive__ = incorrectly identified

__True negative__ = correctly rejected

__False negative__ = incorrectly rejected

_Medical testing example_:

__True positive__ = Sick people correctly diagnosed as sick

__False positive__= Healthy people incorrectly identified as sick

__True negative__ = Healthy people correctly identified as healthy

__False negative__ = Sick people incorrectly identified as healthy.

[http://en.wikipedia.org/wiki/Sensitivity_and_specificity](http://en.wikipedia.org/wiki/Sensitivity_and_specificity)

---

## Define your error rate

<img class=center src=assets/img/sensspec.png height='80%'/>


[http://en.wikipedia.org/wiki/Sensitivity_and_specificity](http://en.wikipedia.org/wiki/Sensitivity_and_specificity)

---

## Why your choice matters

<img class=center src=assets/img/sensspecex.png height='80%'/>


[http://en.wikipedia.org/wiki/Sensitivity_and_specificity](http://en.wikipedia.org/wiki/Sensitivity_and_specificity)

---

## Common error measures

1. Mean squared error (or root mean squared error)
  * Continuous data, sensitive to outliers
2. Median absolute deviation 
  * Continuous data, often more robust
3. Sensitivity (recall)
  * If you want few missed positives
4. Specificity
  * If you want few negatives called positives
5. Accuracy
  * Weights false positives/negatives equally
6. Concordance
  * One example is [kappa](http://en.wikipedia.org/wiki/Cohen%27s_kappa)
5. Predictive value of a positive (precision)
  * When you are screeing and prevelance is low

---

## Study design

<img class=center src=assets/img/studydesign.png height='60%'/>

[http://www2.research.att.com/~volinsky/papers/ASAStatComp.pdf](http://www2.research.att.com/~volinsky/papers/ASAStatComp.pdf)

---

## Key issues and further resources

_Issues_:

1. Accuracy 
2. Overfitting
3. Interpretability
4. Computational speed


_Resources_:

1. [Practical machine learning](http://www.cbcb.umd.edu/~hcorrada/PracticalML/)
2. [Elements of statistical learning](http://www-stat.stanford.edu/~tibs/ElemStatLearn/)
3. [Coursera machine learning](https://www.coursera.org/course/ml)
4. [Machine learning for hackers](http://www.amazon.com/Machine-Learning-Hackers-Drew-Conway/dp/1449303714)
