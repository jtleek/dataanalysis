---
title       : Simulation basics
subtitle    : 
author      : Jeffrey Leek, Assistant Professor of Biostatistics 
job         : Johns Hopkins Bloomberg School of Public Health
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : zenburn   # 
widgets     : [mathjax]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
---



## Important simulation functions

__Distributions__
* rbeta, rbinom, rcauchy, rchisq, rexp, rf, rgamma, rgeom, rhyper, rlogis, rlnorm, rnbinom, rnorm, rpois, rt, runif, rweibull

__Densities__

* dbeta,dbinom, dcauchy, dchisq, dexp, df, dgamma, dgeom, dhyper, dlogis, dlnorm, dnbinom, dnorm, dpois, dt, dunif, dweibull

__Sampling__
* sample(,replace=TRUE),sample(replace=FALSE)


---

## r_foo_ functions generate data 

__Normal__

```r
args(rnorm)
```

```
function (n, mean = 0, sd = 1) 
NULL
```

```r
heights = rnorm(10,mean=188,sd=3)
heights
```

```
 [1] 186.0 191.2 187.6 187.9 186.6 187.2 187.2 189.5 190.8 186.4
```


---

## r_foo_ functions generate data

__Binomial__

```r
args(rbinom)
```

```
function (n, size, prob) 
NULL
```

```r
coinFlips = rbinom(10,size=10,prob=0.5)
coinFlips
```

```
 [1] 3 4 6 5 7 6 5 8 5 6
```



---

## Example distribution: Normal

__Normal Distribution: $N(\mu,\sigma)$__
* $X \sim N(0,1)$

<div class="rimage center"><img src="fig/unnamed-chunk-3.png"  class="plot" /></div>


---

## d_foo_ functions calculate the density
__Normal__

```r
args(dnorm)
```

```
function (x, mean = 0, sd = 1, log = FALSE) 
NULL
```

```r
x = seq(from=-5,to=5,length=10)
normalDensity = dnorm(x,mean=0,sd=1)
round(normalDensity,2)
```

```
 [1] 0.00 0.00 0.01 0.10 0.34 0.34 0.10 0.01 0.00 0.00
```


---


## Example distribution: Binomial

__Binomial distribution: $Bin(n,p)$__
* $X \sim Bin(10,0.5)$
<div class="rimage center"><img src="fig/unnamed-chunk-5.png"  class="plot" /></div>


---
## d_foo_ functions calculate the density
__Binomial__

```r
args(dbinom)
```

```
function (x, size, prob, log = FALSE) 
NULL
```

```r
x = seq(0,10,by=1)
binomialDensity = dbinom(x,size=10,prob=0.5)
round(binomialDensity,2)
```

```
 [1] 0.00 0.01 0.04 0.12 0.21 0.25 0.21 0.12 0.04 0.01 0.00
```


---
## Sample draws a random sample

```r
args(sample)
```

```
function (x, size, replace = FALSE, prob = NULL) 
NULL
```

```r
heights = rnorm(10,mean=188,sd=3)
heights
```

```
 [1] 187.2 185.4 187.9 187.3 184.8 190.3 185.0 188.2 190.0 188.1
```

```r
sample(heights,size=10,replace=TRUE)
```

```
 [1] 188.2 188.2 184.8 185.0 187.2 188.2 187.9 185.4 184.8 185.4
```


---

## Sample draws a random sample


```r
heights
```

```
 [1] 187.2 185.4 187.9 187.3 184.8 190.3 185.0 188.2 190.0 188.1
```

```r
sample(heights,size=10,replace=FALSE)
```

```
 [1] 185.0 188.2 188.1 184.8 190.3 187.9 187.2 185.4 190.0 187.3
```


---

## Sample can draw according to a set of probabilities

```r
heights
```

```
 [1] 187.2 185.4 187.9 187.3 184.8 190.3 185.0 188.2 190.0 188.1
```

```r
probs = c(0.4,0.3,0.2,0.1,0,0,0,0,0,0)
sum(probs)
```

```
[1] 1
```

```r
sample(heights,size=10,replace=TRUE,prob=probs)
```

```
 [1] 187.2 185.4 187.9 187.3 185.4 187.2 185.4 187.2 187.2 185.4
```

---

## Setting a seed

Setting a seed ensures reproducible results from random processes in R

```r
set.seed(12345)
rnorm(5,mean=0,sd=1)
```

```
[1]  0.5855  0.7095 -0.1093 -0.4535  0.6059
```

```r

set.seed(12345)
rnorm(5,mean=0,sd=1)
```

```
[1]  0.5855  0.7095 -0.1093 -0.4535  0.6059
```



---

## For more information

__More on distributions in R__

[http://cran.r-project.org/web/views/Distributions.html](http://cran.r-project.org/web/views/Distributions.html)

__Computing for Data Analysis__

[Simulation in R](http://www.youtube.com/watch?v=tvv4IA8PEzw&list=PLjTlxb-wKvXOzI2h0F2_rYZHIXz8GWBop&index=6)
