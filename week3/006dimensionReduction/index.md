---
title       : Principal components analysis and singular value decomposition
subtitle    : 
author      : Jeffrey Leek, Assistant Professor of Biostatistics 
job         : Johns Hopkins Bloomberg School of Public Health
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow   # 
widgets     : [mathjax]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
---





## Matrix data 


```r
set.seed(12345); par(mar=rep(0.2,4))
dataMatrix <- matrix(rnorm(400),nrow=40)
image(1:10,1:40,t(dataMatrix)[,nrow(dataMatrix):1])
```

<div class="rimage center"><img src="fig/randomData.png"  class="plot" /></div>


---

## Cluster the data 


```r
par(mar=rep(0.2,4))
heatmap(dataMatrix)
```

<div class="rimage center"><img src="fig/unnamed-chunk-1.png"  class="plot" /></div>


---

## What if we add a pattern?


```r
set.seed(678910)
for(i in 1:40){
  # flip a coin
  coinFlip <- rbinom(1,size=1,prob=0.5)
  # if coin is heads add a common pattern to that row
  if(coinFlip){
    dataMatrix[i,] <- dataMatrix[i,] + rep(c(0,3),each=5)
  }
}
```



---

## What if we add a pattern? - the data


```r
par(mar=rep(0.2,4))
image(1:10,1:40,t(dataMatrix)[,nrow(dataMatrix):1])
```

<div class="rimage center"><img src="fig/unnamed-chunk-2.png"  class="plot" /></div>



---

## What if we add a pattern? - the clustered data


```r
par(mar=rep(0.2,4))
heatmap(dataMatrix)
```

<div class="rimage center"><img src="fig/unnamed-chunk-3.png"  class="plot" /></div>




---

## Patterns in rows and columns




```r
hh <- hclust(dist(dataMatrix)); dataMatrixOrdered <- dataMatrix[hh$order,]
par(mfrow=c(1,3))
image(t(dataMatrixOrdered)[,nrow(dataMatrixOrdered):1])
plot(rowMeans(dataMatrixOrdered),40:1,,xlab="Row",ylab="Row Mean",pch=19)
plot(colMeans(dataMatrixOrdered),xlab="Column",ylab="Column Mean",pch=19)
```

<div class="rimage center"><img src="fig/oChunk.png"  class="plot" /></div>


---

## Related problems

You have multivariate variables $X_1,\ldots,X_n$ so $X_1 = (X_{11},\ldots,X_{1m})$

* Find a new set of multivariate variables that are uncorrelated and explain as much variance as possible.
* If you put all the variables together in one matrix, find the best matrix created with fewer variables (lower rank) that explains the original data.


The first goal is <font color="#330066">statistical</font> and the second goal is <font color="#993300">data compression</font>.

---

## Related solutions - PCA/SVD

__SVD__

If $X$ is a matrix with each variable in a column and each observation in a row then the SVD is a "matrix decomposition"

$$ X = UDV^T$$

where the columns of $U$ are orthogonal (left singular vectors), the columns of $V$ are orthogonal (right singluar vectors) and $D$ is a diagonal matrix (singular values). 

__PCA__

The principal components are equal to the right singular values if you first scale (subtract the mean, divide by the standard deviation) the variables.

---

## Components of the SVD - u and v


```r
svd1 <- svd(scale(dataMatrixOrdered))
par(mfrow=c(1,3))
image(t(dataMatrixOrdered)[,nrow(dataMatrixOrdered):1])
plot(svd1$u[,1],40:1,,xlab="Row",ylab="First left singular vector",pch=19)
plot(svd1$v[,1],xlab="Column",ylab="First right singular vector",pch=19)
```

<div class="rimage center"><img src="fig/unnamed-chunk-4.png"  class="plot" /></div>



---

## Components of the SVD - d and variance explained


```r
svd1 <- svd(scale(dataMatrixOrdered))
par(mfrow=c(1,2))
plot(svd1$d,xlab="Column",ylab="Singluar value",pch=19)
plot(svd1$d^2/sum(svd1$d^2),xlab="Column",ylab="Percent of variance explained",pch=19)
```

<div class="rimage center"><img src="fig/unnamed-chunk-5.png"  class="plot" /></div>



---

## Relationship to principal components


```r
svd1 <- svd(scale(dataMatrixOrdered))
pca1 <- prcomp(dataMatrixOrdered,scale=TRUE)
plot(pca1$rotation[,1],svd1$v[,1],pch=19,xlab="Principal Component 1",ylab="Right Singular Vector 1")
abline(c(0,1))
```

<div class="rimage center"><img src="fig/unnamed-chunk-6.png"  class="plot" /></div>


---

## Components of the SVD - variance explained


```r
constantMatrix <- dataMatrixOrdered*0
for(i in 1:dim(dataMatrixOrdered)[1]){constantMatrix[i,] <- rep(c(0,1),each=5)}
svd1 <- svd(constantMatrix)
par(mfrow=c(1,3))
image(t(constantMatrix)[,nrow(constantMatrix):1])
plot(svd1$d,xlab="Column",ylab="Singluar value",pch=19)
plot(svd1$d^2/sum(svd1$d^2),xlab="Column",ylab="Percent of variance explained",pch=19)
```

<div class="rimage center"><img src="fig/unnamed-chunk-7.png"  class="plot" /></div>



---

## What if we add a second pattern?


