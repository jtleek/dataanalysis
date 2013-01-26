---
title       : What is data? 
subtitle    : 
author      : Jeffrey Leek, Assistant Professor of Biostatistics 
job         : Johns Hopkins Bloomberg School of Public Health
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : zenburn   # 
widgets     : [mathjax]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
---

## Definition of data
<q>Data are values of qualitative or quantitative variables, belonging to a set of items.</q>

[http://en.wikipedia.org/wiki/Data]()


---

## Definition of data
<q>Data are values of qualitative or quantitative variables, belonging to a <redtext>set of items</redtext>.</q>

[http://en.wikipedia.org/wiki/Data]()

__Set of items__: Sometimes called the population; the set of objects you are interested in



---

## Definition of data
<q>Data are values of qualitative or quantitative <redtext>variables</redtext>, belonging to a set of items.</q>

[http://en.wikipedia.org/wiki/Data]()

__Variables__: A measurement or characteristic of an item.


---

## Definition of data
<q>Data are values of <redtext>qualitative</redtext> or <redtext>quantitative</redtext> variables, belonging to a set of items.</q>

[http://en.wikipedia.org/wiki/Data]()


__Qualitative__: Country of origin, sex, treatment

__Quantitative__: Height, weight, blood pressure

---

## Raw versus processed data

__Raw data__
* The original source of the data
* Often hard to use for data analyses
* Data analysis _includes_ processing
* Raw data may only need to be processed once

[http://en.wikipedia.org/wiki/Raw_data]()

__Processed data__
* Data that is ready for analysis
* Processing can include merging, subsetting, transforming, etc.
* There may be standards for processing
* All steps should be recorded 

[http://en.wikipedia.org/wiki/Computer_data_processing]()

---

## An example of a processing pipeline

<img class=center src=assets/img/hiseq.jpg height='80%'/>

[http://www.illumina.com.cn/support/sequencing/sequencing_instruments/hiseq_1000.asp]()

---

## An example of a processing pipeline

<img class=center src=assets/img/processing.png height='80%'/>

[http://www.cbcb.umd.edu/~hcorrada/CMSC858B/lectures/lect22_seqIntro/seqIntro.pdf]()

---


## What do raw data look like? 

<img class=center src=assets/img/fastq.png height='80%'/>


[http://brianknaus.com/software/srtoolbox/s_4_1_sequence80.txt]()

---

## What do raw data look like? 

<img class=center src=assets/img/twitter.png height='80%'/>

[https://dev.twitter.com/docs/api/1/get/blocks/blocking]()

---

## What do raw data look like? 

<img class=center src=assets/img/medicalrecord.png height='60%'/>

[http://blue-button.github.com/challenge/]()

---

## What do processed data look like?

<img class=center src=assets/img/excel.png height='50%'/>

1. Each variable forms a column
2. Each observation forms a row
3. Each table/file stores data about one kind of observation (e.g. people/hospitals).


[http://vita.had.co.nz/papers/tidy-data.pdf]()

[Leek, Taub, and Pineda 2011 PLoS One](http://www.plosone.org/article/info%3Adoi%2F10.1371%2Fjournal.pone.0026895)

---

## How much is there?

<img class=center src=assets/img/howmuch.png height='80%'/>

[http://mashable.com/2011/06/28/data-infographic/]()

---

## So what about big data? 

<img class=center src=assets/img/bigdata.png height='80%'/>

---

## Depends on your perspective

<img class=center src=assets/img/ibm350.jpg height='80%'/>

---

## Why big data now?

<img class=center src=assets/img/milgram.jpg height='80%'/>

[Travers and Milgram (1969) Sociometry](http://www.jstor.org/discover/10.2307/2786545?uid=3739704&uid=2&uid=4&uid=3739256&sid=21101674727517)

---

## Why big data now?

<img class=center src=assets/img/leskovec.jpg height='80%'/>

[Leskovec and Horvitz WWW '08](http://arxiv.org/abs/0803.0939)


---

## Big or small - you need the right data
<q>The data may not contain the answer. The combination of some data and an aching desire for an answer does not ensure that a reasonable answer can be extracted from a given body of data... </q> 

[Tukey](http://en.wikipedia.org/wiki/John_Tukey)


---

## Big or small - you need the right data

<q>...no matter how big the data are.</q>

[Leek](http://www1.usu.edu/utahstatetoday/images/mar%2003/JeffLeek.jpg)




