---
title       : Data munging basics
subtitle    : 
author      : Jeffrey Leek, Assistant Professor of Biostatistics 
job         : Johns Hopkins Bloomberg School of Public Health
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : zenburn   # 
widgets     : [mathjax]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
---





## Recall Tidy Data

<img class=center src=assets/img/excel.png height='50%'/>

1. Each variable forms a column
2. Each observation forms a row
3. Each table/file stores data about one kind of observation (e.g. people/hospitals).


[http://vita.had.co.nz/papers/tidy-data.pdf](http://vita.had.co.nz/papers/tidy-data.pdf)

[Leek, Taub, and Pineda 2011 PLoS One](http://www.plosone.org/article/info%3Adoi%2F10.1371%2Fjournal.pone.0026895)

---

## Where we would like to be

* [Tidy data]([http://vita.had.co.nz/papers/tidy-data.pdf](http://vita.had.co.nz/papers/tidy-data.pdf) refers to the shape of the data
  * Variables in columns
  * Observations in rows
  * Tables holding elements of only one kind
* Plus
  * Column names are easy to use and informative
  * Row names are easy to use and informative
  * Obvious mistakes in the data have been removed
  * Variable values are internally consistent
  * Appropriate transformed variables have been added


---

## A partial list of munging operations

* Fix variable names
* Create new variables 
* Merge data sets
* Reshape data sets
* Deal with missing data 
* Take transforms of variables
* Check on and remove inconsistent values

__These steps must be recorded__

__90% of your effort will often be spent here__

---

## A partial list of munging operations

* <redtext> Fix variable names </redtext>
* <redtext> Create new variables </redtext>
* <redtext> Merge data sets</redtext>
* <redtext> Reshape data sets</redtext>
* Deal with missing data 
* Take transforms of variables
* Check on and remove inconsistent values


---

## Fixing character vectors - tolower(), toupper()





```r
cameraData <- read.csv("./data/cameras.csv")
names(cameraData)
```

```
[1] "address"      "direction"    "street"       "crossStreet" 
[5] "intersection" "Location.1"  
```

```r
tolower(names(cameraData))
```

```
[1] "address"      "direction"    "street"       "crossstreet" 
[5] "intersection" "location.1"  
```



---

## Fixing character vectors - strsplit()

* Good for automatically splitting variable names
* Important parameters: _x_, _split_


```r
splitNames = strsplit(names(cameraData),"\\.")
splitNames[[5]]
```

```
[1] "intersection"
```

```r
splitNames[[6]]
```

```
[1] "Location" "1"       
```

---

## Fixing character vectors - sapply()

* Applies a function to each element in a vector or list
* Important parameters: _X_,_FUN_


```r
splitNames[[6]][1]
```

```
[1] "Location"
```

```r
firstElement <- function(x){x[1]}
sapply(splitNames,firstElement)
```

```
[1] "address"      "direction"    "street"       "crossStreet" 
[5] "intersection" "Location"    
```


---

## Peer review experiment data

* Data on submissions/reviews in an experiment 

<img class=center src=assets/img/cooperation.png height='60%'/>

[http://www.plosone.org/article/info:doi/10.1371/journal.pone.0026895](http://www.plosone.org/article/info:doi/10.1371/journal.pone.0026895)


---

## Peer review data



```r
fileUrl1 <- "https://dl.dropbox.com/u/7710864/data/reviews-apr29.csv"
fileUrl2 <- "https://dl.dropbox.com/u/7710864/data/solutions-apr29.csv"
download.file(fileUrl1,destfile="./data/reviews.csv",method="curl")
download.file(fileUrl2,destfile="./data/solutions.csv",method="curl")
reviews <- read.csv("./data/reviews.csv"); solutions <- read.csv("./data/solutions.csv")
head(reviews,2)
```

```
  id solution_id reviewer_id      start       stop time_left accept
1  1           3          27 1304095698 1304095758      1754      1
2  2           4          22 1304095188 1304095206      2306      1
```

```r
head(solutions,2)
```

```
  id problem_id subject_id      start       stop time_left answer
1  1        156         29 1304095119 1304095169      2343      B
2  2        269         25 1304095119 1304095183      2329      C
```


---

## Fixing character vectors - sub(),gsub()

* Important parameters: _pattern_, _replacement_, _x_


```r
names(reviews)
```

```
[1] "id"          "solution_id" "reviewer_id" "start"      
[5] "stop"        "time_left"   "accept"     
```

```r
sub("_","",names(reviews),)
```

```
[1] "id"         "solutionid" "reviewerid" "start"      "stop"      
[6] "timeleft"   "accept"    
```


---

## Fixing character vectors - sub(),gsub()


```r
testName <- "this_is_a_test"
sub("_","",testName)
```

```
[1] "thisis_a_test"
```

```r
gsub("_","",testName)
```

```
[1] "thisisatest"
```



---

## Quantitative variables in ranges -  - cut()

* Important parameters: _x_,_breaks_


```r
reviews$time_left[1:10]
```

```
 [1] 1754 2306 2192 2089 2043 1999 2130   NA 1899 2024
```

```r
timeRanges <- cut(reviews$time_left,seq(0,3600,by=600))
timeRanges[1:10]
```

```
 [1] (1.2e+03,1.8e+03] (1.8e+03,2.4e+03] (1.8e+03,2.4e+03]
 [4] (1.8e+03,2.4e+03] (1.8e+03,2.4e+03] (1.8e+03,2.4e+03]
 [7] (1.8e+03,2.4e+03] <NA>              (1.8e+03,2.4e+03]
[10] (1.8e+03,2.4e+03]
6 Levels: (0,600] (600,1.2e+03] ... (3e+03,3.6e+03]
```


---

## Quantitative variables in ranges -  - cut()


```r
class(timeRanges)
```

```
[1] "factor"
```

```r
table(timeRanges,useNA="ifany")
```

```
timeRanges
          (0,600]     (600,1.2e+03] (1.2e+03,1.8e+03] 
               30                32                25 
(1.8e+03,2.4e+03]   (2.4e+03,3e+03]   (3e+03,3.6e+03] 
               28                 0                 0 
             <NA> 
               84 
```


---

## Quantitative variables in ranges - cut2() {Hmisc}


```r
library(Hmisc)
timeRanges<- cut2(reviews$time_left,g=6)
table(timeRanges,useNA="ifany")
```

```
timeRanges
[  22, 384) [ 384, 759) [ 759,1150) [1150,1496) [1496,1909) 
         20          19          19          19          19 
[1909,2306]        <NA> 
         19          84 
```



---

## Adding an extra variable 


```r
timeRanges<- cut2(reviews$time_left,g=6)
reviews$timeRanges <- timeRanges
head(reviews,2)
```

```
  id solution_id reviewer_id      start       stop time_left accept
1  1           3          27 1304095698 1304095758      1754      1
2  2           4          22 1304095188 1304095206      2306      1
   timeRanges
1 [1496,1909)
2 [1909,2306]
```


---

## Merging data - merge()

* Merges data frames
* Important parameters: _x_,_y_,_by_,_by.x_,_by.y_,_all_

```r
names(reviews)
```

```
[1] "id"          "solution_id" "reviewer_id" "start"      
[5] "stop"        "time_left"   "accept"      "timeRanges" 
```

```r
names(solutions)
```

```
[1] "id"         "problem_id" "subject_id" "start"      "stop"      
[6] "time_left"  "answer"    
```


---

## Merging data - merge()


```r
mergedData <- merge(reviews,solutions,all=TRUE)
head(mergedData)
```

```
  id      start       stop time_left solution_id reviewer_id accept
1  1 1304095119 1304095169      2343          NA          NA     NA
2  1 1304095698 1304095758      1754           3          27      1
3  2 1304095119 1304095183      2329          NA          NA     NA
4  2 1304095188 1304095206      2306           4          22      1
5  3 1304095127 1304095146      2366          NA          NA     NA
6  3 1304095276 1304095320      2192           5          28      1
   timeRanges problem_id subject_id answer
1        <NA>        156         29      B
2 [1496,1909)         NA         NA   <NA>
3        <NA>        269         25      C
4 [1909,2306]         NA         NA   <NA>
5        <NA>         34         22      C
6 [1909,2306]         NA         NA   <NA>
```


---

## Merging data - merge()


```r
mergedData2 <- merge(reviews,solutions,by.x="solution_id",by.y="id",all=TRUE)
head(mergedData2[,1:6],3)
```

```
  solution_id id reviewer_id    start.x     stop.x time_left.x
1           1  4          26 1304095267 1304095423        2089
2           2  6          29 1304095471 1304095513        1999
3           3  1          27 1304095698 1304095758        1754
```

```r
reviews[1,1:6]
```

```
  id solution_id reviewer_id      start       stop time_left
1  1           3          27 1304095698 1304095758      1754
```



---

## Sorting values - sort()

* Important parameters: _x_, _decreasing_


```r
mergedData2$reviewer_id[1:10]
```

```
 [1] 26 29 27 22 28 22 29 23 25 29
```

```r
sort(mergedData2$reviewer_id)[1:10]
```

```
 [1] 22 22 22 22 22 22 22 22 22 22
```


---

## Ordering values - order()

* Important parameters: _list of variables to order_, _na.last_,_decreasing_


```r
mergedData2$reviewer_id[1:10]
```

```
 [1] 26 29 27 22 28 22 29 23 25 29
```

```r
order(mergedData2$reviewer_id)[1:10]
```

```
 [1]  4  6 14 22 23 24 27 32 37 39
```

```r
mergedData2$reviewer_id[order(mergedData2$reviewer_id)]
```

```
  [1] 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22
 [22] 22 22 22 22 22 22 22 22 23 23 23 23 23 23 23 23 23 23 23 23 23
 [43] 23 23 23 23 23 23 23 23 23 23 23 23 23 23 23 23 24 24 24 24 24
 [64] 24 24 24 24 24 24 24 24 24 24 25 25 25 25 25 25 25 25 25 25 25
 [85] 25 25 25 25 25 25 25 25 25 25 25 26 26 26 26 26 26 26 26 26 26
[106] 26 26 26 26 26 26 26 26 26 26 26 26 26 26 26 26 26 27 27 27 27
[127] 27 27 27 27 27 27 27 27 27 27 27 27 27 27 27 27 27 27 27 27 27
[148] 27 27 27 27 27 28 28 28 28 28 28 28 28 28 28 28 28 28 28 28 28
[169] 28 28 28 28 28 28 28 28 28 28 29 29 29 29 29 29 29 29 29 29 29
[190] 29 29 29 29 29 29 29 29 29 29 NA NA NA NA NA NA
```


---

## Reordering a data frame


```r
head(mergedData2[,1:6],3)
```

```
  solution_id id reviewer_id    start.x     stop.x time_left.x
1           1  4          26 1304095267 1304095423        2089
2           2  6          29 1304095471 1304095513        1999
3           3  1          27 1304095698 1304095758        1754
```

```r
sortedData <- mergedData2[order(mergedData2$reviewer_id),]
head(sortedData[,1:6],3)
```

```
   solution_id id reviewer_id    start.x     stop.x time_left.x
4            4  2          22 1304095188 1304095206        2306
6            6 16          22 1304095303 1304095471        2041
14          14 12          22 1304095280 1304095301        2211
```


---

## Reordering by multiple variables


```r
head(mergedData2[,1:6],3)
```

```
  solution_id id reviewer_id    start.x     stop.x time_left.x
1           1  4          26 1304095267 1304095423        2089
2           2  6          29 1304095471 1304095513        1999
3           3  1          27 1304095698 1304095758        1754
```

```r
sortedData <- mergedData2[order(mergedData2$reviewer_id,mergedData2$id),]
head(sortedData[,1:6],3)
```

```
   solution_id id reviewer_id    start.x     stop.x time_left.x
4            4  2          22 1304095188 1304095206        2306
14          14 12          22 1304095280 1304095301        2211
6            6 16          22 1304095303 1304095471        2041
```



---

## Reshaping data - example


```r
misShaped <- as.data.frame(matrix(c(NA,5,1,4,2,3),byrow=TRUE,nrow=3))
names(misShaped) <- c("treatmentA","treatmentB")
misShaped$people <- c("John","Jane","Mary")
misShaped
```

```
  treatmentA treatmentB people
1         NA          5   John
2          1          4   Jane
3          2          3   Mary
```


[http://vita.had.co.nz/papers/tidy-data.pdf](http://vita.had.co.nz/papers/tidy-data.pdf)


---

## Reshaping data - melt()

* Important parameters: _id.vars_, _measure.vars_, _variable.name_


```r
melt(misShaped,id.vars="people",variable.name="treatment",value.name="value")
```

```
  people  treatment value
1   John treatmentA    NA
2   Jane treatmentA     1
3   Mary treatmentA     2
4   John treatmentB     5
5   Jane treatmentB     4
6   Mary treatmentB     3
```



---

## More resources

* [Tidy data and tidy tools](http://vita.had.co.nz/papers/tidy-data-pres.pdf)
* Andrew Jaffe's [Data Cleaning Lecture](https://dl.dropbox.com/u/7710864/courseraPublic/otherResources/lecture3/index.html)
* Hadley Wickham on [regular expressions](https://dl.dropbox.com/u/7710864/courseraPublic/otherResources/14-reg-exp.pdf)
* Long, painful experience :-) 