```r
set.seed(678910)
for(i in 1:40){
  # flip a coin
  coinFlip1 <- rbinom(1,size=1,prob=0.5)
  coinFlip2 <- rbinom(1,size=1,prob=0.5)
  # if coin is heads add a common pattern to that row
  if(coinFlip1){
    dataMatrix[i,] <- dataMatrix[i,] + rep(c(0,5),each=5)
  }
  if(coinFlip2){
    dataMatrix[i,] <- dataMatrix[i,] + rep(c(0,5),5)
  }
}
hh <- hclust(dist(dataMatrix)); dataMatrixOrdered <- dataMatrix[hh$order,]
```


---

## Singular value decomposition - true patterns 


```r
svd2 <- svd(scale(dataMatrixOrdered))
par(mfrow=c(1,3))
image(t(dataMatrixOrdered)[,nrow(dataMatrixOrdered):1])
plot(rep(c(0,1),each=5),pch=19,xlab="Column",ylab="Pattern 1")
plot(rep(c(0,1),5),pch=19,xlab="Column",ylab="Pattern 2")
```

<div class="rimage center"><img src="fig/unnamed-chunk-8.png"  class="plot" /></div>


---

##  v and patterns of variance in rows


```r
svd2 <- svd(scale(dataMatrixOrdered))
par(mfrow=c(1,3))
image(t(dataMatrixOrdered)[,nrow(dataMatrixOrdered):1])
plot(svd2$v[,1],pch=19,xlab="Column",ylab="First right singluar vector")
plot(svd2$v[,2],pch=19,xlab="Column",ylab="Second right singluar vector")
```

<div class="rimage center"><img src="fig/unnamed-chunk-9.png"  class="plot" /></div>



---

##  d and variance explained


```r
svd1 <- svd(scale(dataMatrixOrdered))
par(mfrow=c(1,2))
plot(svd1$d,xlab="Column",ylab="Singluar value",pch=19)
plot(svd1$d^2/sum(svd1$d^2),xlab="Column",ylab="Percent of variance explained",pch=19)
```

<div class="rimage center"><img src="fig/unnamed-chunk-10.png"  class="plot" /></div>




---

## fast.svd function {corpcor}

Important parameters: _m_,_tol_

```r
bigMatrix <- matrix(rnorm(1e4*40),nrow=1e4)
system.time(svd(scale(bigMatrix)))
```

```
   user  system elapsed 
  0.151   0.013   0.166 
```

```r
system.time(fast.svd(scale(bigMatrix),tol=0))
```

```
   user  system elapsed 
  0.115   0.009   0.127 
```



---

## Missing values


```r
dataMatrix2 <- dataMatrixOrdered
dataMatrix2[sample(1:100,size=40,replace=F)] <- NA
svd1 <- svd(scale(dataMatrix2))
```

```
Error: infinite or missing values in 'x'
```



---

## Imputing {impute}


```r
library(impute)
dataMatrix2 <- dataMatrixOrdered
dataMatrix2[sample(1:100,size=40,replace=F)] <- NA
dataMatrix2 <- impute.knn(dataMatrix2)$data
svd1 <- svd(scale(dataMatrixOrdered)); svd2 <- svd(scale(dataMatrix2))
par(mfrow=c(1,2)); plot(svd1$v[,1],pch=19); plot(svd2$v[,1],pch=19)
```

<div class="rimage center"><img src="fig/unnamed-chunk-13.png"  class="plot" /></div>




---

## Face example


```r
download.file("https://spark-public.s3.amazonaws.com/dataanalysis/face.rda",destfile="./data/face.rda",method="curl")
load("./data/face.rda")
image(t(faceData)[,nrow(faceData):1])
```

<div class="rimage center"><img src="fig/loadFaceData.png"  class="plot" /></div>



---

## Face example - variance explained


```r
svd1 <- svd(scale(faceData))
plot(svd1$d^2/sum(svd1$d^2),pch=19,xlab="Singluar vector",ylab="Variance explained")
```

<div class="rimage center"><img src="fig/unnamed-chunk-14.png"  class="plot" /></div>


---

## Face example - create approximations


```r

svd1 <- svd(scale(faceData))
# %*% is matrix multiplication

# Here svd1$d[1] is a constant
approx1 <- svd1$u[,1] %*% t(svd1$v[,1]) * svd1$d[1]

# In these examples we need to make the diagonal matrix out of d
approx5 <- svd1$u[,1:5] %*% diag(svd1$d[1:5])%*% t(svd1$v[,1:5]) 
approx10 <- svd1$u[,1:10] %*% diag(svd1$d[1:10])%*% t(svd1$v[,1:10]) 
```


---

## Face example - plot approximations

```r
par(mfrow=c(1,4))
image(t(faceData)[,nrow(faceData):1])
image(t(approx10)[,nrow(approx10):1])
image(t(approx5)[,nrow(approx5):1])
image(t(approx1)[,nrow(approx1):1])
```

<div class="rimage center"><img src="fig/unnamed-chunk-15.png"  class="plot" /></div>



---

## Notes and further resources

* Scale matters
* PC's/SV's may mix real patterns
* Can be computationally intensive
* [Advanced data analysis from an elementary point of view](http://www.stat.cmu.edu/~cshalizi/ADAfaEPoV/ADAfaEPoV.pdf)
* [Elements of statistical learning](http://www-stat.stanford.edu/~tibs/ElemStatLearn/)
* Alternatives
  * [Factor analysis](http://en.wikipedia.org/wiki/Factor_analysis)
  * [Independent components analysis](http://en.wikipedia.org/wiki/Independent_component_analysis)
  * [Latent semantic analysis](http://en.wikipedia.org/wiki/Latent_semantic_analysis)









