---
title       : Sources of data sets
subtitle    : 
author      : Jeffrey Leek, Assistant Professor of Biostatistics 
job         : Johns Hopkins Bloomberg School of Public Health
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : zenburn   # 
widgets     : [mathjax]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
---





## Data are defined by how they are collected

__Main types__
* Census (descriptive)
* Observational study (inferential)
* Convenience sample (all types - may be biased)
* Randomized trial (causal)

__Other types__

* Prediction study  (prediction)
* Studies over time 
  * Cross sectional (inferential)
  * Longitudinal (inferential, predictive)
* Retrospective (inferential)

---
## A population

<img class=center src=assets/img/where/Slide01.jpg height='80%'/>

---

## Pick a person and measure

<img class=center src=assets/img/where/Slide02.jpg height='80%'/>

---

## Census 

<img class=center src=assets/img/where/Slide03.jpg height='80%'/>

---

## Observational study 

```r
set.seed(5)
sample(1:8,size=4,replace=FALSE)
```

```
[1] 2 5 6 8
```


<img class=center src=assets/img/where/Slide04.jpg height='60%'/>

---

## Convenience sample 

```r
probs = c(5,5,5,5,1,1,1,1)/24
sample(1:8,size=4,replace=FALSE,prob=probs)
```

```
[1] 4 1 2 5
```


<img class=center src=assets/img/where/Slide05.jpg height='60%'/>

---
## Randomized trial 

```r
treat1 = sample(1:8,size=2,replace=FALSE); treat2 = sample(2:7,size=2,replace=FALSE)
c(treat1,treat2)
```

```
[1] 8 1 3 4
```



<img class=center src=assets/img/where/Slide06.jpg height='50%'/>

---
## Prediction study: train 

```r
set.seed(5)
sample(1:8,size=4,replace=FALSE)
```

```
[1] 2 5 6 8
```



<img class=center src=assets/img/where/Slide04.jpg height='60%'/>

---
## Prediction study: test 

```r
sample(c(1,3,4,7),size=2,replace=FALSE)
```

```
[1] 1 4
```


<img class=center src=assets/img/where/Slide08.jpg height='60%'/>

---
## Study over time: cross-sectional 

<img class=center src=assets/img/where/Slide09.jpg height='80%'/>

---
## Study over time: longitudinal 

<img class=center src=assets/img/where/Slide10.jpg height='80%'/>

---
## Study over time: retrospective 
<img class=center src=assets/img/where/Slide11.jpg height='80%'/>


