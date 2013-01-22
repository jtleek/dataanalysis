## Lecture slides for data analysis

This repository contains the lecture slides for the Coursera course [Data Analysis](https://www.coursera.org/course/dataanalysis). The slides were created with the [Slidify](http://slidify.org/) package in [Rstudio](http://www.rstudio.com/).

## Downloading the slides

To download the folder with the slides for all lectures, click on the button to download the zip file above. 

## Installing the software

You will need to install [R](http://cran.rstudio.com/), [Rstudio](http://www.rstudio.com/ide/download/) and Slidify. To install Slidify, open Rstudio and run the commands:


install.packages("devtools")

install_github("slidify","ramnathv")

install_github("slidifyLibraries","ramnathv")


## Setting your working directory

Next, you need to set your working directory to the lecture you would like to compile. 

setwd(file.choose())

and select the directory of the lecture you would like to compile. This will set your working directory to the 
lecture directory. 


## Compiling the slides

Once you have completed this step run the commands:

slidify("index.Rmd")
browseURL("index.html")

This should compile the slides and open the resulting webpage on your computer. 