---
title       : Getting Data (Part 2)
subtitle    : 
author      : Jeffrey Leek, Assistant Professor of Biostatistics 
job         : Johns Hopkins Bloomberg School of Public Health
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : zenburn   # 
widgets     : [mathjax]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
---





## Interacting more directly with files

* file - open a connection to a text file
* url - open a connection to a url
* gzfile - open a connection to a .gz file
* bzfile - open a connection to a .bz2 file
* _?connections_ for more information
* <redtext>Remember to close connections </redtext>


---

## readLines() - local file

* readLines - a function to read lines of text from a connection
* Important parameters: _con_, _n_, _encoding_






```r
con <- file("./data/cameras.csv","r")
cameraData <- read.csv(con)
close(con)
head(cameraData)
```

```
                         address direction      street  crossStreet
1       S CATON AVE & BENSON AVE       N/B   Caton Ave   Benson Ave
2       S CATON AVE & BENSON AVE       S/B   Caton Ave   Benson Ave
3 WILKENS AVE & PINE HEIGHTS AVE       E/B Wilkens Ave Pine Heights
4        THE ALAMEDA & E 33RD ST       S/B The Alameda      33rd St
5        E 33RD ST & THE ALAMEDA       E/B      E 33rd  The Alameda
6        ERDMAN AVE & N MACON ST       E/B      Erdman     Macon St
                intersection                      Location.1
1     Caton Ave & Benson Ave (39.2693779962, -76.6688185297)
2     Caton Ave & Benson Ave (39.2693157898, -76.6689698176)
3 Wilkens Ave & Pine Heights  (39.2720252302, -76.676960806)
4     The Alameda  & 33rd St (39.3285013141, -76.5953545714)
5      E 33rd  & The Alameda (39.3283410623, -76.5953594625)
6         Erdman  & Macon St (39.3068045671, -76.5593167803)
```



---

## readLines() - from the web



```r

con <- url("http://simplystatistics.org","r")
simplyStats <- readLines(con)
close(con)
head(simplyStats)
```

```
[1] "<!DOCTYPE html>"                                         
[2] "<html lang=\"en-US\">"                                   
[3] "<head>"                                                  
[4] "<meta charset=\"UTF-8\" />"                              
[5] "<title>Simply Statistics</title>"                        
[6] "<link rel=\"profile\" href=\"http://gmpg.org/xfn/11\" />"
```


---

## Reading JSON files {RJSONIO}



```r
library(RJSONIO)
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.json?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/camera.json",method="curl")
con = file("./data/camera.json")
jsonCamera = fromJSON(con)
close(con)
head(jsonCamera)
```

```
$meta
$meta$view
$meta$view$id
[1] "dz54-2aru"

$meta$view$name
[1] "Baltimore Fixed Speed Cameras"

$meta$view$attribution
[1] "Department of Transportation"

$meta$view$attributionLink
[1] "http://www.baltimorecity.gov/Government/AgenciesDepartments/Transportation/SpeedMonitoringLocations.aspx"

$meta$view$averageRating
[1] 0

$meta$view$category
[1] "Transportation"

$meta$view$createdAt
[1] 1.334e+09

$meta$view$description
[1] "Motorists who drive aggressively and exceed the posted speed limit by at least 12 miles per hour will receive $40 citations in the mail. These citations are not reported to insurance companies and no license points are assigned. Notification signs will be placed at all speed enforcement locations so that motorists will be aware that they are approaching a speed check zone. The goal of the program is to make the streets of Baltimore safer for everyone by changing aggressive driving behavior. In addition to the eight portable speed enforcement units, the city has retrofitted 50 red light camera locations with the automated speed enforcement technology."

$meta$view$displayType
[1] "map"

$meta$view$downloadCount
[1] 220

$meta$view$licenseId
[1] "CC_30_BY"

$meta$view$numberOfComments
[1] 1

$meta$view$oid
[1] 591522

$meta$view$publicationAppendEnabled
[1] FALSE

$meta$view$publicationDate
[1] 1.331e+09

$meta$view$publicationGroup
[1] 294502

$meta$view$publicationStage
[1] "published"

$meta$view$rowClass
[1] ""

$meta$view$rowsUpdatedAt
[1] 1.331e+09

$meta$view$rowsUpdatedBy
[1] "n22b-663u"

$meta$view$signed
[1] FALSE

$meta$view$tableId
[1] 294502

$meta$view$totalTimesRated
[1] 0

$meta$view$viewCount
[1] 12344

$meta$view$viewLastModified
[1] 1.359e+09

$meta$view$viewType
[1] "tabular"

$meta$view$columns
$meta$view$columns[[1]]
$meta$view$columns[[1]]$id
[1] -1

$meta$view$columns[[1]]$name
[1] "sid"

$meta$view$columns[[1]]$dataTypeName
[1] "meta_data"

$meta$view$columns[[1]]$fieldName
[1] ":sid"

$meta$view$columns[[1]]$position
[1] 0

$meta$view$columns[[1]]$renderTypeName
[1] "meta_data"

$meta$view$columns[[1]]$format
named list()


$meta$view$columns[[2]]
$meta$view$columns[[2]]$id
[1] -1

$meta$view$columns[[2]]$name
[1] "id"

$meta$view$columns[[2]]$dataTypeName
[1] "meta_data"

$meta$view$columns[[2]]$fieldName
[1] ":id"

$meta$view$columns[[2]]$position
[1] 0

$meta$view$columns[[2]]$renderTypeName
[1] "meta_data"

$meta$view$columns[[2]]$format
named list()


$meta$view$columns[[3]]
$meta$view$columns[[3]]$id
[1] -1

$meta$view$columns[[3]]$name
[1] "position"

$meta$view$columns[[3]]$dataTypeName
[1] "meta_data"

$meta$view$columns[[3]]$fieldName
[1] ":position"

$meta$view$columns[[3]]$position
[1] 0

$meta$view$columns[[3]]$renderTypeName
[1] "meta_data"

$meta$view$columns[[3]]$format
named list()


$meta$view$columns[[4]]
$meta$view$columns[[4]]$id
[1] -1

$meta$view$columns[[4]]$name
[1] "created_at"

$meta$view$columns[[4]]$dataTypeName
[1] "meta_data"

$meta$view$columns[[4]]$fieldName
[1] ":created_at"

$meta$view$columns[[4]]$position
[1] 0

$meta$view$columns[[4]]$renderTypeName
[1] "meta_data"

$meta$view$columns[[4]]$format
named list()


$meta$view$columns[[5]]
$meta$view$columns[[5]]$id
[1] -1

$meta$view$columns[[5]]$name
[1] "created_meta"

$meta$view$columns[[5]]$dataTypeName
[1] "meta_data"

$meta$view$columns[[5]]$fieldName
[1] ":created_meta"

$meta$view$columns[[5]]$position
[1] 0

$meta$view$columns[[5]]$renderTypeName
[1] "meta_data"

$meta$view$columns[[5]]$format
named list()


$meta$view$columns[[6]]
$meta$view$columns[[6]]$id
[1] -1

$meta$view$columns[[6]]$name
[1] "updated_at"

$meta$view$columns[[6]]$dataTypeName
[1] "meta_data"

$meta$view$columns[[6]]$fieldName
[1] ":updated_at"

$meta$view$columns[[6]]$position
[1] 0

$meta$view$columns[[6]]$renderTypeName
[1] "meta_data"

$meta$view$columns[[6]]$format
named list()


$meta$view$columns[[7]]
$meta$view$columns[[7]]$id
[1] -1

$meta$view$columns[[7]]$name
[1] "updated_meta"

$meta$view$columns[[7]]$dataTypeName
[1] "meta_data"

$meta$view$columns[[7]]$fieldName
[1] ":updated_meta"

$meta$view$columns[[7]]$position
[1] 0

$meta$view$columns[[7]]$renderTypeName
[1] "meta_data"

$meta$view$columns[[7]]$format
named list()


$meta$view$columns[[8]]
$meta$view$columns[[8]]$id
[1] -1

$meta$view$columns[[8]]$name
[1] "meta"

$meta$view$columns[[8]]$dataTypeName
[1] "meta_data"

$meta$view$columns[[8]]$fieldName
[1] ":meta"

$meta$view$columns[[8]]$position
[1] 0

$meta$view$columns[[8]]$renderTypeName
[1] "meta_data"

$meta$view$columns[[8]]$format
named list()


$meta$view$columns[[9]]
$meta$view$columns[[9]]$id
[1] 7666271

$meta$view$columns[[9]]$name
[1] "address"

$meta$view$columns[[9]]$dataTypeName
[1] "text"

$meta$view$columns[[9]]$fieldName
[1] "address"

$meta$view$columns[[9]]$position
[1] 1

$meta$view$columns[[9]]$renderTypeName
[1] "text"

$meta$view$columns[[9]]$tableColumnId
[1] 2224361

$meta$view$columns[[9]]$width
[1] 338

$meta$view$columns[[9]]$cachedContents
$meta$view$columns[[9]]$cachedContents$non_null
[1] 80

$meta$view$columns[[9]]$cachedContents$smallest
[1] "E 33RD ST & THE ALAMEDA"

$meta$view$columns[[9]]$cachedContents$null
[1] 0

$meta$view$columns[[9]]$cachedContents$largest
[1] "YORK RD & GITTINGS AVE"

$meta$view$columns[[9]]$cachedContents$top
$meta$view$columns[[9]]$cachedContents$top[[1]]
$meta$view$columns[[9]]$cachedContents$top[[1]]$count
[1] 20

$meta$view$columns[[9]]$cachedContents$top[[1]]$item
[1] "S CATON AVE & BENSON AVE"


$meta$view$columns[[9]]$cachedContents$top[[2]]
$meta$view$columns[[9]]$cachedContents$top[[2]]$count
[1] 19

$meta$view$columns[[9]]$cachedContents$top[[2]]$item
[1] "ERDMAN AVE & N MACON ST"


$meta$view$columns[[9]]$cachedContents$top[[3]]
$meta$view$columns[[9]]$cachedContents$top[[3]]$count
[1] 18

$meta$view$columns[[9]]$cachedContents$top[[3]]$item
[1] "PARK HEIGHTS AVE & HAYWARD AVE"


$meta$view$columns[[9]]$cachedContents$top[[4]]
$meta$view$columns[[9]]$cachedContents$top[[4]]$count
[1] 17

$meta$view$columns[[9]]$cachedContents$top[[4]]$item
[1] "W NORTHERN PKWY & GREENSPRING AVE"


$meta$view$columns[[9]]$cachedContents$top[[5]]
$meta$view$columns[[9]]$cachedContents$top[[5]]$count
[1] 16

$meta$view$columns[[9]]$cachedContents$top[[5]]$item
[1] "EDMONDSON AVE & N ATHOL AVE"


$meta$view$columns[[9]]$cachedContents$top[[6]]
$meta$view$columns[[9]]$cachedContents$top[[6]]$count
[1] 15

$meta$view$columns[[9]]$cachedContents$top[[6]]$item
[1] "SINCLAIR LN & SHANNON DR"


$meta$view$columns[[9]]$cachedContents$top[[7]]
$meta$view$columns[[9]]$cachedContents$top[[7]]$count
[1] 14

$meta$view$columns[[9]]$cachedContents$top[[7]]$item
[1] "LIBERTY HTS & HILLSDALE RD"


$meta$view$columns[[9]]$cachedContents$top[[8]]
$meta$view$columns[[9]]$cachedContents$top[[8]]$count
[1] 13

$meta$view$columns[[9]]$cachedContents$top[[8]]$item
[1] "RUSSELL ST & W HAMBURG ST"


$meta$view$columns[[9]]$cachedContents$top[[9]]
$meta$view$columns[[9]]$cachedContents$top[[9]]$count
[1] 12

$meta$view$columns[[9]]$cachedContents$top[[9]]$item
[1] "LIGHT ST & E PRATT ST"


$meta$view$columns[[9]]$cachedContents$top[[10]]
$meta$view$columns[[9]]$cachedContents$top[[10]]$count
[1] 11

$meta$view$columns[[9]]$cachedContents$top[[10]]$item
[1] "E LOMBARD ST & S GAY ST"


$meta$view$columns[[9]]$cachedContents$top[[11]]
$meta$view$columns[[9]]$cachedContents$top[[11]]$count
[1] 10

$meta$view$columns[[9]]$cachedContents$top[[11]]$item
[1] "HARFORD RD & E NORTH AVE"


$meta$view$columns[[9]]$cachedContents$top[[12]]
$meta$view$columns[[9]]$cachedContents$top[[12]]$count
[1] 9

$meta$view$columns[[9]]$cachedContents$top[[12]]$item
[1] "FORT SMALLWOOD RD & FORT ARMISTEAD RD"


$meta$view$columns[[9]]$cachedContents$top[[13]]
$meta$view$columns[[9]]$cachedContents$top[[13]]$count
[1] 8

$meta$view$columns[[9]]$cachedContents$top[[13]]$item
[1] "GARRISON BLVD & WABASH AVE"


$meta$view$columns[[9]]$cachedContents$top[[14]]
$meta$view$columns[[9]]$cachedContents$top[[14]]$count
[1] 7

$meta$view$columns[[9]]$cachedContents$top[[14]]$item
[1] "WALTHER AVE & GLENMORE AVE"


$meta$view$columns[[9]]$cachedContents$top[[15]]
$meta$view$columns[[9]]$cachedContents$top[[15]]$count
[1] 6

$meta$view$columns[[9]]$cachedContents$top[[15]]$item
[1] "W FRANKLIN ST & CATHEDRAL ST"


$meta$view$columns[[9]]$cachedContents$top[[16]]
$meta$view$columns[[9]]$cachedContents$top[[16]]$count
[1] 5

$meta$view$columns[[9]]$cachedContents$top[[16]]$item
[1] "PERRING PKWY & E BELVEDERE AVE"


$meta$view$columns[[9]]$cachedContents$top[[17]]
$meta$view$columns[[9]]$cachedContents$top[[17]]$count
[1] 4

$meta$view$columns[[9]]$cachedContents$top[[17]]$item
[1] "GWYNNS FLS & GARRISON BLVD"


$meta$view$columns[[9]]$cachedContents$top[[18]]
$meta$view$columns[[9]]$cachedContents$top[[18]]$count
[1] 3

$meta$view$columns[[9]]$cachedContents$top[[18]]$item
[1] "REISTERSTOWN RD & DRUID PARK DR"


$meta$view$columns[[9]]$cachedContents$top[[19]]
$meta$view$columns[[9]]$cachedContents$top[[19]]$count
[1] 2

$meta$view$columns[[9]]$cachedContents$top[[19]]$item
[1] "POTEE ST & TALBOTT ST"


$meta$view$columns[[9]]$cachedContents$top[[20]]
$meta$view$columns[[9]]$cachedContents$top[[20]]$count
[1] 1

$meta$view$columns[[9]]$cachedContents$top[[20]]$item
[1] "YORK RD & GITTINGS AVE"




$meta$view$columns[[9]]$format
named list()


$meta$view$columns[[10]]
$meta$view$columns[[10]]$id
[1] 7666272

$meta$view$columns[[10]]$name
[1] "direction"

$meta$view$columns[[10]]$dataTypeName
[1] "text"

$meta$view$columns[[10]]$fieldName
[1] "direction"

$meta$view$columns[[10]]$position
[1] 2

$meta$view$columns[[10]]$renderTypeName
[1] "text"

$meta$view$columns[[10]]$tableColumnId
[1] 2224362

$meta$view$columns[[10]]$width
[1] 68

$meta$view$columns[[10]]$cachedContents
$meta$view$columns[[10]]$cachedContents$non_null
[1] 80

$meta$view$columns[[10]]$cachedContents$smallest
[1] "E/B"

$meta$view$columns[[10]]$cachedContents$null
[1] 0

$meta$view$columns[[10]]$cachedContents$largest
[1] "W/B"

$meta$view$columns[[10]]$cachedContents$top
$meta$view$columns[[10]]$cachedContents$top[[1]]
$meta$view$columns[[10]]$cachedContents$top[[1]]$count
[1] 20

$meta$view$columns[[10]]$cachedContents$top[[1]]$item
[1] "N/B"


$meta$view$columns[[10]]$cachedContents$top[[2]]
$meta$view$columns[[10]]$cachedContents$top[[2]]$count
[1] 19

$meta$view$columns[[10]]$cachedContents$top[[2]]$item
[1] "S/B"


$meta$view$columns[[10]]$cachedContents$top[[3]]
$meta$view$columns[[10]]$cachedContents$top[[3]]$count
[1] 18

$meta$view$columns[[10]]$cachedContents$top[[3]]$item
[1] "E/B"


$meta$view$columns[[10]]$cachedContents$top[[4]]
$meta$view$columns[[10]]$cachedContents$top[[4]]$count
[1] 17

$meta$view$columns[[10]]$cachedContents$top[[4]]$item
[1] "W/B"




$meta$view$columns[[10]]$format
named list()


$meta$view$columns[[11]]
$meta$view$columns[[11]]$id
[1] 7666273

$meta$view$columns[[11]]$name
[1] "street"

$meta$view$columns[[11]]$dataTypeName
[1] "text"

$meta$view$columns[[11]]$fieldName
[1] "street"

$meta$view$columns[[11]]$position
[1] 3

$meta$view$columns[[11]]$renderTypeName
[1] "text"

$meta$view$columns[[11]]$tableColumnId
[1] 2224363

$meta$view$columns[[11]]$width
[1] 172

$meta$view$columns[[11]]$cachedContents
$meta$view$columns[[11]]$cachedContents$non_null
[1] 80

$meta$view$columns[[11]]$cachedContents$smallest
[1] "Caton Ave"

$meta$view$columns[[11]]$cachedContents$null
[1] 0

$meta$view$columns[[11]]$cachedContents$largest
[1] "York Rd \n"

$meta$view$columns[[11]]$cachedContents$top
$meta$view$columns[[11]]$cachedContents$top[[1]]
$meta$view$columns[[11]]$cachedContents$top[[1]]$count
[1] 20

$meta$view$columns[[11]]$cachedContents$top[[1]]$item
[1] "Caton Ave"


$meta$view$columns[[11]]$cachedContents$top[[2]]
$meta$view$columns[[11]]$cachedContents$top[[2]]$count
[1] 19

$meta$view$columns[[11]]$cachedContents$top[[2]]$item
[1] "Erdman"


$meta$view$columns[[11]]$cachedContents$top[[3]]
$meta$view$columns[[11]]$cachedContents$top[[3]]$count
[1] 18

$meta$view$columns[[11]]$cachedContents$top[[3]]$item
[1] "Orleans"


$meta$view$columns[[11]]$cachedContents$top[[4]]
$meta$view$columns[[11]]$cachedContents$top[[4]]$count
[1] 17

$meta$view$columns[[11]]$cachedContents$top[[4]]$item
[1] "Edmonson"


$meta$view$columns[[11]]$cachedContents$top[[5]]
$meta$view$columns[[11]]$cachedContents$top[[5]]$count
[1] 16

$meta$view$columns[[11]]$cachedContents$top[[5]]$item
[1] "Park Heights"


$meta$view$columns[[11]]$cachedContents$top[[6]]
$meta$view$columns[[11]]$cachedContents$top[[6]]$count
[1] 15

$meta$view$columns[[11]]$cachedContents$top[[6]]$item
[1] "Northern Pkwy"


$meta$view$columns[[11]]$cachedContents$top[[7]]
$meta$view$columns[[11]]$cachedContents$top[[7]]$count
[1] 14

$meta$view$columns[[11]]$cachedContents$top[[7]]$item
[1] "Cold Spring\n"


$meta$view$columns[[11]]$cachedContents$top[[8]]
$meta$view$columns[[11]]$cachedContents$top[[8]]$count
[1] 13

$meta$view$columns[[11]]$cachedContents$top[[8]]$item
[1] "Harford \n"


$meta$view$columns[[11]]$cachedContents$top[[9]]
$meta$view$columns[[11]]$cachedContents$top[[9]]$count
[1] 12

$meta$view$columns[[11]]$cachedContents$top[[9]]$item
[1] "Liberty Hghts\n"


$meta$view$columns[[11]]$cachedContents$top[[10]]
$meta$view$columns[[11]]$cachedContents$top[[10]]$count
[1] 11

$meta$view$columns[[11]]$cachedContents$top[[10]]$item
[1] "Garrison \n"


$meta$view$columns[[11]]$cachedContents$top[[11]]
$meta$view$columns[[11]]$cachedContents$top[[11]]$count
[1] 10

$meta$view$columns[[11]]$cachedContents$top[[11]]$item
[1] "Walther \n"


$meta$view$columns[[11]]$cachedContents$top[[12]]
$meta$view$columns[[11]]$cachedContents$top[[12]]$count
[1] 9

$meta$view$columns[[11]]$cachedContents$top[[12]]$item
[1] "Franklin \n"


$meta$view$columns[[11]]$cachedContents$top[[13]]
$meta$view$columns[[11]]$cachedContents$top[[13]]$count
[1] 8

$meta$view$columns[[11]]$cachedContents$top[[13]]$item
[1] "Perring Pkwy\n"


$meta$view$columns[[11]]$cachedContents$top[[14]]
$meta$view$columns[[11]]$cachedContents$top[[14]]$count
[1] 7

$meta$view$columns[[11]]$cachedContents$top[[14]]$item
[1] "Gwynns Falls \n"


$meta$view$columns[[11]]$cachedContents$top[[15]]
$meta$view$columns[[11]]$cachedContents$top[[15]]$count
[1] 6

$meta$view$columns[[11]]$cachedContents$top[[15]]$item
[1] "Reistertown Rd\n"


$meta$view$columns[[11]]$cachedContents$top[[16]]
$meta$view$columns[[11]]$cachedContents$top[[16]]$count
[1] 5

$meta$view$columns[[11]]$cachedContents$top[[16]]$item
[1] "Potee\n"


$meta$view$columns[[11]]$cachedContents$top[[17]]
$meta$view$columns[[11]]$cachedContents$top[[17]]$count
[1] 4

$meta$view$columns[[11]]$cachedContents$top[[17]]$item
[1] "York Rd \n"


$meta$view$columns[[11]]$cachedContents$top[[18]]
$meta$view$columns[[11]]$cachedContents$top[[18]]$count
[1] 3

$meta$view$columns[[11]]$cachedContents$top[[18]]$item
[1] "Wabash \n"


$meta$view$columns[[11]]$cachedContents$top[[19]]
$meta$view$columns[[11]]$cachedContents$top[[19]]$count
[1] 2

$meta$view$columns[[11]]$cachedContents$top[[19]]$item
[1] "Northern Pkwy\n"


$meta$view$columns[[11]]$cachedContents$top[[20]]
$meta$view$columns[[11]]$cachedContents$top[[20]]$count
[1] 1

$meta$view$columns[[11]]$cachedContents$top[[20]]$item
[1] "Reistertown \n"




$meta$view$columns[[11]]$format
named list()


$meta$view$columns[[12]]
$meta$view$columns[[12]]$id
[1] 7666274

$meta$view$columns[[12]]$name
[1] "crossStreet"

$meta$view$columns[[12]]$dataTypeName
[1] "text"

$meta$view$columns[[12]]$fieldName
[1] "crossstreet"

$meta$view$columns[[12]]$position
[1] 4

$meta$view$columns[[12]]$renderTypeName
[1] "text"

$meta$view$columns[[12]]$tableColumnId
[1] 2224364

$meta$view$columns[[12]]$width
[1] 148

$meta$view$columns[[12]]$cachedContents
$meta$view$columns[[12]]$cachedContents$non_null
[1] 80

$meta$view$columns[[12]]$cachedContents$smallest
[1] "33rd St"

$meta$view$columns[[12]]$cachedContents$null
[1] 0

$meta$view$columns[[12]]$cachedContents$largest
[1] "York Road"

$meta$view$columns[[12]]$cachedContents$top
$meta$view$columns[[12]]$cachedContents$top[[1]]
$meta$view$columns[[12]]$cachedContents$top[[1]]$count
[1] 20

$meta$view$columns[[12]]$cachedContents$top[[1]]$item
[1] "Benson Ave"


$meta$view$columns[[12]]$cachedContents$top[[2]]
$meta$view$columns[[12]]$cachedContents$top[[2]]$count
[1] 19

$meta$view$columns[[12]]$cachedContents$top[[2]]$item
[1] "The Alameda"


$meta$view$columns[[12]]$cachedContents$top[[3]]
$meta$view$columns[[12]]$cachedContents$top[[3]]$count
[1] 18

$meta$view$columns[[12]]$cachedContents$top[[3]]$item
[1] "Macon St"


$meta$view$columns[[12]]$cachedContents$top[[4]]
$meta$view$columns[[12]]$cachedContents$top[[4]]$count
[1] 17

$meta$view$columns[[12]]$cachedContents$top[[4]]$item
[1] "Gay St"


$meta$view$columns[[12]]$cachedContents$top[[5]]
$meta$view$columns[[12]]$cachedContents$top[[5]]$count
[1] 16

$meta$view$columns[[12]]$cachedContents$top[[5]]$item
[1] "Hayward Ave"


$meta$view$columns[[12]]$cachedContents$top[[6]]
$meta$view$columns[[12]]$cachedContents$top[[6]]$count
[1] 15

$meta$view$columns[[12]]$cachedContents$top[[6]]$item
[1] "Pratt St"


$meta$view$columns[[12]]$cachedContents$top[[7]]
$meta$view$columns[[12]]$cachedContents$top[[7]]$count
[1] 14

$meta$view$columns[[12]]$cachedContents$top[[7]]$item
[1] "Greenspring Ave"


$meta$view$columns[[12]]$cachedContents$top[[8]]
$meta$view$columns[[12]]$cachedContents$top[[8]]$count
[1] 13

$meta$view$columns[[12]]$cachedContents$top[[8]]$item
[1] "Woodbridge Ave"


$meta$view$columns[[12]]$cachedContents$top[[9]]
$meta$view$columns[[12]]$cachedContents$top[[9]]$count
[1] 12

$meta$view$columns[[12]]$cachedContents$top[[9]]$item
[1] "Shannon Drive"


$meta$view$columns[[12]]$cachedContents$top[[10]]
$meta$view$columns[[12]]$cachedContents$top[[10]]$count
[1] 11

$meta$view$columns[[12]]$cachedContents$top[[10]]$item
[1] "Hillsdale Ave"


$meta$view$columns[[12]]$cachedContents$top[[11]]
$meta$view$columns[[12]]$cachedContents$top[[11]]$count
[1] 10

$meta$view$columns[[12]]$cachedContents$top[[11]]$item
[1] "Hamburg St"


$meta$view$columns[[12]]$cachedContents$top[[12]]
$meta$view$columns[[12]]$cachedContents$top[[12]]$count
[1] 9

$meta$view$columns[[12]]$cachedContents$top[[12]]$item
[1] "Fort Armstead"


$meta$view$columns[[12]]$cachedContents$top[[13]]
$meta$view$columns[[12]]$cachedContents$top[[13]]$count
[1] 8

$meta$view$columns[[12]]$cachedContents$top[[13]]$item
[1] "Wabash Ave"


$meta$view$columns[[12]]$cachedContents$top[[14]]
$meta$view$columns[[12]]$cachedContents$top[[14]]$count
[1] 7

$meta$view$columns[[12]]$cachedContents$top[[14]]$item
[1] "Glenmore"


$meta$view$columns[[12]]$cachedContents$top[[15]]
$meta$view$columns[[12]]$cachedContents$top[[15]]$count
[1] 6

$meta$view$columns[[12]]$cachedContents$top[[15]]$item
[1] "Cathedral"


$meta$view$columns[[12]]$cachedContents$top[[16]]
$meta$view$columns[[12]]$cachedContents$top[[16]]$count
[1] 5

$meta$view$columns[[12]]$cachedContents$top[[16]]$item
[1] "Belvedere Ave"


$meta$view$columns[[12]]$cachedContents$top[[17]]
$meta$view$columns[[12]]$cachedContents$top[[17]]$count
[1] 4

$meta$view$columns[[12]]$cachedContents$top[[17]]$item
[1] "Garrison Blvd"


$meta$view$columns[[12]]$cachedContents$top[[18]]
$meta$view$columns[[12]]$cachedContents$top[[18]]$count
[1] 3

$meta$view$columns[[12]]$cachedContents$top[[18]]$item
[1] "Druid Lake Drive"


$meta$view$columns[[12]]$cachedContents$top[[19]]
$meta$view$columns[[12]]$cachedContents$top[[19]]$count
[1] 2

$meta$view$columns[[12]]$cachedContents$top[[19]]$item
[1] "Talbot"


$meta$view$columns[[12]]$cachedContents$top[[20]]
$meta$view$columns[[12]]$cachedContents$top[[20]]$count
[1] 1

$meta$view$columns[[12]]$cachedContents$top[[20]]$item
[1] "Gitting Ave"




$meta$view$columns[[12]]$format
named list()


$meta$view$columns[[13]]
$meta$view$columns[[13]]$id
[1] 7666275

$meta$view$columns[[13]]$name
[1] "intersection"

$meta$view$columns[[13]]$dataTypeName
[1] "text"

$meta$view$columns[[13]]$fieldName
[1] "intersection"

$meta$view$columns[[13]]$position
[1] 5

$meta$view$columns[[13]]$renderTypeName
[1] "text"

$meta$view$columns[[13]]$tableColumnId
[1] 2224365

$meta$view$columns[[13]]$width
[1] 244

$meta$view$columns[[13]]$cachedContents
$meta$view$columns[[13]]$cachedContents$non_null
[1] 80

$meta$view$columns[[13]]$cachedContents$smallest
[1] " &"

$meta$view$columns[[13]]$cachedContents$null
[1] 0

$meta$view$columns[[13]]$cachedContents$largest
[1] "York Rd \n & Gitting Ave"

$meta$view$columns[[13]]$cachedContents$top
$meta$view$columns[[13]]$cachedContents$top[[1]]
$meta$view$columns[[13]]$cachedContents$top[[1]]$count
[1] 20

$meta$view$columns[[13]]$cachedContents$top[[1]]$item
[1] "Caton Ave & Benson Ave"


$meta$view$columns[[13]]$cachedContents$top[[2]]
$meta$view$columns[[13]]$cachedContents$top[[2]]$count
[1] 19

$meta$view$columns[[13]]$cachedContents$top[[2]]$item
[1] "Erdman  & Macon St"


$meta$view$columns[[13]]$cachedContents$top[[3]]
$meta$view$columns[[13]]$cachedContents$top[[3]]$count
[1] 18

$meta$view$columns[[13]]$cachedContents$top[[3]]$item
[1] "Park Heights   & Hayward Ave"


$meta$view$columns[[13]]$cachedContents$top[[4]]
$meta$view$columns[[13]]$cachedContents$top[[4]]$count
[1] 17

$meta$view$columns[[13]]$cachedContents$top[[4]]$item
[1] "Liberty Hghts\n  & Hillsdale Ave"


$meta$view$columns[[13]]$cachedContents$top[[5]]
$meta$view$columns[[13]]$cachedContents$top[[5]]$count
[1] 16

$meta$view$columns[[13]]$cachedContents$top[[5]]$item
[1] "Edmonson  & Hilton St"


$meta$view$columns[[13]]$cachedContents$top[[6]]
$meta$view$columns[[13]]$cachedContents$top[[6]]$count
[1] 15

$meta$view$columns[[13]]$cachedContents$top[[6]]$item
[1] "President  & Fayette St"


$meta$view$columns[[13]]$cachedContents$top[[7]]
$meta$view$columns[[13]]$cachedContents$top[[7]]$count
[1] 14

$meta$view$columns[[13]]$cachedContents$top[[7]]$item
[1] "Russell \n & Hamburg St"


$meta$view$columns[[13]]$cachedContents$top[[8]]
$meta$view$columns[[13]]$cachedContents$top[[8]]$count
[1] 13

$meta$view$columns[[13]]$cachedContents$top[[8]]$item
[1] "Russell\n  & Hamburg St"


$meta$view$columns[[13]]$cachedContents$top[[9]]
$meta$view$columns[[13]]$cachedContents$top[[9]]$count
[1] 12

$meta$view$columns[[13]]$cachedContents$top[[9]]$item
[1] "Light SB \n & Pratt St"


$meta$view$columns[[13]]$cachedContents$top[[10]]
$meta$view$columns[[13]]$cachedContents$top[[10]]$count
[1] 11

$meta$view$columns[[13]]$cachedContents$top[[10]]$item
[1] "Lombard \n & Gay St"


$meta$view$columns[[13]]$cachedContents$top[[11]]
$meta$view$columns[[13]]$cachedContents$top[[11]]$count
[1] 10

$meta$view$columns[[13]]$cachedContents$top[[11]]$item
[1] "Harford Rd\n  & North Ave"


$meta$view$columns[[13]]$cachedContents$top[[12]]
$meta$view$columns[[13]]$cachedContents$top[[12]]$count
[1] 9

$meta$view$columns[[13]]$cachedContents$top[[12]]$item
[1] "Ft Smallwood\n  & Fort Armstead"


$meta$view$columns[[13]]$cachedContents$top[[13]]
$meta$view$columns[[13]]$cachedContents$top[[13]]$count
[1] 8

$meta$view$columns[[13]]$cachedContents$top[[13]]$item
[1] "Garrison \n & Wabash Ave"


$meta$view$columns[[13]]$cachedContents$top[[14]]
$meta$view$columns[[13]]$cachedContents$top[[14]]$count
[1] 7

$meta$view$columns[[13]]$cachedContents$top[[14]]$item
[1] "Walther \n & Glenmore"


$meta$view$columns[[13]]$cachedContents$top[[15]]
$meta$view$columns[[13]]$cachedContents$top[[15]]$count
[1] 6

$meta$view$columns[[13]]$cachedContents$top[[15]]$item
[1] "Franklin \n & Cathedral"


$meta$view$columns[[13]]$cachedContents$top[[16]]
$meta$view$columns[[13]]$cachedContents$top[[16]]$count
[1] 5

$meta$view$columns[[13]]$cachedContents$top[[16]]$item
[1] "Perring Pkwy\n  & Belvedere Ave"


$meta$view$columns[[13]]$cachedContents$top[[17]]
$meta$view$columns[[13]]$cachedContents$top[[17]]$count
[1] 4

$meta$view$columns[[13]]$cachedContents$top[[17]]$item
[1] "Gwynns Falls \n  & Garrison Blvd"


$meta$view$columns[[13]]$cachedContents$top[[18]]
$meta$view$columns[[13]]$cachedContents$top[[18]]$count
[1] 3

$meta$view$columns[[13]]$cachedContents$top[[18]]$item
[1] "Reistertown Rd\n  & Druid Lake Drive"


$meta$view$columns[[13]]$cachedContents$top[[19]]
$meta$view$columns[[13]]$cachedContents$top[[19]]$count
[1] 2

$meta$view$columns[[13]]$cachedContents$top[[19]]$item
[1] "Potee\n  & Talbot"


$meta$view$columns[[13]]$cachedContents$top[[20]]
$meta$view$columns[[13]]$cachedContents$top[[20]]$count
[1] 1

$meta$view$columns[[13]]$cachedContents$top[[20]]$item
[1] "York Rd \n & Gitting Ave"




$meta$view$columns[[13]]$format
named list()


$meta$view$columns[[14]]
$meta$view$columns[[14]]$id
[1] 7666276

$meta$view$columns[[14]]$name
[1] "Location 1"

$meta$view$columns[[14]]$dataTypeName
[1] "location"

$meta$view$columns[[14]]$fieldName
[1] "location_1"

$meta$view$columns[[14]]$position
[1] 6

$meta$view$columns[[14]]$renderTypeName
[1] "location"

$meta$view$columns[[14]]$tableColumnId
[1] 2224366

$meta$view$columns[[14]]$width
[1] 220

$meta$view$columns[[14]]$cachedContents
$meta$view$columns[[14]]$cachedContents$non_null
[1] 80

$meta$view$columns[[14]]$cachedContents$smallest
       longitude         latitude 
"-76.6688185297"  "39.2693779962" 

$meta$view$columns[[14]]$cachedContents$null
[1] 0

$meta$view$columns[[14]]$cachedContents$largest
       longitude         latitude 
"-76.6251255783"  "39.3108706445" 

$meta$view$columns[[14]]$cachedContents$top
$meta$view$columns[[14]]$cachedContents$top[[1]]
$meta$view$columns[[14]]$cachedContents$top[[1]]$count
[1] 20

$meta$view$columns[[14]]$cachedContents$top[[1]]$item
       longitude         latitude 
"-76.6945100293"  "39.3304453818" 


$meta$view$columns[[14]]$cachedContents$top[[2]]
$meta$view$columns[[14]]$cachedContents$top[[2]]$count
[1] 19

$meta$view$columns[[14]]$cachedContents$top[[2]]$item
       longitude         latitude 
"-76.6176988692"  "39.3643110382" 


$meta$view$columns[[14]]$cachedContents$top[[3]]
$meta$view$columns[[14]]$cachedContents$top[[3]]$count
[1] 18

$meta$view$columns[[14]]$cachedContents$top[[3]]$item
       longitude         latitude 
"-76.5751846354"  "39.3353084656" 


$meta$view$columns[[14]]$cachedContents$top[[4]]
$meta$view$columns[[14]]$cachedContents$top[[4]]$count
[1] 17

$meta$view$columns[[14]]$cachedContents$top[[4]]$item
       longitude         latitude 
"-76.6462199216"  "39.3614127238" 


$meta$view$columns[[14]]$cachedContents$top[[5]]
$meta$view$columns[[14]]$cachedContents$top[[5]]$count
[1] 16

$meta$view$columns[[14]]$cachedContents$top[[5]]$item
       longitude         latitude 
"-76.6727600072"   "39.294061339" 


$meta$view$columns[[14]]$cachedContents$top[[6]]
$meta$view$columns[[14]]$cachedContents$top[[6]]$count
[1] 15

$meta$view$columns[[14]]$cachedContents$top[[6]]$item
       longitude         latitude 
"-76.6066648277"  "39.2906240776" 


$meta$view$columns[[14]]$cachedContents$top[[7]]
$meta$view$columns[[14]]$cachedContents$top[[7]]$count
[1] 14

$meta$view$columns[[14]]$cachedContents$top[[7]]$item
       longitude         latitude 
"-76.6237544477"  "39.2797863216" 


$meta$view$columns[[14]]$cachedContents$top[[8]]
$meta$view$columns[[14]]$cachedContents$top[[8]]$count
[1] 13

$meta$view$columns[[14]]$cachedContents$top[[8]]$item
       longitude         latitude 
"-76.6239105956"  "39.2798187398" 


$meta$view$columns[[14]]$cachedContents$top[[9]]
$meta$view$columns[[14]]$cachedContents$top[[9]]$count
[1] 12

$meta$view$columns[[14]]$cachedContents$top[[9]]$item
       longitude         latitude 
"-76.6135493898"  "39.2865415105" 


$meta$view$columns[[14]]$cachedContents$top[[10]]
$meta$view$columns[[14]]$cachedContents$top[[10]]$count
[1] 11

$meta$view$columns[[14]]$cachedContents$top[[10]]$item
       longitude         latitude 
"-76.6087475019"  "39.2877660778" 


$meta$view$columns[[14]]$cachedContents$top[[11]]
$meta$view$columns[[14]]$cachedContents$top[[11]]$count
[1] 10

$meta$view$columns[[14]]$cachedContents$top[[11]]$item
       longitude         latitude 
"-76.5993579666"  "39.3119363297" 


$meta$view$columns[[14]]$cachedContents$top[[12]]
$meta$view$columns[[14]]$cachedContents$top[[12]]$count
[1] 9

$meta$view$columns[[14]]$cachedContents$top[[12]]$item
       longitude         latitude 
"-76.5559766825"  "39.1999130165" 


$meta$view$columns[[14]]$cachedContents$top[[13]]
$meta$view$columns[[14]]$cachedContents$top[[13]]$count
[1] 8

$meta$view$columns[[14]]$cachedContents$top[[13]]$item
       longitude         latitude 
"-76.6831167251"  "39.3412090597" 


$meta$view$columns[[14]]$cachedContents$top[[14]]
$meta$view$columns[[14]]$cachedContents$top[[14]]$count
[1] 7

$meta$view$columns[[14]]$cachedContents$top[[14]]$item
       longitude         latitude 
"-76.5424942905"  "39.3535402213" 


$meta$view$columns[[14]]$cachedContents$top[[15]]
$meta$view$columns[[14]]$cachedContents$top[[15]]$count
[1] 6

$meta$view$columns[[14]]$cachedContents$top[[15]]$item
      longitude        latitude 
"-76.616872047" "39.2950659131" 


$meta$view$columns[[14]]$cachedContents$top[[16]]
$meta$view$columns[[14]]$cachedContents$top[[16]]$count
[1] 5

$meta$view$columns[[14]]$cachedContents$top[[16]]$item
      longitude        latitude 
"-76.575725921" "39.3549627467" 


$meta$view$columns[[14]]$cachedContents$top[[17]]
$meta$view$columns[[14]]$cachedContents$top[[17]]$count
[1] 4

$meta$view$columns[[14]]$cachedContents$top[[17]]$item
       longitude         latitude 
"-76.6762250182"  "39.3135792902" 


$meta$view$columns[[14]]$cachedContents$top[[18]]
$meta$view$columns[[14]]$cachedContents$top[[18]]$count
[1] 3

$meta$view$columns[[14]]$cachedContents$top[[18]]$item
       longitude         latitude 
"-76.6577109834"  "39.3252867997" 


$meta$view$columns[[14]]$cachedContents$top[[19]]
$meta$view$columns[[14]]$cachedContents$top[[19]]$count
[1] 2

$meta$view$columns[[14]]$cachedContents$top[[19]]$item
       longitude         latitude 
"-76.6122106478"  "39.2364856246" 


$meta$view$columns[[14]]$cachedContents$top[[20]]
$meta$view$columns[[14]]$cachedContents$top[[20]]$count
[1] 1

$meta$view$columns[[14]]$cachedContents$top[[20]]$item
       longitude         latitude 
"-76.6098121277"  "39.3704929583" 




$meta$view$columns[[14]]$format
named list()

$meta$view$columns[[14]]$subColumnTypes
[1] "human_address"   "latitude"        "longitude"      
[4] "machine_address" "needs_recoding" 



$meta$view$displayFormat
$meta$view$displayFormat$viewport
  ymin   ymax   xmin   xmax 
 39.22  39.39 -77.00 -76.22 

$meta$view$displayFormat$plotStyle
[1] "point"

$meta$view$displayFormat$type
[1] "google"

$meta$view$displayFormat$plot
locationId 
   2224366 


$meta$view$grants
$meta$view$grants[[1]]
$meta$view$grants[[1]]$inherited
[1] TRUE

$meta$view$grants[[1]]$type
[1] "viewer"

$meta$view$grants[[1]]$flags
[1] "public"



$meta$view$license
                                                  name 
           "Creative Commons Attribution 3.0 Unported" 
                                               logoUrl 
                          "images/licenses/cc30by.png" 
                                             termsLink 
"http://creativecommons.org/licenses/by/3.0/legalcode" 

$meta$view$metadata
$meta$view$metadata$renderTypeConfig
$meta$view$metadata$renderTypeConfig$visible
  map table 
 TRUE  TRUE 


$meta$view$metadata$availableDisplayTypes
[1] "map"    "table"  "fatrow" "page"  

$meta$view$metadata$thumbnail
$meta$view$metadata$thumbnail$page
$meta$view$metadata$thumbnail$page$created
[1] TRUE

$meta$view$metadata$thumbnail$page$selection
height  width     y1     y2     x2     x1 
   248    465    520    768    465      0 

$meta$view$metadata$thumbnail$page$filename
[1] "page.png-465.248.0.520.png"



$meta$view$metadata$rdfSubject
[1] "0"

$meta$view$metadata$rowIdentifier
[1] "0"

$meta$view$metadata$rdfClass
[1] ""


$meta$view$owner
$meta$view$owner$id
[1] "36sd-xuaw"

$meta$view$owner$displayName
[1] "nicktann"

$meta$view$owner$emailUnsubscribed
[1] FALSE

$meta$view$owner$privacyControl
[1] "login"

$meta$view$owner$profileLastModified
[1] 1.334e+09

$meta$view$owner$screenName
[1] "nicktann"


$meta$view$query
named list()

$meta$view$rights
[1] "read"

$meta$view$tableAuthor
$meta$view$tableAuthor$id
[1] "n22b-663u"

$meta$view$tableAuthor$displayName
[1] "hchudson_bmore"

$meta$view$tableAuthor$emailUnsubscribed
[1] FALSE

$meta$view$tableAuthor$privacyControl
[1] "login"

$meta$view$tableAuthor$privilegesDisabled
[1] FALSE

$meta$view$tableAuthor$profileLastModified
[1] 1.334e+09

$meta$view$tableAuthor$roleName
[1] "administrator"

$meta$view$tableAuthor$screenName
[1] "hchudson_bmore"

$meta$view$tableAuthor$rights
 [1] "create_datasets"       "edit_others_datasets" 
 [3] "edit_sdp"              "edit_site_theme"      
 [5] "moderate_comments"     "manage_users"         
 [7] "chown_datasets"        "edit_nominations"     
 [9] "approve_nominations"   "feature_items"        
[11] "federations"           "manage_stories"       
[13] "manage_approval"       "change_configurations"
[15] "view_domain"           "view_others_datasets" 
[17] "edit_pages"            "create_pages"         


$meta$view$tags
[1] "speed"          "transportation" "citation"      



$data
$data[[1]]
$data[[1]][[1]]
[1] 1

$data[[1]][[2]]
[1] "290A6A2D-0BD0-4AD0-ADD2-71BC3160A48D"

$data[[1]][[3]]
[1] 1

$data[[1]][[4]]
[1] 1.331e+09

$data[[1]][[5]]
[1] "393202"

$data[[1]][[6]]
[1] 1.331e+09

$data[[1]][[7]]
[1] "393202"

$data[[1]][[8]]
[1] "{\n}"

$data[[1]][[9]]
[1] "S CATON AVE & BENSON AVE"

$data[[1]][[10]]
[1] "N/B"

$data[[1]][[11]]
[1] "Caton Ave"

$data[[1]][[12]]
[1] "Benson Ave"

$data[[1]][[13]]
[1] "Caton Ave & Benson Ave"

$data[[1]][[14]]
$data[[1]][[14]][[1]]
NULL

$data[[1]][[14]][[2]]
[1] "39.2693779962"

$data[[1]][[14]][[3]]
[1] "-76.6688185297"

$data[[1]][[14]][[4]]
NULL

$data[[1]][[14]][[5]]
[1] FALSE



$data[[2]]
$data[[2]][[1]]
[1] 2

$data[[2]][[2]]
[1] "B3CF1F19-2FC3-4654-933C-97D96BCADE2F"

$data[[2]][[3]]
[1] 2

$data[[2]][[4]]
[1] 1.331e+09

$data[[2]][[5]]
[1] "393202"

$data[[2]][[6]]
[1] 1.331e+09

$data[[2]][[7]]
[1] "393202"

$data[[2]][[8]]
[1] "{\n}"

$data[[2]][[9]]
[1] "S CATON AVE & BENSON AVE"

$data[[2]][[10]]
[1] "S/B"

$data[[2]][[11]]
[1] "Caton Ave"

$data[[2]][[12]]
[1] "Benson Ave"

$data[[2]][[13]]
[1] "Caton Ave & Benson Ave"

$data[[2]][[14]]
$data[[2]][[14]][[1]]
NULL

$data[[2]][[14]][[2]]
[1] "39.2693157898"

$data[[2]][[14]][[3]]
[1] "-76.6689698176"

$data[[2]][[14]][[4]]
NULL

$data[[2]][[14]][[5]]
[1] FALSE



$data[[3]]
$data[[3]][[1]]
[1] 3

$data[[3]][[2]]
[1] "29E5BC8E-86BC-4F4C-8424-E471000DE8D4"

$data[[3]][[3]]
[1] 3

$data[[3]][[4]]
[1] 1.331e+09

$data[[3]][[5]]
[1] "393202"

$data[[3]][[6]]
[1] 1.331e+09

$data[[3]][[7]]
[1] "393202"

$data[[3]][[8]]
[1] "{\n}"

$data[[3]][[9]]
[1] "WILKENS AVE & PINE HEIGHTS AVE"

$data[[3]][[10]]
[1] "E/B"

$data[[3]][[11]]
[1] "Wilkens Ave"

$data[[3]][[12]]
[1] "Pine Heights"

$data[[3]][[13]]
[1] "Wilkens Ave & Pine Heights"

$data[[3]][[14]]
$data[[3]][[14]][[1]]
NULL

$data[[3]][[14]][[2]]
[1] "39.2720252302"

$data[[3]][[14]][[3]]
[1] "-76.676960806"

$data[[3]][[14]][[4]]
NULL

$data[[3]][[14]][[5]]
[1] FALSE



$data[[4]]
$data[[4]][[1]]
[1] 4

$data[[4]][[2]]
[1] "840D1E05-787C-48D0-982E-5AF0391DE3CE"

$data[[4]][[3]]
[1] 4

$data[[4]][[4]]
[1] 1.331e+09

$data[[4]][[5]]
[1] "393202"

$data[[4]][[6]]
[1] 1.331e+09

$data[[4]][[7]]
[1] "393202"

$data[[4]][[8]]
[1] "{\n}"

$data[[4]][[9]]
[1] "THE ALAMEDA & E 33RD ST"

$data[[4]][[10]]
[1] "S/B"

$data[[4]][[11]]
[1] "The Alameda"

$data[[4]][[12]]
[1] "33rd St"

$data[[4]][[13]]
[1] "The Alameda  & 33rd St"

$data[[4]][[14]]
$data[[4]][[14]][[1]]
NULL

$data[[4]][[14]][[2]]
[1] "39.3285013141"

$data[[4]][[14]][[3]]
[1] "-76.5953545714"

$data[[4]][[14]][[4]]
NULL

$data[[4]][[14]][[5]]
[1] FALSE



$data[[5]]
$data[[5]][[1]]
[1] 5

$data[[5]][[2]]
[1] "798001FA-7915-4263-89C4-89E2FBC5B3D3"

$data[[5]][[3]]
[1] 5

$data[[5]][[4]]
[1] 1.331e+09

$data[[5]][[5]]
[1] "393202"

$data[[5]][[6]]
[1] 1.331e+09

$data[[5]][[7]]
[1] "393202"

$data[[5]][[8]]
[1] "{\n}"

$data[[5]][[9]]
[1] "E 33RD ST & THE ALAMEDA"

$data[[5]][[10]]
[1] "E/B"

$data[[5]][[11]]
[1] "E 33rd"

$data[[5]][[12]]
[1] "The Alameda"

$data[[5]][[13]]
[1] "E 33rd  & The Alameda"

$data[[5]][[14]]
$data[[5]][[14]][[1]]
NULL

$data[[5]][[14]][[2]]
[1] "39.3283410623"

$data[[5]][[14]][[3]]
[1] "-76.5953594625"

$data[[5]][[14]][[4]]
NULL

$data[[5]][[14]][[5]]
[1] FALSE



$data[[6]]
$data[[6]][[1]]
[1] 6

$data[[6]][[2]]
[1] "96DC377D-34F2-41EA-9EFE-95F7CA99729D"

$data[[6]][[3]]
[1] 6

$data[[6]][[4]]
[1] 1.331e+09

$data[[6]][[5]]
[1] "393202"

$data[[6]][[6]]
[1] 1.331e+09

$data[[6]][[7]]
[1] "393202"

$data[[6]][[8]]
[1] "{\n}"

$data[[6]][[9]]
[1] "ERDMAN AVE & N MACON ST"

$data[[6]][[10]]
[1] "E/B"

$data[[6]][[11]]
[1] "Erdman"

$data[[6]][[12]]
[1] "Macon St"

$data[[6]][[13]]
[1] "Erdman  & Macon St"

$data[[6]][[14]]
$data[[6]][[14]][[1]]
NULL

$data[[6]][[14]][[2]]
[1] "39.3068045671"

$data[[6]][[14]][[3]]
[1] "-76.5593167803"

$data[[6]][[14]][[4]]
NULL

$data[[6]][[14]][[5]]
[1] FALSE



$data[[7]]
$data[[7]][[1]]
[1] 7

$data[[7]][[2]]
[1] "695D9FE9-ACA8-4EA9-A0A0-9A4AEFEE30EF"

$data[[7]][[3]]
[1] 7

$data[[7]][[4]]
[1] 1.331e+09

$data[[7]][[5]]
[1] "393202"

$data[[7]][[6]]
[1] 1.331e+09

$data[[7]][[7]]
[1] "393202"

$data[[7]][[8]]
[1] "{\n}"

$data[[7]][[9]]
[1] "ERDMAN AVE & N MACON ST"

$data[[7]][[10]]
[1] "W/B"

$data[[7]][[11]]
[1] "Erdman"

$data[[7]][[12]]
[1] "Macon St"

$data[[7]][[13]]
[1] "Erdman  & Macon St"

$data[[7]][[14]]
$data[[7]][[14]][[1]]
NULL

$data[[7]][[14]][[2]]
[1] "39.306966535"

$data[[7]][[14]][[3]]
[1] "-76.5593122365"

$data[[7]][[14]][[4]]
NULL

$data[[7]][[14]][[5]]
[1] FALSE



$data[[8]]
$data[[8]][[1]]
[1] 8

$data[[8]][[2]]
[1] "D9BFADCF-66CD-43C2-A380-FA7A5EE64121"

$data[[8]][[3]]
[1] 8

$data[[8]][[4]]
[1] 1.331e+09

$data[[8]][[5]]
[1] "393202"

$data[[8]][[6]]
[1] 1.331e+09

$data[[8]][[7]]
[1] "393202"

$data[[8]][[8]]
[1] "{\n}"

$data[[8]][[9]]
[1] "N CHARLES ST & E LAKE AVE"

$data[[8]][[10]]
[1] "S/B"

$data[[8]][[11]]
[1] "Charles"

$data[[8]][[12]]
[1] "Lake Ave"

$data[[8]][[13]]
[1] "Charles & Lake Ave"

$data[[8]][[14]]
$data[[8]][[14]][[1]]
NULL

$data[[8]][[14]][[2]]
[1] "39.3690535299"

$data[[8]][[14]][[3]]
[1] "-76.625826716"

$data[[8]][[14]][[4]]
NULL

$data[[8]][[14]][[5]]
[1] FALSE



$data[[9]]
$data[[9]][[1]]
[1] 9

$data[[9]][[2]]
[1] "779B0304-E94D-40B8-8930-CAFAD8DC7C69"

$data[[9]][[3]]
[1] 9

$data[[9]][[4]]
[1] 1.331e+09

$data[[9]][[5]]
[1] "393202"

$data[[9]][[6]]
[1] 1.331e+09

$data[[9]][[7]]
[1] "393202"

$data[[9]][[8]]
[1] "{\n}"

$data[[9]][[9]]
[1] "E MADISON ST & N CAROLINE ST"

$data[[9]][[10]]
[1] "W/B"

$data[[9]][[11]]
[1] "Madison"

$data[[9]][[12]]
[1] "Caroline St"

$data[[9]][[13]]
[1] "Madison  & Caroline St"

$data[[9]][[14]]
$data[[9]][[14]][[1]]
NULL

$data[[9]][[14]][[2]]
[1] "39.2993257666"

$data[[9]][[14]][[3]]
[1] "-76.5976760827"

$data[[9]][[14]][[4]]
NULL

$data[[9]][[14]][[5]]
[1] FALSE



$data[[10]]
$data[[10]][[1]]
[1] 10

$data[[10]][[2]]
[1] "DA403586-C4A2-409F-90B6-C9C8750A5CF1"

$data[[10]][[3]]
[1] 10

$data[[10]][[4]]
[1] 1.331e+09

$data[[10]][[5]]
[1] "393202"

$data[[10]][[6]]
[1] 1.331e+09

$data[[10]][[7]]
[1] "393202"

$data[[10]][[8]]
[1] "{\n}"

$data[[10]][[9]]
[1] "ORLEANS ST & N LINWOOD AVE"

$data[[10]][[10]]
[1] "E/B"

$data[[10]][[11]]
[1] "Orleans"

$data[[10]][[12]]
[1] "Linwood Ave"

$data[[10]][[13]]
[1] "Orleans   & Linwood Ave"

$data[[10]][[14]]
$data[[10]][[14]][[1]]
NULL

$data[[10]][[14]][[2]]
[1] "39.2958661981"

$data[[10]][[14]][[3]]
[1] "-76.5764270078"

$data[[10]][[14]][[4]]
NULL

$data[[10]][[14]][[5]]
[1] FALSE



$data[[11]]
$data[[11]][[1]]
[1] 11

$data[[11]][[2]]
[1] "D5A73F1E-F472-4A4E-AE51-9FBD0358D267"

$data[[11]][[3]]
[1] 11

$data[[11]][[4]]
[1] 1.331e+09

$data[[11]][[5]]
[1] "393202"

$data[[11]][[6]]
[1] 1.331e+09

$data[[11]][[7]]
[1] "393202"

$data[[11]][[8]]
[1] "{\n}"

$data[[11]][[9]]
[1] "EASTERN AVE & KANE ST"

$data[[11]][[10]]
[1] "E/B"

$data[[11]][[11]]
[1] "Eastern"

$data[[11]][[12]]
[1] "Kane St"

$data[[11]][[13]]
[1] "Eastern  & Kane St"

$data[[11]][[14]]
$data[[11]][[14]][[1]]
NULL

$data[[11]][[14]][[2]]
[1] "39.2877626582"

$data[[11]][[14]][[3]]
[1] "-76.5371017795"

$data[[11]][[14]][[4]]
NULL

$data[[11]][[14]][[5]]
[1] FALSE



$data[[12]]
$data[[12]][[1]]
[1] 12

$data[[12]][[2]]
[1] "D5154F01-93EC-4DAD-A8EF-3C6E9B9A666C"

$data[[12]][[3]]
[1] 12

$data[[12]][[4]]
[1] 1.331e+09

$data[[12]][[5]]
[1] "393202"

$data[[12]][[6]]
[1] 1.331e+09

$data[[12]][[7]]
[1] "393202"

$data[[12]][[8]]
[1] "{\n}"

$data[[12]][[9]]
[1] "EDMONDSON AVE & COOKS LN"

$data[[12]][[10]]
[1] "E/B"

$data[[12]][[11]]
[1] "Edmonson"

$data[[12]][[12]]
[1] "Cooks Lane"

$data[[12]][[13]]
[1] "Edmonson  & Cooks Lane"

$data[[12]][[14]]
$data[[12]][[14]][[1]]
NULL

$data[[12]][[14]][[2]]
[1] "39.2923680595"

$data[[12]][[14]][[3]]
[1] "-76.7017056326"

$data[[12]][[14]][[4]]
NULL

$data[[12]][[14]][[5]]
[1] FALSE



$data[[13]]
$data[[13]][[1]]
[1] 13

$data[[13]][[2]]
[1] "4F205596-E709-4F7D-ABC9-18D6D8EA048B"

$data[[13]][[3]]
[1] 13

$data[[13]][[4]]
[1] 1.331e+09

$data[[13]][[5]]
[1] "393202"

$data[[13]][[6]]
[1] 1.331e+09

$data[[13]][[7]]
[1] "393202"

$data[[13]][[8]]
[1] "{\n}"

$data[[13]][[9]]
[1] "W FRANKLIN ST & N PULASKI ST"

$data[[13]][[10]]
[1] "W/B"

$data[[13]][[11]]
[1] "Franklin"

$data[[13]][[12]]
[1] "Pulaski St"

$data[[13]][[13]]
[1] "Franklin  & Pulaski St"

$data[[13]][[14]]
$data[[13]][[14]][[1]]
NULL

$data[[13]][[14]][[2]]
[1] "39.2937082594"

$data[[13]][[14]][[3]]
[1] "-76.6503837515"

$data[[13]][[14]][[4]]
NULL

$data[[13]][[14]][[5]]
[1] FALSE



$data[[14]]
$data[[14]][[1]]
[1] 14

$data[[14]][[2]]
[1] "F253743B-4566-43E2-8E4F-B7E8D6A68521"

$data[[14]][[3]]
[1] 14

$data[[14]][[4]]
[1] 1.331e+09

$data[[14]][[5]]
[1] "393202"

$data[[14]][[6]]
[1] 1.331e+09

$data[[14]][[7]]
[1] "393202"

$data[[14]][[8]]
[1] "{\n}"

$data[[14]][[9]]
[1] "ORLEANS ST & N GAY ST"

$data[[14]][[10]]
[1] "E/B"

$data[[14]][[11]]
[1] "Orleans"

$data[[14]][[12]]
[1] "Gay St"

$data[[14]][[13]]
[1] "Orleans  & Gay St"

$data[[14]][[14]]
$data[[14]][[14]][[1]]
NULL

$data[[14]][[14]][[2]]
[1] "39.2947203114"

$data[[14]][[14]][[3]]
[1] "-76.606128007"

$data[[14]][[14]][[4]]
NULL

$data[[14]][[14]][[5]]
[1] FALSE



$data[[15]]
$data[[15]][[1]]
[1] 15

$data[[15]][[2]]
[1] "9B06A134-0DF6-428B-8F63-819EC0C3F683"

$data[[15]][[3]]
[1] 15

$data[[15]][[4]]
[1] 1.331e+09

$data[[15]][[5]]
[1] "393202"

$data[[15]][[6]]
[1] 1.331e+09

$data[[15]][[7]]
[1] "393202"

$data[[15]][[8]]
[1] "{\n}"

$data[[15]][[9]]
[1] "S MARTIN LUTHER KING JR BLVD & WASHINGTON BLVD"

$data[[15]][[10]]
[1] "N/B"

$data[[15]][[11]]
[1] "MLK Jr. Blvd."

$data[[15]][[12]]
[1] "Washington Blvd"

$data[[15]][[13]]
[1] "MLK Jr. Blvd.  & Washington Blvd"

$data[[15]][[14]]
$data[[15]][[14]][[1]]
NULL

$data[[15]][[14]][[2]]
[1] "39.2834598231"

$data[[15]][[14]][[3]]
[1] "-76.6261138807"

$data[[15]][[14]][[4]]
NULL

$data[[15]][[14]][[5]]
[1] FALSE



$data[[16]]
$data[[16]][[1]]
[1] 16

$data[[16]][[2]]
[1] "84F7C266-76FA-41AE-A87F-4C6F2D6CD5BA"

$data[[16]][[3]]
[1] 16

$data[[16]][[4]]
[1] 1.331e+09

$data[[16]][[5]]
[1] "393202"

$data[[16]][[6]]
[1] 1.331e+09

$data[[16]][[7]]
[1] "393202"

$data[[16]][[8]]
[1] "{\n}"

$data[[16]][[9]]
[1] "HILLEN RD & ARGONNE DR"

$data[[16]][[10]]
[1] "S/B"

$data[[16]][[11]]
[1] "Hillen Rd"

$data[[16]][[12]]
[1] "Argonne Drive"

$data[[16]][[13]]
[1] "Hillen Rd  & Argonne Drive"

$data[[16]][[14]]
$data[[16]][[14]][[1]]
NULL

$data[[16]][[14]][[2]]
[1] "39.3399907644"

$data[[16]][[14]][[3]]
[1] "-76.588021025"

$data[[16]][[14]][[4]]
NULL

$data[[16]][[14]][[5]]
[1] FALSE



$data[[17]]
$data[[17]][[1]]
[1] 17

$data[[17]][[2]]
[1] "C19B802E-CFA6-4994-A5D5-F88C0154AD68"

$data[[17]][[3]]
[1] 17

$data[[17]][[4]]
[1] 1.331e+09

$data[[17]][[5]]
[1] "393202"

$data[[17]][[6]]
[1] 1.331e+09

$data[[17]][[7]]
[1] "393202"

$data[[17]][[8]]
[1] "{\n}"

$data[[17]][[9]]
[1] "W NORTH AVE & N HOWARD ST"

$data[[17]][[10]]
[1] "W/B"

$data[[17]][[11]]
[1] "North Ave"

$data[[17]][[12]]
[1] "Howard St"

$data[[17]][[13]]
[1] "North Ave  & Howard St"

$data[[17]][[14]]
$data[[17]][[14]][[1]]
NULL

$data[[17]][[14]][[2]]
[1] "39.3110873669"

$data[[17]][[14]][[3]]
[1] "-76.6193071428"

$data[[17]][[14]][[4]]
NULL

$data[[17]][[14]][[5]]
[1] FALSE



$data[[18]]
$data[[18]][[1]]
[1] 18

$data[[18]][[2]]
[1] "D1D5349A-2140-4909-9CB9-DC4E928A27AC"

$data[[18]][[3]]
[1] 18

$data[[18]][[4]]
[1] 1.331e+09

$data[[18]][[5]]
[1] "393202"

$data[[18]][[6]]
[1] 1.331e+09

$data[[18]][[7]]
[1] "393202"

$data[[18]][[8]]
[1] "{\n}"

$data[[18]][[9]]
[1] "E PATAPSCO AVE & 4TH ST"

$data[[18]][[10]]
[1] "W/B"

$data[[18]][[11]]
[1] "Patapsco  \n"

$data[[18]][[12]]
[1] "4th St"

$data[[18]][[13]]
[1] "Patapsco  \n & 4th St"

$data[[18]][[14]]
$data[[18]][[14]][[1]]
NULL

$data[[18]][[14]][[2]]
[1] "39.2372692804"

$data[[18]][[14]][[3]]
[1] "-76.6054039252"

$data[[18]][[14]][[4]]
NULL

$data[[18]][[14]][[5]]
[1] FALSE



$data[[19]]
$data[[19]][[1]]
[1] 19

$data[[19]][[2]]
[1] "DCCD3166-F76A-4BF7-B698-A6570C84EB2F"

$data[[19]][[3]]
[1] 19

$data[[19]][[4]]
[1] 1.331e+09

$data[[19]][[5]]
[1] "393202"

$data[[19]][[6]]
[1] 1.331e+09

$data[[19]][[7]]
[1] "393202"

$data[[19]][[8]]
[1] "{\n}"

$data[[19]][[9]]
[1] "REISTERSTOWN RD & FALLSTAFF RD"

$data[[19]][[10]]
[1] "S/B"

$data[[19]][[11]]
[1] "Reisterstown"

$data[[19]][[12]]
[1] "Fallstaff Road"

$data[[19]][[13]]
[1] "Reisterstown   & Fallstaff Road"

$data[[19]][[14]]
$data[[19]][[14]][[1]]
NULL

$data[[19]][[14]][[2]]
[1] "39.3621351031"

$data[[19]][[14]][[3]]
[1] "-76.7102427408"

$data[[19]][[14]][[4]]
NULL

$data[[19]][[14]][[5]]
[1] FALSE



$data[[20]]
$data[[20]][[1]]
[1] 20

$data[[20]][[2]]
[1] "148079FF-C956-434C-834C-199C2CAD935B"

$data[[20]][[3]]
[1] 20

$data[[20]][[4]]
[1] 1.331e+09

$data[[20]][[5]]
[1] "393202"

$data[[20]][[6]]
[1] 1.331e+09

$data[[20]][[7]]
[1] "393202"

$data[[20]][[8]]
[1] "{\n}"

$data[[20]][[9]]
[1] "PARK HEIGHTS AVE & HAYWARD AVE"

$data[[20]][[10]]
[1] "N/B"

$data[[20]][[11]]
[1] "Park Heights"

$data[[20]][[12]]
[1] "Hayward Ave"

$data[[20]][[13]]
[1] "Park Heights   & Hayward Ave"

$data[[20]][[14]]
$data[[20]][[14]][[1]]
NULL

$data[[20]][[14]][[2]]
[1] "39.3499204055"

$data[[20]][[14]][[3]]
[1] "-76.6788706721"

$data[[20]][[14]][[4]]
NULL

$data[[20]][[14]][[5]]
[1] FALSE



$data[[21]]
$data[[21]][[1]]
[1] 21

$data[[21]][[2]]
[1] "06BD9104-E3E1-4925-B34C-9119F43E00DB"

$data[[21]][[3]]
[1] 21

$data[[21]][[4]]
[1] 1.331e+09

$data[[21]][[5]]
[1] "393202"

$data[[21]][[6]]
[1] 1.331e+09

$data[[21]][[7]]
[1] "393202"

$data[[21]][[8]]
[1] "{\n}"

$data[[21]][[9]]
[1] "PARK HEIGHTS AVE & HAYWARD AVE"

$data[[21]][[10]]
[1] "S/B"

$data[[21]][[11]]
[1] "Park Heights"

$data[[21]][[12]]
[1] "Hayward Ave"

$data[[21]][[13]]
[1] "Park Heights   & Hayward Ave"

$data[[21]][[14]]
$data[[21]][[14]][[1]]
NULL

$data[[21]][[14]][[2]]
[1] "39.3499204055"

$data[[21]][[14]][[3]]
[1] "-76.6788706721"

$data[[21]][[14]][[4]]
NULL

$data[[21]][[14]][[5]]
[1] FALSE



$data[[22]]
$data[[22]][[1]]
[1] 22

$data[[22]][[2]]
[1] "1C26740B-45D2-4A82-B7EC-3422A4E093FB"

$data[[22]][[3]]
[1] 22

$data[[22]][[4]]
[1] 1.331e+09

$data[[22]][[5]]
[1] "393202"

$data[[22]][[6]]
[1] 1.331e+09

$data[[22]][[7]]
[1] "393202"

$data[[22]][[8]]
[1] "{\n}"

$data[[22]][[9]]
[1] "S MARTIN LUTHER KING JR BLVD & W PRATT ST"

$data[[22]][[10]]
[1] "S/B"

$data[[22]][[11]]
[1] "MLK Jr. Blvd \n"

$data[[22]][[12]]
[1] "Pratt St"

$data[[22]][[13]]
[1] "MLK Jr. Blvd \n & Pratt St"

$data[[22]][[14]]
$data[[22]][[14]][[1]]
NULL

$data[[22]][[14]][[2]]
[1] "39.2860268994"

$data[[22]][[14]][[3]]
[1] "-76.6278460704"

$data[[22]][[14]][[4]]
NULL

$data[[22]][[14]][[5]]
[1] FALSE



$data[[23]]
$data[[23]][[1]]
[1] 23

$data[[23]][[2]]
[1] "66D2A4BB-1FAE-4E5C-B3FE-CBC9B00B05E0"

$data[[23]][[3]]
[1] 23

$data[[23]][[4]]
[1] 1.331e+09

$data[[23]][[5]]
[1] "393202"

$data[[23]][[6]]
[1] 1.331e+09

$data[[23]][[7]]
[1] "393202"

$data[[23]][[8]]
[1] "{\n}"

$data[[23]][[9]]
[1] "W NORTHERN PKWY & GREENSPRING AVE"

$data[[23]][[10]]
[1] "E/B"

$data[[23]][[11]]
[1] "Northern Pkwy"

$data[[23]][[12]]
[1] "Greenspring Ave"

$data[[23]][[13]]
[1] "Northern Pkwy   & Greenspring Ave"

$data[[23]][[14]]
$data[[23]][[14]][[1]]
NULL

$data[[23]][[14]][[2]]
[1] "39.3550243172"

$data[[23]][[14]][[3]]
[1] "-76.6604587972"

$data[[23]][[14]][[4]]
NULL

$data[[23]][[14]][[5]]
[1] FALSE



$data[[24]]
$data[[24]][[1]]
[1] 24

$data[[24]][[2]]
[1] "DC6C63E5-1B64-4DC2-B850-BEE7A0F7E351"

$data[[24]][[3]]
[1] 24

$data[[24]][[4]]
[1] 1.331e+09

$data[[24]][[5]]
[1] "393202"

$data[[24]][[6]]
[1] 1.331e+09

$data[[24]][[7]]
[1] "393202"

$data[[24]][[8]]
[1] "{\n}"

$data[[24]][[9]]
[1] "W NORTHERN PKWY & GREENSPRING AVE"

$data[[24]][[10]]
[1] "W/B"

$data[[24]][[11]]
[1] "Northern Pkwy"

$data[[24]][[12]]
[1] "Greenspring Ave"

$data[[24]][[13]]
[1] "Northern Pkwy  & Greenspring Ave"

$data[[24]][[14]]
$data[[24]][[14]][[1]]
NULL

$data[[24]][[14]][[2]]
[1] "39.3551612114"

$data[[24]][[14]][[3]]
[1] "-76.6605058823"

$data[[24]][[14]][[4]]
NULL

$data[[24]][[14]][[5]]
[1] FALSE



$data[[25]]
$data[[25]][[1]]
[1] 25

$data[[25]][[2]]
[1] "336DD002-F6B8-40D0-A123-E22588E5FAE2"

$data[[25]][[3]]
[1] 25

$data[[25]][[4]]
[1] 1.331e+09

$data[[25]][[5]]
[1] "393202"

$data[[25]][[6]]
[1] 1.331e+09

$data[[25]][[7]]
[1] "393202"

$data[[25]][[8]]
[1] "{\n}"

$data[[25]][[9]]
[1] "EDMONDSON AVE & N ATHOL AVE"

$data[[25]][[10]]
[1] "E/B"

$data[[25]][[11]]
[1] "Edmonson\n"

$data[[25]][[12]]
[1] "Woodbridge Ave"

$data[[25]][[13]]
[1] "Edmonson\n  & Woodbridge Ave"

$data[[25]][[14]]
$data[[25]][[14]][[1]]
NULL

$data[[25]][[14]][[2]]
[1] "39.2934525382"

$data[[25]][[14]][[3]]
[1] "-76.6893905792"

$data[[25]][[14]][[4]]
NULL

$data[[25]][[14]][[5]]
[1] FALSE



$data[[26]]
$data[[26]][[1]]
[1] 26

$data[[26]][[2]]
[1] "40ACEF43-B790-4741-ABB4-C3FBA8DCEFB0"

$data[[26]][[3]]
[1] 26

$data[[26]][[4]]
[1] 1.331e+09

$data[[26]][[5]]
[1] "393202"

$data[[26]][[6]]
[1] 1.331e+09

$data[[26]][[7]]
[1] "393202"

$data[[26]][[8]]
[1] "{\n}"

$data[[26]][[9]]
[1] "EDMONDSON AVE & N ATHOL AVE"

$data[[26]][[10]]
[1] "W/B"

$data[[26]][[11]]
[1] "Edmonson \n"

$data[[26]][[12]]
[1] "Woodbridge Ave"

$data[[26]][[13]]
[1] "Edmonson \n & Woodbridge Ave"

$data[[26]][[14]]
$data[[26]][[14]][[1]]
NULL

$data[[26]][[14]][[2]]
[1] "39.2935925831"

$data[[26]][[14]][[3]]
[1] "-76.689399241"

$data[[26]][[14]][[4]]
NULL

$data[[26]][[14]][[5]]
[1] FALSE



$data[[27]]
$data[[27]][[1]]
[1] 27

$data[[27]][[2]]
[1] "1C11553C-1669-4B07-BCA8-5DCCD9C318AF"

$data[[27]][[3]]
[1] 27

$data[[27]][[4]]
[1] 1.331e+09

$data[[27]][[5]]
[1] "393202"

$data[[27]][[6]]
[1] 1.331e+09

$data[[27]][[7]]
[1] "393202"

$data[[27]][[8]]
[1] "{\n}"

$data[[27]][[9]]
[1] "FREDERICK AVE & S CATHERINE ST"

$data[[27]][[10]]
[1] "E/B"

$data[[27]][[11]]
[1] "Fredrick Ave\n"

$data[[27]][[12]]
[1] "Catherine Ave"

$data[[27]][[13]]
[1] "Fredrick Ave\n & Catherine Ave"

$data[[27]][[14]]
$data[[27]][[14]][[1]]
NULL

$data[[27]][[14]][[2]]
[1] "39.2833935865"

$data[[27]][[14]][[3]]
[1] "-76.6559289926"

$data[[27]][[14]][[4]]
NULL

$data[[27]][[14]][[5]]
[1] FALSE



$data[[28]]
$data[[28]][[1]]
[1] 28

$data[[28]][[2]]
[1] "48EA3190-439D-40B6-AE93-9F4146BA4259"

$data[[28]][[3]]
[1] 28

$data[[28]][[4]]
[1] 1.331e+09

$data[[28]][[5]]
[1] "393202"

$data[[28]][[6]]
[1] 1.331e+09

$data[[28]][[7]]
[1] "393202"

$data[[28]][[8]]
[1] "{\n}"

$data[[28]][[9]]
[1] "PARK HEIGHTS AVE & VIOLET AVE"

$data[[28]][[10]]
[1] "N/B"

$data[[28]][[11]]
[1] "Park Heights"

$data[[28]][[12]]
[1] "Voilet Ave"

$data[[28]][[13]]
[1] "Park Heights  & Voilet Ave"

$data[[28]][[14]]
$data[[28]][[14]][[1]]
NULL

$data[[28]][[14]][[2]]
[1] "39.3307133383"

$data[[28]][[14]][[3]]
[1] "-76.6597502076"

$data[[28]][[14]][[4]]
NULL

$data[[28]][[14]][[5]]
[1] FALSE



$data[[29]]
$data[[29]][[1]]
[1] 29

$data[[29]][[2]]
[1] "7EC6CC85-C158-4C94-85D7-232B4872862D"

$data[[29]][[3]]
[1] 29

$data[[29]][[4]]
[1] 1.331e+09

$data[[29]][[5]]
[1] "393202"

$data[[29]][[6]]
[1] 1.331e+09

$data[[29]][[7]]
[1] "393202"

$data[[29]][[8]]
[1] "{\n}"

$data[[29]][[9]]
[1] "SINCLAIR LN & MORAVIA RD"

$data[[29]][[10]]
[1] "W/B"

$data[[29]][[11]]
[1] "Sinclair"

$data[[29]][[12]]
[1] "Moravia Road"

$data[[29]][[13]]
[1] "Sinclair  & Moravia Road"

$data[[29]][[14]]
$data[[29]][[14]][[1]]
NULL

$data[[29]][[14]][[2]]
[1] "39.3220360862"

$data[[29]][[14]][[3]]
[1] "-76.5484525966"

$data[[29]][[14]][[4]]
NULL

$data[[29]][[14]][[5]]
[1] FALSE



$data[[30]]
$data[[30]][[1]]
[1] 30

$data[[30]][[2]]
[1] "3899882F-E928-4D82-935A-74B202C1B41E"

$data[[30]][[3]]
[1] 30

$data[[30]][[4]]
[1] 1.331e+09

$data[[30]][[5]]
[1] "393202"

$data[[30]][[6]]
[1] 1.331e+09

$data[[30]][[7]]
[1] "393202"

$data[[30]][[8]]
[1] "{\n}"

$data[[30]][[9]]
[1] "WILKENS AVE & DESOTO RD"

$data[[30]][[10]]
[1] "E/B"

$data[[30]][[11]]
[1] "Wilkens"

$data[[30]][[12]]
[1] "DeSoto"

$data[[30]][[13]]
[1] "Wilkens  & DeSoto"

$data[[30]][[14]]
$data[[30]][[14]][[1]]
NULL

$data[[30]][[14]][[2]]
[1] "39.2749037576"

$data[[30]][[14]][[3]]
[1] "-76.6681630903"

$data[[30]][[14]][[4]]
NULL

$data[[30]][[14]][[5]]
[1] FALSE



$data[[31]]
$data[[31]][[1]]
[1] 31

$data[[31]][[2]]
[1] "58A9929A-F4A8-4443-BDE9-CE285DE31D8C"

$data[[31]][[3]]
[1] 31

$data[[31]][[4]]
[1] 1.331e+09

$data[[31]][[5]]
[1] "393202"

$data[[31]][[6]]
[1] 1.331e+09

$data[[31]][[7]]
[1] "393202"

$data[[31]][[8]]
[1] "{\n}"

$data[[31]][[9]]
[1] "E NORTHERN PKWY & WAVERLY WAY"

$data[[31]][[10]]
[1] "W/B"

$data[[31]][[11]]
[1] "Northern Pkwy"

$data[[31]][[12]]
[1] "Waverly St"

$data[[31]][[13]]
[1] "Northern Pkwy  & Waverly St"

$data[[31]][[14]]
$data[[31]][[14]][[1]]
NULL

$data[[31]][[14]][[2]]
[1] "39.367051509"

$data[[31]][[14]][[3]]
[1] "-76.5810739873"

$data[[31]][[14]][[4]]
NULL

$data[[31]][[14]][[5]]
[1] FALSE



$data[[32]]
$data[[32]][[1]]
[1] 32

$data[[32]][[2]]
[1] "F344AB2A-898C-407C-AF02-5DEC35D71CB8"

$data[[32]][[3]]
[1] 32

$data[[32]][[4]]
[1] 1.331e+09

$data[[32]][[5]]
[1] "393202"

$data[[32]][[6]]
[1] 1.331e+09

$data[[32]][[7]]
[1] "393202"

$data[[32]][[8]]
[1] "{\n}"

$data[[32]][[9]]
[1] "E COLD SPRING LN & HILLEN RD"

$data[[32]][[10]]
[1] "W/B"

$data[[32]][[11]]
[1] "Cold Spring"

$data[[32]][[12]]
[1] "Hillen Road"

$data[[32]][[13]]
[1] "Cold Spring  & Hillen Road"

$data[[32]][[14]]
$data[[32]][[14]][[1]]
NULL

$data[[32]][[14]][[2]]
[1] "39.3459074717"

$data[[32]][[14]][[3]]
[1] "-76.5859273904"

$data[[32]][[14]][[4]]
NULL

$data[[32]][[14]][[5]]
[1] FALSE



$data[[33]]
$data[[33]][[1]]
[1] 33

$data[[33]][[2]]
[1] "6F682CEC-1CF1-43EE-8143-DC0CE9611C53"

$data[[33]][[3]]
[1] 33

$data[[33]][[4]]
[1] 1.331e+09

$data[[33]][[5]]
[1] "393202"

$data[[33]][[6]]
[1] 1.331e+09

$data[[33]][[7]]
[1] "393202"

$data[[33]][[8]]
[1] "{\n}"

$data[[33]][[9]]
[1] "W COLD SPRING LN & ROLAND AVE"

$data[[33]][[10]]
[1] "E/B"

$data[[33]][[11]]
[1] "Cold Spring\n"

$data[[33]][[12]]
[1] "Roland Ave"

$data[[33]][[13]]
[1] "Cold Spring\n  & Roland Ave"

$data[[33]][[14]]
$data[[33]][[14]][[1]]
NULL

$data[[33]][[14]][[2]]
[1] "39.34390606"

$data[[33]][[14]][[3]]
[1] "-76.6354262185"

$data[[33]][[14]][[4]]
NULL

$data[[33]][[14]][[5]]
[1] FALSE



$data[[34]]
$data[[34]][[1]]
[1] 34

$data[[34]][[2]]
[1] "19B02309-C7B2-4B06-A410-9BD7286DD99D"

$data[[34]][[3]]
[1] 34

$data[[34]][[4]]
[1] 1.331e+09

$data[[34]][[5]]
[1] "393202"

$data[[34]][[6]]
[1] 1.331e+09

$data[[34]][[7]]
[1] "393202"

$data[[34]][[8]]
[1] "{\n}"

$data[[34]][[9]]
[1] "E COLD SPRING LN & LOCH RAVEN BLVD"

$data[[34]][[10]]
[1] "W/B"

$data[[34]][[11]]
[1] "Cold Spring\n"

$data[[34]][[12]]
[1] "Loch Raven Blvd"

$data[[34]][[13]]
[1] "Cold Spring\n  & Loch Raven Blvd"

$data[[34]][[14]]
$data[[34]][[14]][[1]]
NULL

$data[[34]][[14]][[2]]
[1] "39.3460452397"

$data[[34]][[14]][[3]]
[1] "-76.5920075335"

$data[[34]][[14]][[4]]
NULL

$data[[34]][[14]][[5]]
[1] FALSE



$data[[35]]
$data[[35]][[1]]
[1] 35

$data[[35]][[2]]
[1] "A8198873-3C4C-4A5F-9903-3D85836A9A0E"

$data[[35]][[3]]
[1] 35

$data[[35]][[4]]
[1] 1.331e+09

$data[[35]][[5]]
[1] "393202"

$data[[35]][[6]]
[1] 1.331e+09

$data[[35]][[7]]
[1] "393202"

$data[[35]][[8]]
[1] "{\n}"

$data[[35]][[9]]
[1] "TAMARIND RD & W COLD SPRING LN"

$data[[35]][[10]]
[1] "E/B"

$data[[35]][[11]]
[1] "Tamarind\n"

$data[[35]][[12]]
[1] "Coldspring Lane"

$data[[35]][[13]]
[1] "Tamarind\n  & Coldspring Lane"

$data[[35]][[14]]
$data[[35]][[14]][[1]]
NULL

$data[[35]][[14]][[2]]
[1] "39.343899313"

$data[[35]][[14]][[3]]
[1] "-76.6519407916"

$data[[35]][[14]][[4]]
NULL

$data[[35]][[14]][[5]]
[1] FALSE



$data[[36]]
$data[[36]][[1]]
[1] 36

$data[[36]][[2]]
[1] "C668857B-8059-4555-9771-D776DC374A94"

$data[[36]][[3]]
[1] 36

$data[[36]][[4]]
[1] 1.331e+09

$data[[36]][[5]]
[1] "393202"

$data[[36]][[6]]
[1] 1.331e+09

$data[[36]][[7]]
[1] "393202"

$data[[36]][[8]]
[1] "{\n}"

$data[[36]][[9]]
[1] "HARFORD RD & THE ALAMEDA"

$data[[36]][[10]]
[1] "N/B"

$data[[36]][[11]]
[1] "Harford \n"

$data[[36]][[12]]
[1] "The Alameda"

$data[[36]][[13]]
[1] "Harford \n & The Alameda"

$data[[36]][[14]]
$data[[36]][[14]][[1]]
NULL

$data[[36]][[14]][[2]]
[1] "39.3212074758"

$data[[36]][[14]][[3]]
[1] "-76.5907705888"

$data[[36]][[14]][[4]]
NULL

$data[[36]][[14]][[5]]
[1] FALSE



$data[[37]]
$data[[37]][[1]]
[1] 37

$data[[37]][[2]]
[1] "EA03ABE8-E5AC-425E-973E-FD83B303740A"

$data[[37]][[3]]
[1] 37

$data[[37]][[4]]
[1] 1.331e+09

$data[[37]][[5]]
[1] "393202"

$data[[37]][[6]]
[1] 1.331e+09

$data[[37]][[7]]
[1] "393202"

$data[[37]][[8]]
[1] "{\n}"

$data[[37]][[9]]
[1] "HARFORD RD & ROSALIE AVE"

$data[[37]][[10]]
[1] "N/B"

$data[[37]][[11]]
[1] "Harford\n"

$data[[37]][[12]]
[1] "Rosalie Ave"

$data[[37]][[13]]
[1] "Harford\n  & Rosalie Ave"

$data[[37]][[14]]
$data[[37]][[14]][[1]]
NULL

$data[[37]][[14]][[2]]
[1] "39.3680654859"

$data[[37]][[14]][[3]]
[1] "-76.5478183886"

$data[[37]][[14]][[4]]
NULL

$data[[37]][[14]][[5]]
[1] FALSE



$data[[38]]
$data[[38]][[1]]
[1] 38

$data[[38]][[2]]
[1] "57B9861B-9D30-48AE-B65D-14B4D7E61F24"

$data[[38]][[3]]
[1] 38

$data[[38]][[4]]
[1] 1.331e+09

$data[[38]][[5]]
[1] "393202"

$data[[38]][[6]]
[1] 1.331e+09

$data[[38]][[7]]
[1] "393202"

$data[[38]][[8]]
[1] "{\n}"

$data[[38]][[9]]
[1] "HARFORD RD & CHRISTOPHER AVE"

$data[[38]][[10]]
[1] "N/B"

$data[[38]][[11]]
[1] "Harford \n"

$data[[38]][[12]]
[1] "Christopher Ave"

$data[[38]][[13]]
[1] "Harford \n & Christopher Ave"

$data[[38]][[14]]
$data[[38]][[14]][[1]]
NULL

$data[[38]][[14]][[2]]
[1] "39.3583326463"

$data[[38]][[14]][[3]]
[1] "-76.5562471252"

$data[[38]][[14]][[4]]
NULL

$data[[38]][[14]][[5]]
[1] FALSE



$data[[39]]
$data[[39]][[1]]
[1] 39

$data[[39]][[2]]
[1] "DF3D5F00-F99D-4247-B288-9534C5386F34"

$data[[39]][[3]]
[1] 39

$data[[39]][[4]]
[1] 1.331e+09

$data[[39]][[5]]
[1] "393202"

$data[[39]][[6]]
[1] 1.331e+09

$data[[39]][[7]]
[1] "393202"

$data[[39]][[8]]
[1] "{\n}"

$data[[39]][[9]]
[1] "SINCLAIR LN & SHANNON DR"

$data[[39]][[10]]
[1] "E/B"

$data[[39]][[11]]
[1] "Sinclair\n"

$data[[39]][[12]]
[1] "Shannon Drive"

$data[[39]][[13]]
[1] "Sinclair\n  & Shannon Drive"

$data[[39]][[14]]
$data[[39]][[14]][[1]]
NULL

$data[[39]][[14]][[2]]
[1] "39.3175028074"

$data[[39]][[14]][[3]]
[1] "-76.5556737923"

$data[[39]][[14]][[4]]
NULL

$data[[39]][[14]][[5]]
[1] FALSE



$data[[40]]
$data[[40]][[1]]
[1] 40

$data[[40]][[2]]
[1] "C9E090D6-C992-44C1-A04B-3D1A145A4FE0"

$data[[40]][[3]]
[1] 40

$data[[40]][[4]]
[1] 1.331e+09

$data[[40]][[5]]
[1] "393202"

$data[[40]][[6]]
[1] 1.331e+09

$data[[40]][[7]]
[1] "393202"

$data[[40]][[8]]
[1] "{\n}"

$data[[40]][[9]]
[1] "SINCLAIR LN & SHANNON DR"

$data[[40]][[10]]
[1] "W/B"

$data[[40]][[11]]
[1] "Sinclair \n"

$data[[40]][[12]]
[1] "Shannon Drive"

$data[[40]][[13]]
[1] "Sinclair \n & Shannon Drive"

$data[[40]][[14]]
$data[[40]][[14]][[1]]
NULL

$data[[40]][[14]][[2]]
[1] "39.3175028074"

$data[[40]][[14]][[3]]
[1] "-76.5556737923"

$data[[40]][[14]][[4]]
NULL

$data[[40]][[14]][[5]]
[1] FALSE



$data[[41]]
$data[[41]][[1]]
[1] 41

$data[[41]][[2]]
[1] "CF5DA912-AD7E-4A31-97CC-A4FC963E1E01"

$data[[41]][[3]]
[1] 41

$data[[41]][[4]]
[1] 1.331e+09

$data[[41]][[5]]
[1] "393202"

$data[[41]][[6]]
[1] 1.331e+09

$data[[41]][[7]]
[1] "393202"

$data[[41]][[8]]
[1] "{\n}"

$data[[41]][[9]]
[1] "LIBERTY HTS & HILLSDALE RD"

$data[[41]][[10]]
[1] "E/B"

$data[[41]][[11]]
[1] "Liberty Hghts\n"

$data[[41]][[12]]
[1] "Hillsdale Ave"

$data[[41]][[13]]
[1] "Liberty Hghts\n  & Hillsdale Ave"

$data[[41]][[14]]
$data[[41]][[14]][[1]]
NULL

$data[[41]][[14]][[2]]
[1] "39.3304453818"

$data[[41]][[14]][[3]]
[1] "-76.6945100293"

$data[[41]][[14]][[4]]
NULL

$data[[41]][[14]][[5]]
[1] FALSE



$data[[42]]
$data[[42]][[1]]
[1] 42

$data[[42]][[2]]
[1] "F6E1D55E-72FA-408D-8DFB-C0EC4B10A86A"

$data[[42]][[3]]
[1] 42

$data[[42]][[4]]
[1] 1.331e+09

$data[[42]][[5]]
[1] "393202"

$data[[42]][[6]]
[1] 1.331e+09

$data[[42]][[7]]
[1] "393202"

$data[[42]][[8]]
[1] "{\n}"

$data[[42]][[9]]
[1] "LIBERTY HTS & HILLSDALE RD"

$data[[42]][[10]]
[1] "W/B"

$data[[42]][[11]]
[1] "Liberty Hghts\n"

$data[[42]][[12]]
[1] "Hillsdale Ave"

$data[[42]][[13]]
[1] "Liberty Hghts\n  & Hillsdale Ave"

$data[[42]][[14]]
$data[[42]][[14]][[1]]
NULL

$data[[42]][[14]][[2]]
[1] "39.3304453818"

$data[[42]][[14]][[3]]
[1] "-76.6945100293"

$data[[42]][[14]][[4]]
NULL

$data[[42]][[14]][[5]]
[1] FALSE



$data[[43]]
$data[[43]][[1]]
[1] 43

$data[[43]][[2]]
[1] "4293F4F9-030F-4F0F-9E8C-3EDC5CECA62A"

$data[[43]][[3]]
[1] 43

$data[[43]][[4]]
[1] 1.331e+09

$data[[43]][[5]]
[1] "393202"

$data[[43]][[6]]
[1] 1.331e+09

$data[[43]][[7]]
[1] "393202"

$data[[43]][[8]]
[1] "{\n}"

$data[[43]][[9]]
[1] "E NORTHERN PKWY & SPRINGLAKE WAY"

$data[[43]][[10]]
[1] "W/B"

$data[[43]][[11]]
[1] "Northern Pkwy\n"

$data[[43]][[12]]
[1] "Springlake Way"

$data[[43]][[13]]
[1] "Northern Pkwy\n  & Springlake Way"

$data[[43]][[14]]
$data[[43]][[14]][[1]]
NULL

$data[[43]][[14]][[2]]
[1] "39.3643110382"

$data[[43]][[14]][[3]]
[1] "-76.6176988692"

$data[[43]][[14]][[4]]
NULL

$data[[43]][[14]][[5]]
[1] FALSE



$data[[44]]
$data[[44]][[1]]
[1] 44

$data[[44]][[2]]
[1] "5E1AF06A-2DCE-4A8E-B2AB-E55062D5C9D4"

$data[[44]][[3]]
[1] 44

$data[[44]][[4]]
[1] 1.331e+09

$data[[44]][[5]]
[1] "393202"

$data[[44]][[6]]
[1] 1.331e+09

$data[[44]][[7]]
[1] "393202"

$data[[44]][[8]]
[1] "{\n}"

$data[[44]][[9]]
[1] "HARFORD RD & WALTHER AVE"

$data[[44]][[10]]
[1] "S/B"

$data[[44]][[11]]
[1] "Harford"

$data[[44]][[12]]
[1] "Walther Ave"

$data[[44]][[13]]
[1] "Harford  & Walther Ave"

$data[[44]][[14]]
$data[[44]][[14]][[1]]
NULL

$data[[44]][[14]][[2]]
[1] "39.3353084656"

$data[[44]][[14]][[3]]
[1] "-76.5751846354"

$data[[44]][[14]][[4]]
NULL

$data[[44]][[14]][[5]]
[1] FALSE



$data[[45]]
$data[[45]][[1]]
[1] 45

$data[[45]][[2]]
[1] "535D224A-57B2-4DBF-880E-4581209D8DA2"

$data[[45]][[3]]
[1] 45

$data[[45]][[4]]
[1] 1.331e+09

$data[[45]][[5]]
[1] "393202"

$data[[45]][[6]]
[1] 1.331e+09

$data[[45]][[7]]
[1] "393202"

$data[[45]][[8]]
[1] "{\n}"

$data[[45]][[9]]
[1] "W NORTHERN PKWY & FALLS RD"

$data[[45]][[10]]
[1] "W/B"

$data[[45]][[11]]
[1] "Northern Pkwy"

$data[[45]][[12]]
[1] "Falls Road"

$data[[45]][[13]]
[1] "Northern Pkwy  & Falls Road"

$data[[45]][[14]]
$data[[45]][[14]][[1]]
NULL

$data[[45]][[14]][[2]]
[1] "39.3614127238"

$data[[45]][[14]][[3]]
[1] "-76.6462199216"

$data[[45]][[14]][[4]]
NULL

$data[[45]][[14]][[5]]
[1] FALSE



$data[[46]]
$data[[46]][[1]]
[1] 46

$data[[46]][[2]]
[1] "AD52DFC9-A5F7-4703-B064-8A682660BD2A"

$data[[46]][[3]]
[1] 46

$data[[46]][[4]]
[1] 1.331e+09

$data[[46]][[5]]
[1] "393202"

$data[[46]][[6]]
[1] 1.331e+09

$data[[46]][[7]]
[1] "393202"

$data[[46]][[8]]
[1] "{\n}"

$data[[46]][[9]]
[1] "EDMONDSON AVE & N HILTON ST"

$data[[46]][[10]]
[1] "E/B"

$data[[46]][[11]]
[1] "Edmonson"

$data[[46]][[12]]
[1] "Hilton St"

$data[[46]][[13]]
[1] "Edmonson  & Hilton St"

$data[[46]][[14]]
$data[[46]][[14]][[1]]
NULL

$data[[46]][[14]][[2]]
[1] "39.294061339"

$data[[46]][[14]][[3]]
[1] "-76.6727600072"

$data[[46]][[14]][[4]]
NULL

$data[[46]][[14]][[5]]
[1] FALSE



$data[[47]]
$data[[47]][[1]]
[1] 47

$data[[47]][[2]]
[1] "0FCAD5AE-A2A7-4492-BFE4-80E687158CE6"

$data[[47]][[3]]
[1] 47

$data[[47]][[4]]
[1] 1.331e+09

$data[[47]][[5]]
[1] "393202"

$data[[47]][[6]]
[1] 1.331e+09

$data[[47]][[7]]
[1] "393202"

$data[[47]][[8]]
[1] "{\n}"

$data[[47]][[9]]
[1] "N PRESIDENT ST & E FAYETTE ST"

$data[[47]][[10]]
[1] "S/B"

$data[[47]][[11]]
[1] "President"

$data[[47]][[12]]
[1] "Fayette St"

$data[[47]][[13]]
[1] "President  & Fayette St"

$data[[47]][[14]]
$data[[47]][[14]][[1]]
NULL

$data[[47]][[14]][[2]]
[1] "39.2906240776"

$data[[47]][[14]][[3]]
[1] "-76.6066648277"

$data[[47]][[14]][[4]]
NULL

$data[[47]][[14]][[5]]
[1] FALSE



$data[[48]]
$data[[48]][[1]]
[1] 48

$data[[48]][[2]]
[1] "2479540F-5C32-4BCB-BA9A-7C8DA6439155"

$data[[48]][[3]]
[1] 48

$data[[48]][[4]]
[1] 1.331e+09

$data[[48]][[5]]
[1] "393202"

$data[[48]][[6]]
[1] 1.331e+09

$data[[48]][[7]]
[1] "393202"

$data[[48]][[8]]
[1] "{\n}"

$data[[48]][[9]]
[1] "RUSSELL ST & W HAMBURG ST"

$data[[48]][[10]]
[1] "N/B"

$data[[48]][[11]]
[1] "Russell \n"

$data[[48]][[12]]
[1] "Hamburg St"

$data[[48]][[13]]
[1] "Russell \n & Hamburg St"

$data[[48]][[14]]
$data[[48]][[14]][[1]]
NULL

$data[[48]][[14]][[2]]
[1] "39.2797863216"

$data[[48]][[14]][[3]]
[1] "-76.6237544477"

$data[[48]][[14]][[4]]
NULL

$data[[48]][[14]][[5]]
[1] FALSE



$data[[49]]
$data[[49]][[1]]
[1] 49

$data[[49]][[2]]
[1] "C33CD57A-5378-4056-B060-3D96AA4B33BB"

$data[[49]][[3]]
[1] 49

$data[[49]][[4]]
[1] 1.331e+09

$data[[49]][[5]]
[1] "393202"

$data[[49]][[6]]
[1] 1.331e+09

$data[[49]][[7]]
[1] "393202"

$data[[49]][[8]]
[1] "{\n}"

$data[[49]][[9]]
[1] "RUSSELL ST & W HAMBURG ST"

$data[[49]][[10]]
[1] "S/B"

$data[[49]][[11]]
[1] "Russell\n"

$data[[49]][[12]]
[1] "Hamburg St"

$data[[49]][[13]]
[1] "Russell\n  & Hamburg St"

$data[[49]][[14]]
$data[[49]][[14]][[1]]
NULL

$data[[49]][[14]][[2]]
[1] "39.2798187398"

$data[[49]][[14]][[3]]
[1] "-76.6239105956"

$data[[49]][[14]][[4]]
NULL

$data[[49]][[14]][[5]]
[1] FALSE



$data[[50]]
$data[[50]][[1]]
[1] 50

$data[[50]][[2]]
[1] "B86B1D8E-F440-4924-94FC-CB039A5FDF23"

$data[[50]][[3]]
[1] 50

$data[[50]][[4]]
[1] 1.331e+09

$data[[50]][[5]]
[1] "393202"

$data[[50]][[6]]
[1] 1.331e+09

$data[[50]][[7]]
[1] "393202"

$data[[50]][[8]]
[1] "{\n}"

$data[[50]][[9]]
[1] "LIGHT ST & E PRATT ST"

$data[[50]][[10]]
[1] "S/B"

$data[[50]][[11]]
[1] "Light SB \n"

$data[[50]][[12]]
[1] "Pratt St"

$data[[50]][[13]]
[1] "Light SB \n & Pratt St"

$data[[50]][[14]]
$data[[50]][[14]][[1]]
NULL

$data[[50]][[14]][[2]]
[1] "39.2865415105"

$data[[50]][[14]][[3]]
[1] "-76.6135493898"

$data[[50]][[14]][[4]]
NULL

$data[[50]][[14]][[5]]
[1] FALSE



$data[[51]]
$data[[51]][[1]]
[1] 51

$data[[51]][[2]]
[1] "87743AF1-C464-4ECC-A2EE-DB9BC260F88F"

$data[[51]][[3]]
[1] 51

$data[[51]][[4]]
[1] 1.331e+09

$data[[51]][[5]]
[1] "393202"

$data[[51]][[6]]
[1] 1.331e+09

$data[[51]][[7]]
[1] "393202"

$data[[51]][[8]]
[1] "{\n}"

$data[[51]][[9]]
[1] "E LOMBARD ST & S GAY ST"

$data[[51]][[10]]
[1] "W/B"

$data[[51]][[11]]
[1] "Lombard \n"

$data[[51]][[12]]
[1] "Gay St"

$data[[51]][[13]]
[1] "Lombard \n & Gay St"

$data[[51]][[14]]
$data[[51]][[14]][[1]]
NULL

$data[[51]][[14]][[2]]
[1] "39.2877660778"

$data[[51]][[14]][[3]]
[1] "-76.6087475019"

$data[[51]][[14]][[4]]
NULL

$data[[51]][[14]][[5]]
[1] FALSE



$data[[52]]
$data[[52]][[1]]
[1] 52

$data[[52]][[2]]
[1] "8E7F7455-DE5B-4A65-B385-76E9D22366D6"

$data[[52]][[3]]
[1] 52

$data[[52]][[4]]
[1] 1.331e+09

$data[[52]][[5]]
[1] "393202"

$data[[52]][[6]]
[1] 1.331e+09

$data[[52]][[7]]
[1] "393202"

$data[[52]][[8]]
[1] "{\n}"

$data[[52]][[9]]
[1] "HARFORD RD & E NORTH AVE"

$data[[52]][[10]]
[1] "N/B"

$data[[52]][[11]]
[1] "Harford Rd\n"

$data[[52]][[12]]
[1] "North Ave"

$data[[52]][[13]]
[1] "Harford Rd\n  & North Ave"

$data[[52]][[14]]
$data[[52]][[14]][[1]]
NULL

$data[[52]][[14]][[2]]
[1] "39.3119363297"

$data[[52]][[14]][[3]]
[1] "-76.5993579666"

$data[[52]][[14]][[4]]
NULL

$data[[52]][[14]][[5]]
[1] FALSE



$data[[53]]
$data[[53]][[1]]
[1] 53

$data[[53]][[2]]
[1] "3A155502-BC6C-476A-A91B-BAD8419E0316"

$data[[53]][[3]]
[1] 53

$data[[53]][[4]]
[1] 1.331e+09

$data[[53]][[5]]
[1] "393202"

$data[[53]][[6]]
[1] 1.331e+09

$data[[53]][[7]]
[1] "393202"

$data[[53]][[8]]
[1] "{\n}"

$data[[53]][[9]]
[1] "FORT SMALLWOOD RD & FORT ARMISTEAD RD"

$data[[53]][[10]]
[1] "S/B"

$data[[53]][[11]]
[1] "Ft Smallwood\n"

$data[[53]][[12]]
[1] "Fort Armstead"

$data[[53]][[13]]
[1] "Ft Smallwood\n  & Fort Armstead"

$data[[53]][[14]]
$data[[53]][[14]][[1]]
NULL

$data[[53]][[14]][[2]]
[1] "39.1999130165"

$data[[53]][[14]][[3]]
[1] "-76.5559766825"

$data[[53]][[14]][[4]]
NULL

$data[[53]][[14]][[5]]
[1] FALSE



$data[[54]]
$data[[54]][[1]]
[1] 54

$data[[54]][[2]]
[1] "20FA03C6-FDA7-4B78-8531-ADAA44944CAF"

$data[[54]][[3]]
[1] 54

$data[[54]][[4]]
[1] 1.331e+09

$data[[54]][[5]]
[1] "393202"

$data[[54]][[6]]
[1] 1.331e+09

$data[[54]][[7]]
[1] "393202"

$data[[54]][[8]]
[1] "{\n}"

$data[[54]][[9]]
[1] "GARRISON BLVD & WABASH AVE"

$data[[54]][[10]]
[1] "E/B"

$data[[54]][[11]]
[1] "Garrison \n"

$data[[54]][[12]]
[1] "Wabash Ave"

$data[[54]][[13]]
[1] "Garrison \n & Wabash Ave"

$data[[54]][[14]]
$data[[54]][[14]][[1]]
NULL

$data[[54]][[14]][[2]]
[1] "39.3412090597"

$data[[54]][[14]][[3]]
[1] "-76.6831167251"

$data[[54]][[14]][[4]]
NULL

$data[[54]][[14]][[5]]
[1] FALSE



$data[[55]]
$data[[55]][[1]]
[1] 55

$data[[55]][[2]]
[1] "6A524FC2-05EE-45F7-A9FD-C03AFDD1D32A"

$data[[55]][[3]]
[1] 55

$data[[55]][[4]]
[1] 1.331e+09

$data[[55]][[5]]
[1] "393202"

$data[[55]][[6]]
[1] 1.331e+09

$data[[55]][[7]]
[1] "393202"

$data[[55]][[8]]
[1] "{\n}"

$data[[55]][[9]]
[1] "WALTHER AVE & GLENMORE AVE"

$data[[55]][[10]]
[1] "N/B"

$data[[55]][[11]]
[1] "Walther \n"

$data[[55]][[12]]
[1] "Glenmore"

$data[[55]][[13]]
[1] "Walther \n & Glenmore"

$data[[55]][[14]]
$data[[55]][[14]][[1]]
NULL

$data[[55]][[14]][[2]]
[1] "39.3535402213"

$data[[55]][[14]][[3]]
[1] "-76.5424942905"

$data[[55]][[14]][[4]]
NULL

$data[[55]][[14]][[5]]
[1] FALSE



$data[[56]]
$data[[56]][[1]]
[1] 56

$data[[56]][[2]]
[1] "63966382-BA03-49D1-91D8-D8F4C912AF85"

$data[[56]][[3]]
[1] 56

$data[[56]][[4]]
[1] 1.331e+09

$data[[56]][[5]]
[1] "393202"

$data[[56]][[6]]
[1] 1.331e+09

$data[[56]][[7]]
[1] "393202"

$data[[56]][[8]]
[1] "{\n}"

$data[[56]][[9]]
[1] "W FRANKLIN ST & CATHEDRAL ST"

$data[[56]][[10]]
[1] "W/B"

$data[[56]][[11]]
[1] "Franklin \n"

$data[[56]][[12]]
[1] "Cathedral"

$data[[56]][[13]]
[1] "Franklin \n & Cathedral"

$data[[56]][[14]]
$data[[56]][[14]][[1]]
NULL

$data[[56]][[14]][[2]]
[1] "39.2950659131"

$data[[56]][[14]][[3]]
[1] "-76.616872047"

$data[[56]][[14]][[4]]
NULL

$data[[56]][[14]][[5]]
[1] FALSE



$data[[57]]
$data[[57]][[1]]
[1] 57

$data[[57]][[2]]
[1] "282250A4-AEB4-4F64-8CE8-8EE7541ED7FB"

$data[[57]][[3]]
[1] 57

$data[[57]][[4]]
[1] 1.331e+09

$data[[57]][[5]]
[1] "393202"

$data[[57]][[6]]
[1] 1.331e+09

$data[[57]][[7]]
[1] "393202"

$data[[57]][[8]]
[1] "{\n}"

$data[[57]][[9]]
[1] "PERRING PKWY & E BELVEDERE AVE"

$data[[57]][[10]]
[1] "S/B"

$data[[57]][[11]]
[1] "Perring Pkwy\n"

$data[[57]][[12]]
[1] "Belvedere Ave"

$data[[57]][[13]]
[1] "Perring Pkwy\n  & Belvedere Ave"

$data[[57]][[14]]
$data[[57]][[14]][[1]]
NULL

$data[[57]][[14]][[2]]
[1] "39.3549627467"

$data[[57]][[14]][[3]]
[1] "-76.575725921"

$data[[57]][[14]][[4]]
NULL

$data[[57]][[14]][[5]]
[1] FALSE



$data[[58]]
$data[[58]][[1]]
[1] 58

$data[[58]][[2]]
[1] "32A1E834-7E27-4F71-9B77-B19FE88A7BFE"

$data[[58]][[3]]
[1] 58

$data[[58]][[4]]
[1] 1.331e+09

$data[[58]][[5]]
[1] "393202"

$data[[58]][[6]]
[1] 1.331e+09

$data[[58]][[7]]
[1] "393202"

$data[[58]][[8]]
[1] "{\n}"

$data[[58]][[9]]
[1] "GWYNNS FLS & GARRISON BLVD"

$data[[58]][[10]]
[1] "W/B"

$data[[58]][[11]]
[1] "Gwynns Falls \n"

$data[[58]][[12]]
[1] "Garrison Blvd"

$data[[58]][[13]]
[1] "Gwynns Falls \n  & Garrison Blvd"

$data[[58]][[14]]
$data[[58]][[14]][[1]]
NULL

$data[[58]][[14]][[2]]
[1] "39.3135792902"

$data[[58]][[14]][[3]]
[1] "-76.6762250182"

$data[[58]][[14]][[4]]
NULL

$data[[58]][[14]][[5]]
[1] FALSE



$data[[59]]
$data[[59]][[1]]
[1] 59

$data[[59]][[2]]
[1] "D393D967-E6DE-45A0-8E0A-D4A0944B4A3D"

$data[[59]][[3]]
[1] 59

$data[[59]][[4]]
[1] 1.331e+09

$data[[59]][[5]]
[1] "393202"

$data[[59]][[6]]
[1] 1.331e+09

$data[[59]][[7]]
[1] "393202"

$data[[59]][[8]]
[1] "{\n}"

$data[[59]][[9]]
[1] "REISTERSTOWN RD & DRUID PARK DR"

$data[[59]][[10]]
[1] "S/B"

$data[[59]][[11]]
[1] "Reistertown Rd\n"

$data[[59]][[12]]
[1] "Druid Lake Drive"

$data[[59]][[13]]
[1] "Reistertown Rd\n  & Druid Lake Drive"

$data[[59]][[14]]
$data[[59]][[14]][[1]]
NULL

$data[[59]][[14]][[2]]
[1] "39.3252867997"

$data[[59]][[14]][[3]]
[1] "-76.6577109834"

$data[[59]][[14]][[4]]
NULL

$data[[59]][[14]][[5]]
[1] FALSE



$data[[60]]
$data[[60]][[1]]
[1] 60

$data[[60]][[2]]
[1] "213CF7B3-291D-4BCD-A546-BFA9C5B158F0"

$data[[60]][[3]]
[1] 60

$data[[60]][[4]]
[1] 1.331e+09

$data[[60]][[5]]
[1] "393202"

$data[[60]][[6]]
[1] 1.331e+09

$data[[60]][[7]]
[1] "393202"

$data[[60]][[8]]
[1] "{\n}"

$data[[60]][[9]]
[1] "POTEE ST & TALBOTT ST"

$data[[60]][[10]]
[1] "S/B"

$data[[60]][[11]]
[1] "Potee\n"

$data[[60]][[12]]
[1] "Talbot"

$data[[60]][[13]]
[1] "Potee\n  & Talbot"

$data[[60]][[14]]
$data[[60]][[14]][[1]]
NULL

$data[[60]][[14]][[2]]
[1] "39.2364856246"

$data[[60]][[14]][[3]]
[1] "-76.6122106478"

$data[[60]][[14]][[4]]
NULL

$data[[60]][[14]][[5]]
[1] FALSE



$data[[61]]
$data[[61]][[1]]
[1] 61

$data[[61]][[2]]
[1] "17388D26-10CC-40C3-B4AF-8F2A32EEB1C5"

$data[[61]][[3]]
[1] 61

$data[[61]][[4]]
[1] 1.331e+09

$data[[61]][[5]]
[1] "393202"

$data[[61]][[6]]
[1] 1.331e+09

$data[[61]][[7]]
[1] "393202"

$data[[61]][[8]]
[1] "{\n}"

$data[[61]][[9]]
[1] "YORK RD & GITTINGS AVE"

$data[[61]][[10]]
[1] "S/B"

$data[[61]][[11]]
[1] "York Rd \n"

$data[[61]][[12]]
[1] "Gitting Ave"

$data[[61]][[13]]
[1] "York Rd \n & Gitting Ave"

$data[[61]][[14]]
$data[[61]][[14]][[1]]
NULL

$data[[61]][[14]][[2]]
[1] "39.3704929583"

$data[[61]][[14]][[3]]
[1] "-76.6098121277"

$data[[61]][[14]][[4]]
NULL

$data[[61]][[14]][[5]]
[1] FALSE



$data[[62]]
$data[[62]][[1]]
[1] 62

$data[[62]][[2]]
[1] "69275CAC-43D1-4AB2-8D79-BAE86F934A49"

$data[[62]][[3]]
[1] 62

$data[[62]][[4]]
[1] 1.331e+09

$data[[62]][[5]]
[1] "393202"

$data[[62]][[6]]
[1] 1.331e+09

$data[[62]][[7]]
[1] "393202"

$data[[62]][[8]]
[1] "{\n}"

$data[[62]][[9]]
[1] "WABASH AVE & W BELVEDERE AVE"

$data[[62]][[10]]
[1] "E/B"

$data[[62]][[11]]
[1] "Wabash \n"

$data[[62]][[12]]
[1] "Belvedere Ave"

$data[[62]][[13]]
[1] "Wabash \n & Belvedere Ave"

$data[[62]][[14]]
$data[[62]][[14]][[1]]
NULL

$data[[62]][[14]][[2]]
[1] "39.3416713553"

$data[[62]][[14]][[3]]
[1] "-76.685042508"

$data[[62]][[14]][[4]]
NULL

$data[[62]][[14]][[5]]
[1] FALSE



$data[[63]]
$data[[63]][[1]]
[1] 63

$data[[63]][[2]]
[1] "02DE24CC-635C-43DB-8CAD-DBCE4B538059"

$data[[63]][[3]]
[1] 63

$data[[63]][[4]]
[1] 1.331e+09

$data[[63]][[5]]
[1] "393202"

$data[[63]][[6]]
[1] 1.331e+09

$data[[63]][[7]]
[1] "393202"

$data[[63]][[8]]
[1] "{\n}"

$data[[63]][[9]]
[1] "E NORTHERN PKWY & YORK RD"

$data[[63]][[10]]
[1] "W/B"

$data[[63]][[11]]
[1] "Northern Pkwy\n"

$data[[63]][[12]]
[1] "York Road"

$data[[63]][[13]]
[1] "Northern Pkwy\n  & York Road"

$data[[63]][[14]]
$data[[63]][[14]][[1]]
NULL

$data[[63]][[14]][[2]]
[1] "39.3651462024"

$data[[63]][[14]][[3]]
[1] "-76.6099220341"

$data[[63]][[14]][[4]]
NULL

$data[[63]][[14]][[5]]
[1] FALSE



$data[[64]]
$data[[64]][[1]]
[1] 64

$data[[64]][[2]]
[1] "1D1589BA-87CF-4AB1-AEA8-86B8AB4EAD7D"

$data[[64]][[3]]
[1] 64

$data[[64]][[4]]
[1] 1.331e+09

$data[[64]][[5]]
[1] "393202"

$data[[64]][[6]]
[1] 1.331e+09

$data[[64]][[7]]
[1] "393202"

$data[[64]][[8]]
[1] "{\n}"

$data[[64]][[9]]
[1] "REISTERSTOWN RD & PATTERSON AVE"

$data[[64]][[10]]
[1] "E/B"

$data[[64]][[11]]
[1] "Reistertown \n"

$data[[64]][[12]]
[1] "Patterson Ave"

$data[[64]][[13]]
[1] "Reistertown \n  & Patterson Ave"

$data[[64]][[14]]
$data[[64]][[14]][[1]]
NULL

$data[[64]][[14]][[2]]
[1] "39.3561820401"

$data[[64]][[14]][[3]]
[1] "-76.7025209585"

$data[[64]][[14]][[4]]
NULL

$data[[64]][[14]][[5]]
[1] FALSE



$data[[65]]
$data[[65]][[1]]
[1] 65

$data[[65]][[2]]
[1] "6CC5DA4F-841F-4C4B-B534-FBC851F87F2F"

$data[[65]][[3]]
[1] 65

$data[[65]][[4]]
[1] 1.331e+09

$data[[65]][[5]]
[1] "393202"

$data[[65]][[6]]
[1] 1.331e+09

$data[[65]][[7]]
[1] "393202"

$data[[65]][[8]]
[1] "{\n}"

$data[[65]][[9]]
[1] "PULASKI HWY & E MONUMENT ST"

$data[[65]][[10]]
[1] "E/B"

$data[[65]][[11]]
[1] "Pulaski Hwy \n"

$data[[65]][[12]]
[1] "Monument St"

$data[[65]][[13]]
[1] "Pulaski Hwy \n  & Monument St"

$data[[65]][[14]]
$data[[65]][[14]][[1]]
NULL

$data[[65]][[14]][[2]]
[1] "39.2997984532"

$data[[65]][[14]][[3]]
[1] "-76.5542506552"

$data[[65]][[14]][[4]]
NULL

$data[[65]][[14]][[5]]
[1] FALSE



$data[[66]]
$data[[66]][[1]]
[1] 66

$data[[66]][[2]]
[1] "C5157063-DDCD-4902-8D03-389EC9EF681D"

$data[[66]][[3]]
[1] 66

$data[[66]][[4]]
[1] 1.331e+09

$data[[66]][[5]]
[1] "393202"

$data[[66]][[6]]
[1] 1.331e+09

$data[[66]][[7]]
[1] "393202"

$data[[66]][[8]]
[1] "{\n}"

$data[[66]][[9]]
[1] "W FRANKLIN ST & N FRANKLINTOWN RD"

$data[[66]][[10]]
[1] "E/B"

$data[[66]][[11]]
[1] "Franklin \n"

$data[[66]][[12]]
[1] "Franklintown Road"

$data[[66]][[13]]
[1] "Franklin \n  & Franklintown Road"

$data[[66]][[14]]
$data[[66]][[14]][[1]]
NULL

$data[[66]][[14]][[2]]
[1] "39.2930857459"

$data[[66]][[14]][[3]]
[1] "-76.6623624871"

$data[[66]][[14]][[4]]
NULL

$data[[66]][[14]][[5]]
[1] FALSE



$data[[67]]
$data[[67]][[1]]
[1] 67

$data[[67]][[2]]
[1] "7EBEF7B1-DCCB-4154-99D1-EAF6CE610C8B"

$data[[67]][[3]]
[1] 67

$data[[67]][[4]]
[1] 1.331e+09

$data[[67]][[5]]
[1] "393202"

$data[[67]][[6]]
[1] 1.331e+09

$data[[67]][[7]]
[1] "393202"

$data[[67]][[8]]
[1] "{\n}"

$data[[67]][[9]]
[1] "S HANOVER ST & E CROMWELL ST"

$data[[67]][[10]]
[1] "S/B"

$data[[67]][[11]]
[1] "Hanover \n"

$data[[67]][[12]]
[1] "Cromwell St"

$data[[67]][[13]]
[1] " &"

$data[[67]][[14]]
$data[[67]][[14]][[1]]
NULL

$data[[67]][[14]][[2]]
[1] "39.2620595495"

$data[[67]][[14]][[3]]
[1] "-76.6145872791"

$data[[67]][[14]][[4]]
NULL

$data[[67]][[14]][[5]]
[1] FALSE



$data[[68]]
$data[[68]][[1]]
[1] 68

$data[[68]][[2]]
[1] "22AE5C10-320D-4940-ADCF-15B5450E0EC4"

$data[[68]][[3]]
[1] 68

$data[[68]][[4]]
[1] 1.331e+09

$data[[68]][[5]]
[1] "393202"

$data[[68]][[6]]
[1] 1.331e+09

$data[[68]][[7]]
[1] "393202"

$data[[68]][[8]]
[1] "{\n}"

$data[[68]][[9]]
[1] "REISTERSTOWN RD & MENLO DR"

$data[[68]][[10]]
[1] "N/B"

$data[[68]][[11]]
[1] "Reisterstown \n"

$data[[68]][[12]]
[1] "Menlo Drive"

$data[[68]][[13]]
[1] "Reisterstown \n & Menlo Drive"

$data[[68]][[14]]
$data[[68]][[14]][[1]]
NULL

$data[[68]][[14]][[2]]
[1] "39.3519849983"

$data[[68]][[14]][[3]]
[1] "-76.6963758159"

$data[[68]][[14]][[4]]
NULL

$data[[68]][[14]][[5]]
[1] FALSE



$data[[69]]
$data[[69]][[1]]
[1] 69

$data[[69]][[2]]
[1] "33945627-3BAF-4B21-A579-6897C037300A"

$data[[69]][[3]]
[1] 69

$data[[69]][[4]]
[1] 1.331e+09

$data[[69]][[5]]
[1] "393202"

$data[[69]][[6]]
[1] 1.331e+09

$data[[69]][[7]]
[1] "393202"

$data[[69]][[8]]
[1] "{\n}"

$data[[69]][[9]]
[1] "RUSSELL ST & BAYARD ST"

$data[[69]][[10]]
[1] "S/B"

$data[[69]][[11]]
[1] "Russell \n"

$data[[69]][[12]]
[1] "Bayard St"

$data[[69]][[13]]
[1] "Russell \n & Bayard St"

$data[[69]][[14]]
$data[[69]][[14]][[1]]
NULL

$data[[69]][[14]][[2]]
[1] "39.2734675536"

$data[[69]][[14]][[3]]
[1] "-76.6287385068"

$data[[69]][[14]][[4]]
NULL

$data[[69]][[14]][[5]]
[1] FALSE



$data[[70]]
$data[[70]][[1]]
[1] 70

$data[[70]][[2]]
[1] "8396BF3C-8BE9-49DD-876B-37AC606B4489"

$data[[70]][[3]]
[1] 70

$data[[70]][[4]]
[1] 1.331e+09

$data[[70]][[5]]
[1] "393202"

$data[[70]][[6]]
[1] 1.331e+09

$data[[70]][[7]]
[1] "393202"

$data[[70]][[8]]
[1] "{\n}"

$data[[70]][[9]]
[1] "LIBERTY HEIGHTS AVE & N DUKELAND ST"

$data[[70]][[10]]
[1] "E/B"

$data[[70]][[11]]
[1] "Liberty Hghts\n"

$data[[70]][[12]]
[1] "Dukeland St"

$data[[70]][[13]]
[1] "Liberty Hghts\n  & Dukeland St"

$data[[70]][[14]]
$data[[70]][[14]][[1]]
NULL

$data[[70]][[14]][[2]]
[1] "39.3226393684"

$data[[70]][[14]][[3]]
[1] "-76.6666335903"

$data[[70]][[14]][[4]]
NULL

$data[[70]][[14]][[5]]
[1] FALSE



$data[[71]]
$data[[71]][[1]]
[1] 71

$data[[71]][[2]]
[1] "6B2EA001-1C90-415B-AEC7-CC51661C66FF"

$data[[71]][[3]]
[1] 71

$data[[71]][[4]]
[1] 1.331e+09

$data[[71]][[5]]
[1] "393202"

$data[[71]][[6]]
[1] 1.331e+09

$data[[71]][[7]]
[1] "393202"

$data[[71]][[8]]
[1] "{\n}"

$data[[71]][[9]]
[1] "S HANOVER & REEDBIRD AVE"

$data[[71]][[10]]
[1] "N/B"

$data[[71]][[11]]
[1] "Hanover \n"

$data[[71]][[12]]
[1] "Reedbird Ave"

$data[[71]][[13]]
[1] "Hanover \n & Reedbird Ave"

$data[[71]][[14]]
$data[[71]][[14]][[1]]
NULL

$data[[71]][[14]][[2]]
[1] "39.2498797679"

$data[[71]][[14]][[3]]
[1] "-76.6137494417"

$data[[71]][[14]][[4]]
NULL

$data[[71]][[14]][[5]]
[1] FALSE



$data[[72]]
$data[[72]][[1]]
[1] 72

$data[[72]][[2]]
[1] "CF8B5E6D-6985-41A2-9193-EC7227EB3DDD"

$data[[72]][[3]]
[1] 72

$data[[72]][[4]]
[1] 1.331e+09

$data[[72]][[5]]
[1] "393202"

$data[[72]][[6]]
[1] 1.331e+09

$data[[72]][[7]]
[1] "393202"

$data[[72]][[8]]
[1] "{\n}"

$data[[72]][[9]]
[1] "W FAYETTE ST & N LIBERTY ST"

$data[[72]][[10]]
[1] "W/B"

$data[[72]][[11]]
[1] "Fayette\n"

$data[[72]][[12]]
[1] "Liberty Heights Ave"

$data[[72]][[13]]
[1] "Fayette\n  & Liberty Heights Ave"

$data[[72]][[14]]
$data[[72]][[14]][[1]]
NULL

$data[[72]][[14]][[2]]
[1] "39.2905038859"

$data[[72]][[14]][[3]]
[1] "-76.617661176"

$data[[72]][[14]][[4]]
NULL

$data[[72]][[14]][[5]]
[1] FALSE



$data[[73]]
$data[[73]][[1]]
[1] 73

$data[[73]][[2]]
[1] "02B0FEB9-3FEB-4066-90F0-1963597FB46C"

$data[[73]][[3]]
[1] 73

$data[[73]][[4]]
[1] 1.331e+09

$data[[73]][[5]]
[1] "393202"

$data[[73]][[6]]
[1] 1.331e+09

$data[[73]][[7]]
[1] "393202"

$data[[73]][[8]]
[1] "{\n}"

$data[[73]][[9]]
[1] "GWYNNS FLS & GARRISON BLVD"

$data[[73]][[10]]
[1] "E/B"

$data[[73]][[11]]
[1] "Gwynns Falls \n"

$data[[73]][[12]]
[1] "Garrison Blvd"

$data[[73]][[13]]
[1] "Gwynns Falls \n  & Garrison Blvd"

$data[[73]][[14]]
$data[[73]][[14]][[1]]
NULL

$data[[73]][[14]][[2]]
[1] "39.3135792902"

$data[[73]][[14]][[3]]
[1] "-76.6762250182"

$data[[73]][[14]][[4]]
NULL

$data[[73]][[14]][[5]]
[1] FALSE



$data[[74]]
$data[[74]][[1]]
[1] 74

$data[[74]][[2]]
[1] "6FCB1B99-355E-452A-AA6A-3EA05BAA4418"

$data[[74]][[3]]
[1] 74

$data[[74]][[4]]
[1] 1.331e+09

$data[[74]][[5]]
[1] "393202"

$data[[74]][[6]]
[1] 1.331e+09

$data[[74]][[7]]
[1] "393202"

$data[[74]][[8]]
[1] "{\n}"

$data[[74]][[9]]
[1] "LOCH RAVEN BLVD & WALKER AVE"

$data[[74]][[10]]
[1] "N/B"

$data[[74]][[11]]
[1] "Loch Raven\n"

$data[[74]][[12]]
[1] "Walker Ave"

$data[[74]][[13]]
[1] "Loch Raven\n  & Walker Ave"

$data[[74]][[14]]
$data[[74]][[14]][[1]]
NULL

$data[[74]][[14]][[2]]
[1] "39.3700602939"

$data[[74]][[14]][[3]]
[1] "-76.5831798122"

$data[[74]][[14]][[4]]
NULL

$data[[74]][[14]][[5]]
[1] FALSE



$data[[75]]
$data[[75]][[1]]
[1] 75

$data[[75]][[2]]
[1] "2CD150A7-08E3-4242-AB97-E59BB79B4701"

$data[[75]][[3]]
[1] 75

$data[[75]][[4]]
[1] 1.331e+09

$data[[75]][[5]]
[1] "393202"

$data[[75]][[6]]
[1] 1.331e+09

$data[[75]][[7]]
[1] "393202"

$data[[75]][[8]]
[1] "{\n}"

$data[[75]][[9]]
[1] "PULASKI HWY & MORAVIA PARK DR"

$data[[75]][[10]]
[1] "W/B"

$data[[75]][[11]]
[1] "\nPulaski Hwy \n"

$data[[75]][[12]]
[1] "Moravia Park Drive"

$data[[75]][[13]]
[1] "\nPulaski Hwy \n & Moravia Park Drive"

$data[[75]][[14]]
$data[[75]][[14]][[1]]
NULL

$data[[75]][[14]][[2]]
[1] "39.3086437141"

$data[[75]][[14]][[3]]
[1] "-76.5323658645"

$data[[75]][[14]][[4]]
NULL

$data[[75]][[14]][[5]]
[1] FALSE



$data[[76]]
$data[[76]][[1]]
[1] 76

$data[[76]][[2]]
[1] "F8C46B03-2E4E-4B32-9A0D-86E196B68A61"

$data[[76]][[3]]
[1] 76

$data[[76]][[4]]
[1] 1.331e+09

$data[[76]][[5]]
[1] "393202"

$data[[76]][[6]]
[1] 1.331e+09

$data[[76]][[7]]
[1] "393202"

$data[[76]][[8]]
[1] "{\n}"

$data[[76]][[9]]
[1] "HILLEN ST & FORREST ST"

$data[[76]][[10]]
[1] "W/B"

$data[[76]][[11]]
[1] "Hillen \n"

$data[[76]][[12]]
[1] "Forrest St"

$data[[76]][[13]]
[1] "Hillen \n & Forrest St"

$data[[76]][[14]]
$data[[76]][[14]][[1]]
NULL

$data[[76]][[14]][[2]]
[1] "39.2968601609"

$data[[76]][[14]][[3]]
[1] "-76.6055317698"

$data[[76]][[14]][[4]]
NULL

$data[[76]][[14]][[5]]
[1] FALSE



$data[[77]]
$data[[77]][[1]]
[1] 77

$data[[77]][[2]]
[1] "426A4CE6-CE98-45D7-A7CC-1B6193475B4F"

$data[[77]][[3]]
[1] 77

$data[[77]][[4]]
[1] 1.331e+09

$data[[77]][[5]]
[1] "393202"

$data[[77]][[6]]
[1] 1.331e+09

$data[[77]][[7]]
[1] "393202"

$data[[77]][[8]]
[1] "{\n}"

$data[[77]][[9]]
[1] "PULASKI HWY & NORTH POINT RD"

$data[[77]][[10]]
[1] "E/B"

$data[[77]][[11]]
[1] "Pulaski \n"

$data[[77]][[12]]
[1] "North Point Blvd"

$data[[77]][[13]]
[1] "Pulaski \n & North Point Blvd"

$data[[77]][[14]]
$data[[77]][[14]][[1]]
NULL

$data[[77]][[14]][[2]]
[1] "39.3043275894"

$data[[77]][[14]][[3]]
[1] "-76.5395800163"

$data[[77]][[14]][[4]]
NULL

$data[[77]][[14]][[5]]
[1] FALSE



$data[[78]]
$data[[78]][[1]]
[1] 78

$data[[78]][[2]]
[1] "46C0FED9-B7F7-4685-96D4-2CEC0982D555"

$data[[78]][[3]]
[1] 78

$data[[78]][[4]]
[1] 1.331e+09

$data[[78]][[5]]
[1] "393202"

$data[[78]][[6]]
[1] 1.331e+09

$data[[78]][[7]]
[1] "393202"

$data[[78]][[8]]
[1] "{\n}"

$data[[78]][[9]]
[1] "N MONROE ST & W LAFAYETTE AVE"

$data[[78]][[10]]
[1] "S/B"

$data[[78]][[11]]
[1] "Monroe\n"

$data[[78]][[12]]
[1] "Lafayette"

$data[[78]][[13]]
[1] "Monroe\n & Lafayette"

$data[[78]][[14]]
$data[[78]][[14]][[1]]
NULL

$data[[78]][[14]][[2]]
[1] "39.2987426878"

$data[[78]][[14]][[3]]
[1] "-76.647517496"

$data[[78]][[14]][[4]]
NULL

$data[[78]][[14]][[5]]
[1] FALSE



$data[[79]]
$data[[79]][[1]]
[1] 79

$data[[79]][[2]]
[1] "0D0A8265-7D37-45BE-94DC-267B1E08C195"

$data[[79]][[3]]
[1] 79

$data[[79]][[4]]
[1] 1.331e+09

$data[[79]][[5]]
[1] "393202"

$data[[79]][[6]]
[1] 1.331e+09

$data[[79]][[7]]
[1] "393202"

$data[[79]][[8]]
[1] "{\n}"

$data[[79]][[9]]
[1] "W MOUNT ROYAL AVE & W NORTH AVE"

$data[[79]][[10]]
[1] "N/B"

$data[[79]][[11]]
[1] "Mt Royal\n"

$data[[79]][[12]]
[1] "North"

$data[[79]][[13]]
[1] "Mt Royal\n & North"

$data[[79]][[14]]
$data[[79]][[14]][[1]]
NULL

$data[[79]][[14]][[2]]
[1] "39.3107672842"

$data[[79]][[14]][[3]]
[1] "-76.6247302963"

$data[[79]][[14]][[4]]
NULL

$data[[79]][[14]][[5]]
[1] FALSE



$data[[80]]
$data[[80]][[1]]
[1] 80

$data[[80]][[2]]
[1] "68D99AD7-B917-41C1-B161-5E73D9BABBD7"

$data[[80]][[3]]
[1] 80

$data[[80]][[4]]
[1] 1.331e+09

$data[[80]][[5]]
[1] "393202"

$data[[80]][[6]]
[1] 1.331e+09

$data[[80]][[7]]
[1] "393202"

$data[[80]][[8]]
[1] "{\n}"

$data[[80]][[9]]
[1] "MOUNT ROYAL TER & W NORTH AVE"

$data[[80]][[10]]
[1] "S/B"

$data[[80]][[11]]
[1] "Mt Royal\n"

$data[[80]][[12]]
[1] "North"

$data[[80]][[13]]
[1] "Mt Royal\n & North"

$data[[80]][[14]]
$data[[80]][[14]][[1]]
NULL

$data[[80]][[14]][[2]]
[1] "39.3108706445"

$data[[80]][[14]][[3]]
[1] "-76.6251255783"

$data[[80]][[14]][[4]]
NULL

$data[[80]][[14]][[5]]
[1] FALSE

```



---

## Writing data - write.table()

* The opposite of read.table
* Important parameters: _x_, _file_, _quote_, _sep_, _row.names_, _col.names_


```r
cameraData <- read.csv("./data/cameras.csv")
tmpData <- cameraData[,-1]
write.table(tmpData,file="./data/camerasModified.csv",sep=",")
cameraData2 <- read.csv("./data/camerasModified.csv")
head(cameraData2)
```

```
  direction      street  crossStreet               intersection
1       N/B   Caton Ave   Benson Ave     Caton Ave & Benson Ave
2       S/B   Caton Ave   Benson Ave     Caton Ave & Benson Ave
3       E/B Wilkens Ave Pine Heights Wilkens Ave & Pine Heights
4       S/B The Alameda      33rd St     The Alameda  & 33rd St
5       E/B      E 33rd  The Alameda      E 33rd  & The Alameda
6       E/B      Erdman     Macon St         Erdman  & Macon St
                       Location.1
1 (39.2693779962, -76.6688185297)
2 (39.2693157898, -76.6689698176)
3  (39.2720252302, -76.676960806)
4 (39.3285013141, -76.5953545714)
5 (39.3283410623, -76.5953594625)
6 (39.3068045671, -76.5593167803)
```



--- 

## Writing data - save(), save.image()


* save is used to save R objects
* Important parameters: _list of objects_, _file_
* save.image saves everything in your working directory


```r
cameraData <- read.csv("./data/cameras.csv")
tmpData <- cameraData[,-1]
save(tmpData,cameraData,file="./data/cameras.rda")
```



---

## Reading saved data - load()

* Opposite of save()
* Important parameters: _file_


```r
# Remove everything from the workspace
rm(list=ls())
ls()
```

```
character(0)
```

```r

# Load data 
load("./data/cameras.rda")
ls()
```

```
[1] "cameraData" "tmpData"   
```



---

## paste() and paste0()

* These functions are for pasting character strings together. 
* Important parameters: _list of text strings_, _sep_
* paste0() is the same as paste but with _sep=""_
* Great for looping over files
* See also [file.path](http://stat.ethz.ch/R-manual/R-patched/library/base/html/file.path.html)


```r
for(i in 1:5){
  fileName = paste0("./data",i,".csv")
  print(fileName)
}
```

```
[1] "./data1.csv"
[1] "./data2.csv"
[1] "./data3.csv"
[1] "./data4.csv"
[1] "./data5.csv"
```





---

## Getting data off webpages 

<img class=center src=assets/img/googlescholar.png height='80%'/>

[http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en](http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en)

---

## Getting data off webpages



```r
library(XML)
con = url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en")
htmlCode = readLines(con)
close(con)
htmlCode
```

```
[1] "<!DOCTYPE html><html><head><title>Jeff Leek - Google Scholar Citations</title><meta name=\"robots\" content=\"noarchive\"><meta http-equiv=\"Content-Type\" content=\"text/html;charset=ISO-8859-1\"><meta http-equiv=\"X-UA-Compatible\" content=\"IE=Edge\"><meta name=\"format-detection\" content=\"telephone=no\"><link rel=\"canonical\" href=\"http://scholar.google.com/citations?user=HI-I6C0AAAAJ&amp;hl=en\"><style type=\"text/css\" media=\"screen, projection\">html,body,form,table,div,h1,h2,h3,h4,h5,h6,img,ol,ul,li,button{margin:0;padding:0;border:0;}table{border-collapse:collapse;border-width:0;empty-cells:show;}#gs_top{position:relative;min-width:980px;_width:expression(document.documentElement.clientWidth<982?\"980px\":\"auto\");}.gs_el_ph #gs_top,.gs_el_ta #gs_top{min-width:300px;_width:expression(document.documentElement.clientWidth<302?\"300px\":\"auto\");}body,td{font-size:13px;font-family:Arial,sans-serif;line-height:1.24}body{background:#fff;color:#222;-webkit-text-size-adjust:100%;-moz-text-size-adjust:none;}.gs_gray{color:#777777}.gs_red{color:#dd4b39}.gs_grn{color:#3d9400}.gs_lil{font-size:11px}.gs_med{font-size:16px}.gs_hlt{font-weight:bold;}a:link,a:visited{color:#1155cc;text-decoration:none}a:hover,a:active,a:hover .gs_lbl,a:active .gs_lbl,a .gs_lbl:active{text-decoration:underline;outline:none;}a:active,a:active .gs_lbl,a .gs_lbl:active{color:#d14836}a:visited{color:#6611cc}.gs_a,.gs_a a:link,.gs_a a:visited{color:#009933}.gs_a a:active{color:#d14836}a.gs_fl:link,.gs_fl a:link{color:#1155cc}a.gs_fl:visited,.gs_fl a:visited{color:#6611cc}a.gs_fl:active,.gs_fl a:active{color:#d14836}.gs_fl{color:#767676}.gs_ctc,.gs_ctu{font-size:11px;font-weight:bold}.gs_ctc{color:#1122cc}.gs_ctg,.gs_ctg2{font-size:13px;font-weight:bold}.gs_ctg{color:#1155cc}a.gs_pda,.gs_pda a{padding:7px 0 5px 0}a:hover{*background-position:0 0}a:active{*background-attachment:fixed}.gs_alrt{background:#f9edbe;border:1px solid #f0c36d;padding:0 16px;text-align:center;-webkit-box-shadow:0 2px 4px rgba(0,0,0,.2);-moz-box-shadow:0 2px 4px rgba(0,0,0,.2);box-shadow:0 2px 4px rgba(0,0,0,.2);-webkit-border-radius:2px;-moz-border-radius:2px;border-radius:2px;}.gs_spc{display:inline-block;width:12px}.gs_br{width:0;font-size:0}.gs_ibl{display:inline-block;*display:inline;zoom:1;}.gs_ico{display:inline-block;background:no-repeat url(/intl/en/scholar/images/sprite.png);_background-image:url(/intl/en/scholar/images/sprite.gif);width:21px;height:21px;font-size:0;}.gs_el_ta .gs_nta{display:none}.gs_el_ph .gs_nph{display:none}.gs_oph{display:none}.gs_el_ph .gs_oph{display:inline}.gs_el_ph div.gs_oph{display:block}#gs_ftr{width:650px;margin-top:1em;text-align:center;clear:both;}.gs_el_ta #gs_ftr,.gs_el_ph #gs_ftr{width:auto;max-width:600px;_width:expression(document.documentElement.clientWidth>616?\"600px\":\"auto\");}#gs_ftr a{display:inline-block;margin:0 12px;line-height:29px;}#gs_ftr a:link,#gs_ftr a:visited{color:#1155cc}#gs_ftr a:active{color:#d14836}button{position:relative; z-index:1; -moz-box-sizing:border-box;-webkit-box-sizing:border-box;box-sizing:border-box;font-size:11px;font-weight:bold;cursor:default;height:29px;min-width:72px;_width:72px;overflow:visible;color:#444;border:1px solid #dcdcdc;border:1px solid rgba(0,0,0,.1);-webkit-border-radius:2px;-moz-border-radius:2px;border-radius:2px;text-align:center;background-color:#f5f5f5;background-image:-webkit-gradient(linear,left top,left bottom,from(#f5f5f5),to(#f1f1f1));background-image:-webkit-linear-gradient(top,#f5f5f5,#f1f1f1);background-image:-moz-linear-gradient(top,#f5f5f5,#f1f1f1);background-image:-o-linear-gradient(top,#f5f5f5,#f1f1f1);background-image:linear-gradient(to bottom,#f5f5f5,#f1f1f1);-webkit-transition:all .218s;-moz-transition:all .218s;-o-transition:all .218s;transition:all .218s;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;}button .gs_wr{line-height:27px;_line-height:24px;}button .gs_bg{position:absolute;top:0;left:0;width:100%;height:100%;*display:none;z-index:-1;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f5f5f5',endColorstr='#f1f1f1');}button.gs_btn_mini{min-width:26px;_width:26px;height:26px;}.gs_btn_mini .gs_wr{line-height:24px;_line-height:21px;}button:hover,button.gs_hvr{z-index:2;color:#222;border:1px solid #c6c6c6;-webkit-box-shadow:0px 1px 1px rgba(0,0,0,.1);-moz-box-shadow:0px 1px 1px rgba(0,0,0,.1);box-shadow:0px 1px 1px rgba(0,0,0,.1);background-color:#f8f8f8;background-image:-webkit-gradient(linear,left top,left bottom,from(#f8f8f8),to(#f1f1f1));background-image:-webkit-linear-gradient(top,#f8f8f8,#f1f1f1);background-image:-moz-linear-gradient(top,#f8f8f8,#f1f1f1);background-image:-o-linear-gradient(top,#f8f8f8,#f1f1f1);background-image:linear-gradient(to bottom,#f8f8f8,#f1f1f1);-webkit-transition:all 0s;-moz-transition:all 0s;-o-transition:all 0s;transition:all 0s;}button:hover .gs_bg,button.gs_hvr .gs_bg{filter:progid:DXImageTransform.Microsoft.gradient(startColorStr='#f8f8f8',EndColorStr='#f1f1f1');}button:active,button.gs_act{z-index:2;color:#333;background-color:#f6f6f6;background-image:-webkit-gradient(linear,left top,left bottom,from(#f6f6f6),to(#f1f1f1));background-image:-webkit-linear-gradient(top,#f6f6f6,#f1f1f1);background-image:-moz-linear-gradient(top,#f6f6f6,#f1f1f1);background-image:-o-linear-gradient(top,#f6f6f6,#f1f1f1);background-image:linear-gradient(to bottom,#f6f6f6,#f1f1f1);-webkit-box-shadow:inset 0px 1px 2px rgba(0,0,0,.1);-moz-box-shadow:inset 0px 1px 2px rgba(0,0,0,.1);box-shadow:inset 0px 1px 2px rgba(0,0,0,.1);}button:active .gs_bg,button.gs_act .gs_bg{filter:progid:DXImageTransform.Microsoft.gradient(startColorStr='#f6f6f6',EndColorStr='#f1f1f1');}button:focus,button.gs_fcs{z-index:2;outline:none;border:1px solid #4d90fe;}button::-moz-focus-inner{padding:0;border:0}button .gs_lbl{padding:0px 8px;}a.gs_in_ib{position:relative;display:inline-block;line-height:27px;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;}a.gs_btn_mini{height:24px;line-height:24px;}a .gs_lbl,button .gs_lbl{vertical-align:baseline;}a.gs_in_ib .gs_lbl{padding-left:21px}button.gs_in_ib .gs_lbl{padding-left:29px;}button.gs_btn_mini .gs_lbl,button.gs_btn_eml .gs_lbl{padding:11px;}.gs_in_ib .gs_ico{position:absolute;top:2px;*top:3px;left:8px;}.gs_btn_mini .gs_ico{top:1px;*top:2px;left:2px;}.gs_btn_eml .gs_ico{left:25px}button.gs_btn_mini,.gs_btn_eml{_font-size:0}a.gs_in_ib .gs_ico{top:3px;left:0}a.gs_btn_mini .gs_ico{top:1px;left:0}button.gs_btn_act{color:#fff;-webkit-font-smoothing:antialiased;border:1px solid #3079ed;background-color:#4d90fe;background-image:-webkit-gradient(linear,left top,left bottom,from(#4d90fe),to(#4787ed));background-image:-webkit-linear-gradient(top,#4d90fe,#4787ed);background-image:-moz-linear-gradient(top,#4d90fe,#4787ed);background-image:-o-linear-gradient(top,#4d90fe,#4787ed);background-image:linear-gradient(to bottom,#4d90fe,#4787ed);}button.gs_btn_act .gs_bg{filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#4d90fe',endColorstr='#4787ed');}button.gs_btn_act:hover,button.gs_btn_act-gs_hvr{color:#fff;border:1px solid #2f5bb7;background-color:#357ae8;background-image:-webkit-gradient(linear,left top,left bottom,from(#4d90fe),to(#357ae8));background-image:-webkit-linear-gradient(top,#4d90fe,#357ae8);background-image:-moz-linear-gradient(top,#4d90fe,#357ae8);background-image:-o-linear-gradient(top,#4d90fe,#357ae8);background-image:linear-gradient(to bottom,#4d90fe,#357ae8);-webkit-box-shadow:inset 0px 1px 1px rgba(0,0,0,.1);-moz-box-shadow:inset 0px 1px 1px rgba(0,0,0,.1);box-shadow:inset 0px 1px 1px rgba(0,0,0,.1);}button.gs_btn_act:hover .gs_bg,button.gs_btn_act-gs_hvr .gs_bg{filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#4d90fe',endColorstr='#357ae8');}button.gs_btnG{width:70px;min-width:0;}button.gs_btn_act:focus{-webkit-box-shadow:inset 0 0 0 1px rgba(255,255,255,.5);-moz-box-shadow:inset 0 0 0 1px rgba(255,255,255,.5);box-shadow:inset 0 0 0 1px rgba(255,255,255,.5);}button.gs_btn_act:focus,button.gs_btn_act-gs_fcs{border-color:#404040;}button.gs_btn_act:active,button.gs_btn_act-gs_act{border:1px solid #315da3;background-color:#2f6de1;background-image:-webkit-gradient(linear,left top,left bottom,from(#4d90fe),to(#2f6de1));background-image:-webkit-linear-gradient(top,#4d90fe,#2f6de1);background-image:-moz-linear-gradient(top,#4d90fe,#2f6de1);background-image:-o-linear-gradient(top,#4d90fe,#2f6de1);background-image:linear-gradient(to bottom,#4d90fe,#2f6de1);}button.gs_btn_act:active .gs_bg,button.gs_btn_act-gs_act .gs_bg{filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#4d90fe',endColorstr='#2f6de1');}button.gs_btn_act:active{-webkit-box-shadow:inset 0 1px 2px rgba(0,0,0,.3);-moz-box-shadow:inset 0 1px 2px rgba(0,0,0,.3);box-shadow:inset 0 1px 2px rgba(0,0,0,.3);}.gs_ttp{position:absolute;top:100%;right:50%;z-index:10;pointer-events:none;visibility:hidden;opacity:0;-webkit-transition:visibility 0s .13s,opacity .13s ease-out;-moz-transition:visibility 0s .13s,opacity .13s ease-out;-o-transition:visibility 0s .13s,opacity .13s ease-out;transition:visibility 0s .13s,opacity .13s ease-out;}button:hover .gs_ttp,button.gs_hvr .gs_ttp,button:focus .gs_ttp,button.gs_fcs .gs_ttp,a:hover .gs_ttp,a:focus .gs_ttp{-webkit-transition:visibility 0s .3s,opacity .13s ease-in .3s;-moz-transition:visibility 0s .3s,opacity .13s ease-in .3s;-o-transition:visibility 0s .3s,opacity .13s ease-in .3s;transition:visibility 0s .3s,opacity .13s ease-in .3s;visibility:visible;opacity:1;}.gs_ttp .gs_aro,.gs_ttp .gs_aru{position:absolute;top:-2px;right:-5px;width:0;height:0;line-height:0;font-size:0;border:5px solid transparent;_border:5px solid #f5f5f5;border-top:none;border-bottom-color:#2a2a2a;z-index:1;}.gs_ttp .gs_aro{top:-3px;border-size:6px;border-top:none;border-bottom-color:white;}.gs_ttp .gs_txt{display:block;position:relative;top:2px;right:-50%;padding:7px 9px;background:#2a2a2a;color:white;font-size:11px;font-weight:bold;line-height:normal;white-space:nowrap;border:1px solid white;-webkit-box-shadow:inset 0 1px 4px rgba(0,0,0,.2);-moz-box-shadow:inset 0 1px 4px rgba(0,0,0,.2);box-shadow:inset 0 1px 4px rgba(0,0,0,.2);}.gs_in_se .gs_lbl{padding-left:8px;padding-right:22px;}.gs_in_se .gs_ico{position:absolute;top:8px;right:8px;width:7px;height:11px;margin:0;background-position:-63px -115px;}.gs_in_se:hover .gs_ico,.gs_in_se-gs_hvr .gs_ico{background-position:-166px -110px;}.gs_in_se:active .gs_ico,.gs_in_se .gs_ico:active,.gs_in_se.gs_in_se-gs_act .gs_ico{background-position:-89px -26px;}.gs_in_se :active~.gs_ico{background-position:-89px -26px;}.gs_md_se,.gs_md_wn,.gs_el_ph .gs_md_wp{position:absolute;top:0;left:0;border:1px solid #ccc;border-color:rgba(0,0,0,.2);background:white;-webkit-box-shadow:0px 2px 4px rgba(0,0,0,.2);-moz-box-shadow:0px 2px 4px rgba(0,0,0,.2);box-shadow:0px 2px 4px rgba(0,0,0,.2);z-index:1100; display:none;}.gs_md_se{white-space:nowrap}.gs_md_se ul{list-style-type:none;display:inline-block;*display:inline;zoom:1;vertical-align:top;}.gs_md_se li,.gs_md_li,.gs_md_li:link,.gs_md_li:visited{display:block;padding:6px 16px;padding-right:44px;font-size:13px;line-height:16px;color:#222;cursor:default;text-decoration:none;background:white;-moz-transition:background .13s;-o-transition:background .13s;-webkit-transition:background .13s;transition:background .13s;}a.gs_md_li:hover .gs_lbl,a.gs_md_li:active .gs_lbl{text-decoration:none}.gs_el_tc .gs_md_se li,.gs_el_tc .gs_md_li{padding-top:14px;padding-bottom:10px;}.gs_md_se li:hover,.gs_md_se li.gs_hvr,.gs_md_se li.gs_sel,.gs_md_li:hover{background:#f1f1f1;-moz-transition:background 0s;-o-transition:background 0s;-webkit-transition:background 0s;transition:background 0s;}button.gs_btnG .gs_ico{width:14px;height:13px;top:7px;left:27px;background-position:-152px -68px;_background:transparent;_filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='/intl/en/scholar/images/sprite/search-shared.png');}p,dl,dt,dd,caption,tbody,tfoot,thead,tr,th,td,fieldset{margin:0;padding:0;border:0}body {font-size:62.5%;color:#000;}#gs_top {padding:3px 8px;min-width:none;width:auto}a:link,a:visited {color:#00c;}a:active {color:red}ul {padding:0 0 1em 1em}ol {padding:0 0 1em 1.3em}li {line-height:1.5em;padding:0 0 .5em 0}p {padding:0 0 1em 0}h1,h2,h3,h4,h5 {padding:0 0 1em 0}h1,h2 {font-size:1.3em}h3 {font-size:1.1em}h4,h5,table {font-size:1em}sup,sub {font-size:.7em}input,select,textarea,option{font-family:inherit;font-size:inherit}.g-doc,.g-doc-1024,.g-doc-800 {font-size:130%}.g-doc {width:100%;text-align:left}.g-section:after {content:\".\";display:block;height:0;clear:both;visibility:hidden}.g-unit .g-section:after {clear:none}.g-unit .g-section {width:100%;overflow:hidden}.g-section,.g-unit {zoom:1}.g-split .g-unit {text-align:right}.g-split .g-first {text-align:left}.g-tpl-50-50 .g-unit,.g-unit .g-tpl-50-50 .g-unit,.g-unit .g-unit .g-tpl-50-50 .g-unit,.g-unit .g-unit .g-unit .g-tpl-50-50 .g-unit {width:49.999%;float:right;display:inline;margin:0}.g-unit .g-unit .g-unit .g-tpl-50-50 .g-first,.g-unit .g-unit .g-tpl-50-50 .g-first,.g-unit .g-tpl-50-50 .g-first,.g-tpl-50-50 .g-first {width:49.999%;float:left;display:inline;margin:0}.g-tpl-50-50-alt .g-unit,.g-unit .g-tpl-50-50-alt .g-unit,.g-unit .g-unit .g-tpl-50-50-alt .g-unit,.g-unit .g-unit .g-unit .g-tpl-50-50-alt .g-unit {width:49.999%;float:left;display:inline;margin:0}.g-unit .g-unit .g-unit .g-tpl-50-50-alt .g-first,.g-unit .g-unit .g-tpl-50-50-alt .g-first,.g-unit .g-tpl-50-50-alt .g-first,.g-tpl-50-50-alt .g-first {width:49.999%;float:right;display:inline;margin:0}.g-tpl-nest .g-unit,.g-unit .g-tpl-nest .g-unit,.g-unit .g-unit .g-tpl-nest .g-unit,.g-unit .g-unit .g-unit .g-tpl-nest .g-unit {float:left;width:auto;display:inline;margin:0}.g-tpl-nest-alt .g-unit,.g-unit .g-tpl-nest-alt .g-unit,.g-unit .g-unit .g-tpl-nest-alt .g-unit,.g-unit .g-unit .g-unit .g-tpl-nest-alt .g-unit {float:right;width:auto;display:inline;margin:0}.g-doc-1024 {width:73.074em;min-width:950px;margin:0 auto;text-align:left}.cit-bluegray, .cit-bluegray:visited {color: #77c;}.cit-gray {color: #666;}table.cit-bodytable {width: 100%;}td.cit-contentcell {vertical-align: top;}.cit-body b {background:#9fd9a7;display:block;height:1px;overflow:hidden;margin:0 2px;font-size:1px;line-height:1px;}.cit-body i {background:#9fd9a7;display:block;height:1px;overflow:hidden;margin:0 1px;font-size:1px;line-height:1px;}.cit-messagebox {text-align: center;}.cit-messagebox b {background: #fff1a8;display:block;height:1px;overflow:hidden;margin:0 2px;font-size:1px;line-height:1px;}.cit-messagebox i {background: #fff1a8;display:block;height:1px;overflow:hidden;margin:0 1px;font-size:1px;line-height:1px;}.cit-messagebox a {color: #00c;}.cit-messagebox.reqfield {text-align: left;padding: 0 0 0 0;color: #000;}.cit-messagebox table {display: inline;text-align: center;}.cit-messagebox div#message_text {background: #fff1a8;padding: 0.1em 0.5em;font-weight: bold;}.cit-actionbar {background: #9fd9a7;padding: 0.3em 0.6em;}.cit-actionbar.pagination {padding: 0 0 0 0;float: right;}.cit-fieldrows {padding-top: 0.5em;}.g-tpl-200 .g-unit,.g-unit .g-tpl-200 .g-unit,.g-unit .g-unit .g-tpl-200 .g-unit,.g-unit .g-unit .g-unit .g-tpl-200 .g-unit {display: block;margin: 0 0 0 200px;width: auto;float: none;}.g-unit .g-unit .g-unit .g-tpl-200 .g-first,.g-unit .g-unit .g-tpl-200 .g-first,.g-unit .g-tpl-200 .g-first,.g-tpl-200 .g-first {display: block;margin: 0;width: 200px;float: left;}.cit-near-box {background-color: #FFC;position: absolute;z-index: 1;/* more padding on right makes \"close window\" img prettier */padding: 5px 20px 5px 5px;border: 1px solid #CCC;}/* rounded corner outside */div.cit-rco {display:block;height:1px;overflow:hidden;margin:0 2px;font-size:1px;line-height:1px;}/* rounded corner inside */div.cit-rci {display:block;height:1px;overflow:hidden;margin:0 1px;font-size:1px;line-height:1px;}/* light blue background */.cit-lbb {background-color:#E8F4F7;}/* dark green background */.cit-dgb {background-color:#9FD9A7;}/* light green background */.cit-lgb {background-color:#DCF6DB;}.cit-dark-link {text-decoration: none;}.cit-light-link,.cit-light-link:visited {text-decoration: none;color: #4272db;}.cit-bg-link,.cit-bg-link:visited {text-decoration: none;color: #77c;}.cit-dark-large-link {font-size: 120%;text-decoration: none;}.cit-lclgs {padding-left: 1em;padding-top: 0.33em;padding-bottom: 0.33em;border-right: 2px solid #9fd9a7;}.cit-lclgsr {float: right;padding-right: 1em;}.cit-lclgsc {margin-top: 0.6em;float: left;}.cit-scdel {margin-top: 0.6em;margin-bottom: 0.6em;}/* Used for profile photo and name/affiliation */.g-tpl-150 .g-unit,.g-unit .g-tpl-150 .g-unit,.g-unit .g-unit .g-tpl-150 .g-unit,.g-unit .g-unit .g-unit .g-tpl-150 .g-unit {display: block;margin: 0 0 0 150px;width: auto;float: none;}.g-unit .g-unit .g-unit .g-tpl-150 .g-first,.g-unit .g-unit .g-tpl-150 .g-first,.g-unit .g-tpl-150 .g-first,.g-tpl-150 .g-first {display: block;margin: 0;width: 150px;float: left;}.g-tpl-100 .g-unit,.g-unit .g-tpl-100 .g-unit,.g-unit .g-unit .g-tpl-100 .g-unit,.g-unit .g-unit .g-unit .g-tpl-100 .g-unit {display: block;margin: 0 0 0 100px;width: auto;float: none;}.g-unit .g-unit .g-tpl-100 .g-first,.g-unit .g-unit .g-unit .g-tpl-100 .g-first,.g-unit .g-tpl-100 .g-first, .g-tpl-100 .g-first {display: block;margin: 0;width: 100px;float: left;}.cit-photo-placeholder {text-align: center;}.cit-photo {padding: 1px;border: solid #9fd9a7 1px;vertical-align: top;}.cit-definition {font-size: 1em;padding: 1em;}.cit-definition.emphasis {font-style: italic;}/* BEGIN used for in-place editing */#cit-name-display,#cit-name-input {font-size: 32px;}#cit-name-input {background-color: #FFFFCC;}#cit-affiliation-input,#cit-int-input,#cit-domain-input,#cit-homepage-input {background-color: #FFFFCC;font-size: 120%}#cit-affiliation-display,#cit-int-display,#cit-domain-display,#cit-publish-display,#cit-homepage-display {font-size: 120%;}#cit-name-input {width: 10em;}#cit-affiliation-input,#cit-int-input,#cit-domain-input,#cit-homepage-input {width: 25em;}.cit-in-place-hover {background-color: #FFC;border: 1px solid #CCC;}.cit-in-place-nohover {background-color: auto;border: 1px solid white;}.cit-inplaceaction, cit-inplaceaction:visited {font-size: 0.85em;text-decoration: none;color: #4272db;}.cit-inplaceform {padding: 1px;}/* END used for in-place editing */.cit-user-info {margin-top: 8px;}/* 250px alt *//* Right-column on myworks page. */.g-tpl-250-alt .g-unit,.g-unit .g-tpl-250-alt .g-unit,.g-unit .g-unit .g-tpl-250-alt .g-unit,.g-unit .g-unit .g-unit .g-tpl-250-alt .g-unit {margin: 0 250px 0 0;width: auto;float: none;}.g-unit .g-unit .g-unit .g-tpl-250-alt .g-first,.g-unit .g-unit .g-tpl-250-alt .g-first,.g-unit .g-tpl-250-alt .g-first,.g-tpl-250-alt .g-first {margin: 0;width: 250px;float: right;}.cit-table {width: 100%;}.cit-table.header {background: #dcf6db;}.cit-table.header td {padding-top: 0.3em;padding-bottom: 0.3em;border-top: 1px solid #AAA;}.cit-table.item {background: #e8f4f7;}.cit-table.item td {padding: 0.2em 0.5em 0.2em 0;}.cit-table.item td#col-year a {text-decoration: none;color: black;}#col-select,#col-citelink,#col-title,#col-citedby,#col-asterisk,#col-year,#col-choose {border-bottom: 1px solid #AAA;}#col-citedby {text-align:right;width:60px;}#col-year {text-align:center;width:50px;}#col-select {padding-right: 0;}#col-citelink {width: 4em;padding-right: 1em;}#col-title {padding-left: 0.5em;}table#stats {border-color: #aaa;border-width: 0 0 1px 1px;border-style: solid;margin: auto;}table#stats tr td {border-color: #aaa;border-width: 1px 1px 0 0;border-style: solid;padding: 0.2em 0.2em;}table#stats tr td.cit-caption {text-align: left;}table#stats tr.cit-headerrow td,table#stats tr td.cit-data {text-align: center;}</style><script type=\"text/javascript\">function citGetById(id) {return document.getElementById(id);}function citHide(id) {var elem = citGetById(id);if (!elem) return;elem.style.display = \"none\";return false;}function citShow(id, type) {var elem = citGetById(id);if (!elem) return;elem.style.display = type;return false;}function citSubmit(id) {var form = citGetById(id);if (form) form.submit();return false;}function citFocus(id) {var elem = citGetById(id);if (!elem) return;elem.focus();return false;}function citGo(url) {window.location = url;}function citOnActionsSelect(id, add_url, list_trash_url,list_updates_url) {var select = citGetById(id);if (!select) {return;}if (select.value == \"add_opt\") {citGo(add_url);} else if (select.value == \"list_trash_opt\") {citGo(list_trash_url);} else if (select.value == \"list_updates_opt\") {citGo(list_updates_url);} else {citSubmit(\"citationsForm\");}}function citToggleElem(id, displaytype) {var elem = citGetById(id);if (!elem) return;if (elem.style.display == displaytype) {elem.style.display = \"none\";} else {elem.style.display = displaytype;}return false;}function citClearTextHint(id, hint) {var elem = citGetById(id);if (!elem) return;if (elem.style.color == \"gray\" && elem.value == hint) {elem.value = \"\";elem.style.color = \"black\";} else if (elem.style.color == \"gray\" && elem.value != hint) {elem.style.color = \"black\";}return false;}function citSetTextHint(id, hint) {var elem = citGetById(id);if (!elem) return;if (elem.style.color == \"black\" && elem.value == \"\") {elem.value = hint;elem.style.color = \"gray\";}return false;}function citShowNearBox(near_me, message, vurl, vtext, hurl, htext) {var box = citGetById(\"cit-near-box\");if (!box) {box = document.createElement(\"div\");box.setAttribute(\"id\", \"cit-near-box\");box.setAttribute(\"class\", \"cit-near-box\");near_me.parentNode.appendChild(box);}box.innerHTML = message + \" (<a href=\\\"\" + vurl + \"\\\">\" + vtext + \"</a> - <a href=\\\"\" + hurl + \"\\\">\" + htext + \"</a>)  <img onclick=\\\"citHideNearBox()\\\" style=\\\"position: absolute; top:2px; right: 2px;\\\" src=\\\"/citations/images/remove.gif\\\"/>\";box.style.display = \"block\";}function citHideNearBox() {var box = citGetById(\"cit-near-box\");if (box) {box.style.display = \"none\";box.parentNode.removeChild(box);}}function citToggleNearBox(near_me, message, vurl, vtext, hurl, htext) {var box = citGetById(\"cit-near-box\");if (box &&box.style.display == \"block\" &&near_me.parentNode == box.parentNode) {citHideNearBox();} else {citHideNearBox();citShowNearBox(near_me, message, vurl, vtext, hurl, htext);}}function citMessageDisplay(msgBox, display) {if (!msgBox) return;try {msgBox.style.visibility = display;} catch (ex) {msgBox.setAttribute(\"style\", \"visibility: \" + display);}}function citSelectAll() {var form = citGetById(\"citationsForm\");for (var i = 0; i < form.elements.length; i++) {if (form.elements[i].type != \"checkbox\") continue;form.elements[i].checked = true;}}function citSelectNone() {var form = citGetById(\"citationsForm\");for (var i = 0; i < form.elements.length; i++) {if (form.elements[i].type != \"checkbox\") continue;form.elements[i].checked = false;}}function citInPlaceMouseOver(field) {citGetById(\"cit-\" + field + \"-display\").className = \"cit-in-place-hover\";}function citInPlaceMouseOut(field) {citGetById(\"cit-\" + field + \"-display\").className = \"cit-in-place-nohover\";}function citInPlaceResetAndEdit(field) {citInPlaceReset(field);citInPlaceEdit(field);}function citGetTextContent(id) {var elem = citGetById(id);if (!elem) return \"\";if (elem.innerText != undefined) {/* IE, Safari, Chrome, Opera */return elem.innerText;} else if (elem.textContent) {/* IE9, Firefox, Safari, Chrome, Opera */return elem.textContent;}return \"\";}function citInPlaceReset(field) {/* Reset the edit field to the current value. */if (field == \"int\" || field == \"domain\" || field == \"homepage\") {var currval = citGetTextContent(\"cit-\" + field + \"-prefill\");} else {var currval = citGetTextContent(\"cit-\" + field + \"-display\");}var input = citGetById(\"cit-\" + field + \"-input\");input.value = currval;}function citInPlaceEdit(field) {/* Hide display field and show input box. */citHide(\"cit-\" + field + \"-read\");citShow(\"cit-\" + field + \"-write\", \"inline\");var input = citGetById(\"cit-\" + field + \"-input\");if (input) input.focus();}function citInPlaceShow(field) {citHide(\"cit-\" + field + \"-read\");citShow(\"cit-\" + field + \"-write\", \"inline\");}function citInPlaceCancel(field) {/* Hide input box and show display field. */citHide(\"cit-\" + field + \"-write\");citShow(\"cit-\" + field + \"-read\", \"inline\");}function citToggleIndexDef(id) {var index_def = citGetById(id);if (!index_def) return;if (index_def.style.display &&index_def.style.display == \"block\") {citHideAllIndexDefs();} else {citHideAllIndexDefs();citShow(id, \"block\");}return false;}function citHideAllIndexDefs() {citHide('h_index_definition');citHide('i_ten_index_definition');citHide('total_citations_definition');citHide('h5_index_definition');citHide('h5_median_definition');return false;}function citMessageBox(messageBox, messageText) {this.messageBox = citGetById(messageBox);this.messageText = citGetById(messageText);this.timeoutId = null;}citMessageBox.prototype.hideMessage = function () {citMessageDisplay(this.messageBox, \"hidden\");};citMessageBox.prototype.showMessage = function (newText) {if (!newText) {this.hideMessage();} else {this.messageText.innerHTML = newText;citMessageDisplay(this.messageBox, \"visible\");this.setHideMessageTimeout();}};citMessageBox.prototype.setHideMessageTimeout = function () {this.cancelHideMessageTimeout();var _self = this;this.timeoutId = setTimeout(function () {_self.hideMessage();}, 60000);};citMessageBox.prototype.cancelHideMessageTimeout = function () {try {clearTimeout(this.timeoutId);} catch (ex) {/* Don't care. */}this.timeoutId = null;};var citGCMessageBox;function citInitGlobals() {citGCMessageBox = new citMessageBox(\"message_box\", \"message_text\");var showMsg = citGetById(\"cit-show-msg\");var shownMsg = citGetById(\"cit-shown-msg\");if (showMsg && showMsg.value && !(shownMsg && shownMsg.value)) {if (shownMsg) shownMsg.value = \"1\";citMessageDisplay(citGCMessageBox.messageBox, \"visible\");citGCMessageBox.setHideMessageTimeout();}if (window.addEventListener) {window.addEventListener(\"unload\", function() { citGCMessageBox.hideMessage(); }, false);} else if (window.attachEvent) {window.attachEvent(\"onunload\", function() {citGCMessageBox.hideMessage(); });}}if (window.addEventListener) {window.addEventListener(\"load\", citInitGlobals, false);} else if (window.attachEvent) {window.attachEvent(\"onload\", citInitGlobals);}</script><script>var gs_ie_ver=100;</script><!--[if IE 6]><script>gs_ie_ver=6;</script><![endif]--><!--[if IE 7]><script>gs_ie_ver=7;</script><![endif]--><!--[if IE 8]><script>gs_ie_ver=8;</script><![endif]--><script>function gs_id(i){return document.getElementById(i)}function gs_ch(e,t){return e?e.getElementsByTagName(t):[]}function gs_xatr(e,a,v){e.setAttribute(a,v)}function gs_uatr(e,a){e.removeAttribute(a)}function gs_uas(s){return (navigator.userAgent||\"\").indexOf(s)>=0}var gs_is_tc=/[?&]tc=([01])/.exec(window.location.search||\"\");if(gs_is_tc){gs_is_tc=parseInt(gs_is_tc[1]);}else if(window.matchMedia&&matchMedia(\"(pointer),(-moz-touch-enabled),(-moz-touch-enabled:0)\").matches){gs_is_tc=matchMedia(\"(pointer:coarse),(-moz-touch-enabled)\").matches;}else{gs_is_tc=gs_uas(\"iPhone\")||gs_uas(\"iPod\")||gs_uas(\"iPad\")||gs_uas(\"Android\")||gs_uas(\"Windows Phone\")||gs_uas(\"BlackBerry\")||(gs_uas(\"AppleWebKit\")&&(gs_uas(\"Mobile\")||gs_uas(\"Tablet\")))||gs_uas(\"Opera Mini\")||gs_uas(\"Opera Mobi\")||gs_uas(\"IEMobile\")||('ontouchstart' in window)||(navigator.msMaxTouchPoints||0)>0;}var gs_re_sp=/\\s+/,gs_re_sel=/(?:^|\\s)(\\S*-)?gs_sel(-\\S*)?(?!\\S)/g,gs_re_hvr=/(?:^|\\s)(\\S*-)?gs_hvr(-\\S*)?(?!\\S)/g,gs_re_fcs=/(?:^|\\s)(\\S*-)?gs_fcs(-\\S*)?(?!\\S)/g,gs_re_act=/(?:^|\\s)(\\S*-)?gs_act(-\\S*)?(?!\\S)/g,gs_re_cb=/(?:^|\\s)gs_in_cb(?!\\S)/,gs_re_ra=/(?:^|\\s)gs_in_ra(?!\\S)/;function gs_xcls(e,c){var l=e.className.split(gs_re_sp),n=l.length,i;l.push(c);/* add gs_hvr */for(i=0;i<n;i++){l[i]&&l.push(l[i]+\"-\"+c)}/* add gs_btnG-gs_hvr */gs_scls(e,l.join(\" \"));}function gs_ucls(e,r){gs_scls(e,e.className.replace(r,\"\"))}function gs_scls(e,c){if(e.className!=c){e.className=c}}function gs_usel(e){gs_ucls(e,gs_re_sel)}function gs_xsel(e){gs_usel(e);gs_xcls(e,\"gs_sel\")}function gs_uhvr(e){gs_ucls(e,gs_re_hvr)}function gs_xhvr(e){gs_uhvr(e);gs_xcls(e,\"gs_hvr\");}function gs_ufcs(e){gs_ucls(e,gs_re_fcs)}function gs_xfcs(e){gs_ufcs(e);gs_xcls(e,\"gs_fcs\")}function gs_uact(e){gs_ucls(e,gs_re_act)}function gs_xact(e){gs_uact(e);gs_xcls(e,\"gs_act\")}function gs_vis(e,v){e&&e.style&&(e.style.display=v?\"block\":\"none\")}function gs_visi(i,v){gs_vis(gs_id(i),v)} function gs_sel_clk(p,t){var l=gs_ch(gs_id(p),\"li\"),c,i;for(i=0;i<l.length;i++){c=gs_ch(l[i],\"a\");if(c.length>0&&c[0]==t){gs_xsel(l[i])}else{gs_usel(l[i])}}return false;}function gs_bind(){var a=Array.prototype.slice.call(arguments),f=a.shift();return function(){return f.apply(null,a.concat(Array.prototype.slice.call(arguments)))};}var gs_evt_ie=[];function gs_evt(e,n,f){if(e.addEventListener){ e.addEventListener(n,f,false);}else if(e.attachEvent){ n=\"on\"+n;var g=function(){f(window.event)};e.attachEvent(n,g);gs_ie_ver<=6&&gs_evt_ie.push(function(){e.detachEvent(n,g)});}}function gs_evt_all(l,n,f){for(var i=0;i<l.length;i++){gs_evt(l[i],n,gs_bind(f,l[i]))}}function gs_evt_stp(e){e.cancelBubble=true;e.stopPropagation&&e.stopPropagation();return false;}/*Prevent default action of event e.*/function gs_evt_pdf(e){e.returnValue=false;e.preventDefault&&e.preventDefault();}function gs_tfcs(t){t.focus();t.value=t.value;}var gs_md_st=[],gs_md_lv=[];function gs_evt_md_out(d){gs_evt(d?gs_id(d):document.documentElement,\"click\",function(e){if(!e.ctrlKey){gs_md_st.length>(gs_md_lv[d]||0)&&(gs_md_st.pop())();gs_evt_stp(e);}});}gs_evt_md_out(\"\");function gs_md_cls(d,e){var x=gs_md_lv[d]||0;while(gs_md_st.length>=x)(gs_md_st.pop())();return gs_evt_stp(e);}function gs_md_opn(d,e,o,c){gs_visi(d,1);o&&o();gs_md_st.push(function(){gs_visi(d,0);c&&c()});gs_md_lv[d]=gs_md_st.length;return gs_evt_stp(e);}function gs_md_sel(d,s,c,v,t,e){s.innerHTML=t.innerHTML;c.value=v;gs_xatr(gs_id(d),\"aria-activedescendant\",t.id);gs_xsel(t);gs_xatr(t,\"aria-selected\",\"true\");var l=gs_ch(gs_id(d),\"li\"),i;for(i=0;i<l.length;i++)if(l[i]!==t){gs_usel(l[i]);gs_uatr(l[i],\"aria-selected\");}return gs_md_cls(d,e);}function gs_evt_md_sel(d,s,c,v){gs_evt_md_out(d);var l=gs_ch(gs_id(d),\"li\"),i;s=gs_id(s);c=gs_id(c);for(i=0;i<l.length&&i<v.length;i++){gs_evt(l[i],\"click\",gs_bind(gs_md_sel,d,s,c,v[i],l[i]));}}function gs_mnu_sel(d,f,e){gs_md_cls(d,e);f();return false;}function gs_evt_mnu_sel(d,f){gs_evt_md_out(d);var l=gs_ch(gs_id(d),\"li\"),i;for(i=0;i<l.length&&i<f.length;i++){gs_evt(l[i],\"click\",gs_bind(gs_mnu_sel,d,f[i]));}}function gs_init_el(){var r=document.documentElement,w=window.innerWidth||(r?r.offsetWidth:0),h=window.innerHeight||(r?r.offsetHeight:0),m=\"\";if(w&&h){if(w<1060||h<590)m=\"gs_el_sm\";else if(w<1252||h<640)m=\"gs_el_me\";gs_is_tc&&gs_ie_ver>=8&&(m+=\" gs_el_tc\");gs_scls(r,m);}}gs_init_el();gs_evt(window,\"resize\",gs_init_el);gs_evt(window,\"pageshow\",gs_init_el);function gs_is_cb(e){var n=e.className||\"\";return n.match(gs_re_cb)||n.match(gs_re_ra);}function gs_ssel(e){}function gs_init_ssel(){gs_ssel=function(e){var p=e.parentNode,l,i,r;(e.checked?gs_xsel(p):gs_usel(p));if(p.className.match(gs_re_ra)){l=gs_ch(e.form,\"input\");for(i=0;i<l.length;i++){r=l[i];if(r.name==e.name){p=r.parentNode;(r.checked?gs_xsel(p):gs_usel(p));}}}};var l=gs_ch(document,\"input\"),i,e,p;for(i=0;i<l.length;i++){e=l[i];p=e.parentNode;if(gs_is_cb(p)){gs_ssel(e);gs_evt(e,\"click\",gs_bind(gs_ssel,e));}}}function gs_init_ie7(){gs_evt(document,\"mouseup\",function(){var a=document.activeElement;a&&a.nodeName==\"A\"&&document.body.setActive();});var l=[gs_ch(document,\"input\"),gs_ch(document,\"button\")],i,j,e,p,x;for(i=0;i<l.length;i++)for(j=0;j<l[i].length;j++){e=l[i][j];p=e.parentNode;x=gs_is_cb(p)?p:e;gs_evt(x,\"mousedown\",gs_bind(gs_xact,x));gs_evt(x,\"mouseup\",gs_bind(gs_uact,x));gs_evt(x,\"mouseleave\",gs_bind(gs_uact,x));gs_evt(e,\"focusin\",gs_bind(gs_xfcs,x));gs_evt(e,\"focusout\",gs_bind(gs_ufcs,x));}}function gs_init_ie6(){gs_evt(window,\"unload\",function(){for(var i=0;i<gs_evt_ie.length;i++){(gs_evt_ie[i])();}gs_evt_ie.length=0;});try{document.execCommand(\"BackgroundImageCache\",false,true)}catch(e){}var d=document,i,j,l=[gs_ch(d,\"button\"),gs_ch(d,\"input\"),gs_ch(d,\"li\")],e,p,x;for(i=0;i<l.length;i++)for(j=0;j<l[i].length;j++){e=l[i][j];p=e.parentNode;x=gs_is_cb(p)?p:e;gs_evt(x,\"mouseenter\",gs_bind(gs_xhvr,x));gs_evt(x,\"mouseleave\",gs_bind(gs_uhvr,x));}var f=gs_ch(d,\"form\"),s;for(i=0;i<f.length;i++){l=gs_ch(f[i],\"button\");s=[];for(j=0;j<l.length;j++){l[j].type==\"submit\"&&s.push(l[j])}if(s.length>1){for(j=0;j<s.length;j++){gs_evt(s[j],\"click\",gs_bind(function(b,s){for(i=0;i<s.length;i++){s[i]==b||(s[i].disabled=true)}},s[j],s));}gs_evt(f[i],\"keydown\",gs_bind(function(s,e){if(e.keyCode==13){for(i=0;i<s.length;i++){s[i].disabled=true;}s[0].form.submit();}},s));}}}gs_evt(window,\"load\",function(){gs_ie_ver<=6&&gs_init_ie6();gs_ie_ver<=7&&gs_init_ie7();var s=gs_ie_ver<=8;if(!s&&gs_is_tc){s=/AppleWebKit\\/([0-9]+)/.exec(navigator.userAgent||\"\");s&&(s=parseInt(s[1])<535);}s&&gs_init_ssel();gs_evt_md_out(\"gs_top\");});</script><script type=\"text/javascript\"></script></head><body><style>#gs_gb{position:relative;height:30px;background:#2d2d2d;z-index:950;font-size:13px;line-height:16px;}#gs_gb_lt,#gs_gb_rt,#gs_gb_lp{position:absolute;top:0;white-space:nowrap;}#gs_gb_lt{left:34px}.gs_el_me #gs_gb_lt{left:18px}.gs_el_sm #gs_gb_lt{left:6px}.gs_el_ph #gs_gb_lt{display:none}#gs_gb_lp{display:none}#gs_gb_lp:hover,#gs_gb_lp:focus,#gs_gb_lp:active{-webkit-filter:brightness(100%);}.gs_el_ph #gs_gb_lp{display:block;z-index:1;cursor:pointer;top:8px;left:8px;width:50px;height:17px;background:url('/intl/en/scholar/images/google_logo_tg_2012.png');_background:transparent;_filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='/intl/en/scholar/images/google_logo_tg_2012.png');}#gs_gb_rt{right:36px}.gs_el_ta #gs_gb_rt,.gs_el_ph #gs_gb_rt{right:8px}#gs_gb_lt a:link,#gs_gb_lt a:visited,#gs_gb_rt a:link,#gs_gb_rt a:visited{display:inline-block;vertical-align:top;height:29px;line-height:27px;padding:2px 10px 0 10px;font-weight:bold;color:#bbb;cursor:pointer;text-decoration:none;}#gs_gb_rt a:link,#gs_gb_rt a:visited{padding:2px 8px 0 8px}#gs_gb_lt a:hover,#gs_gb_lt a:focus,#gs_gb_lt a:active,#gs_gb_rt a:hover,#gs_gb_rt a:focus,#gs_gb_rt a:active{color:white}#gs_gb_ac{top:30px;left:auto;right:6px;width:288px;white-space:normal;}#gs_gb_aw,#gs_gb_ap,.gs_gb_am,#gs_gb_ab{display:block;padding:10px 20px;}#gs_gb_aw{background:#fef9db;font-size:11px;}#gs_gb_ap,.gs_gb_am{border-bottom:1px solid #ccc;}#gs_gb_aa:link,#gs_gb_aa:visited{padding:7px 0 5px 0;float:right;margin-left:8px;color:#1155cc;}#gs_gb_aa:active{color:#d14836}.gs_gb_am:link,.gs_gb_am:visited{color:#222;text-decoration:none;}.gs_gb_am:hover,.gs_gb_am:focus{background:#f1f1f1}.gs_gb_am:active{background:#eee}#gs_gb_ab{background:#fbfbfb;overflow:auto;zoom:1;}#gs_gb_aab{float:left;margin-right:16px}#gs_gb_aso{float:right}</style><div id=\"gs_gb\"><div id=\"gs_gb_lt\"><a href=\"http://www.google.com/webhp?hl=en&amp;\">Web</a><a href=\"http://www.google.com/imghp?hl=en&amp;\">Images</a><a href=\"http://www.google.com/intl/en/options/\">More&hellip;</a></div><a id=\"gs_gb_lp\" aria-label=\"Web\" href=\"http://www.google.com/webhp?hl=en&\"></a><div id=\"gs_gb_rt\"><a href=\"https://accounts.google.com/Login?hl=en&amp;continue=http://scholar.google.com/citations%3Fhl%3Den\">Sign in</a></div></div><div id=\"gs_top\"><div class=\"g-doc-1024\"><script type=\"text/javascript\">function citToggleEmbedLink() {citHide(\"cit-photo-form\");var elem = citGetById(\"cit-public-url\");citToggleElem(\"cit-public-url\", \"block\");return false;}function citTogglePhotoForm() {citHide(\"cit-public-url\");citToggleElem(\"cit-photo-form\", \"inline\");return false;}</script><div class=\"g-section g-tpl-250-alt\"><div class=\"g-unit g-first\"><div style=\"padding-left:1em\"><a href=\"http://scholar.google.com/schhp?hl=en&amp;oe=ASCII\" target=\"_top\"><img src=\"http://scholar.google.com/intl/en/scholar/images/scholar_logo_md_2011.gif\" width=\"194\" height=\"40\" alt=\"Scholar Home\" border=0></a><form method=\"get\" action=\"/citations\"><input type=hidden name=hl value=\"en\"><input type=hidden name=oe value=\"ASCII\"><input type=\"hidden\" name=\"view_op\" value=\"search_authors\"><input type=\"text\" name=\"mauthors\" style=\"width:100%\"><br><input type=\"submit\"  value=\"Search Authors\"></form><br><div style=\"font-size:120%\"><a href=\"/citations?hl=en&amp;oe=ASCII\" class=\"cit-dark-link\" target=\"_top\">Get my own profile</a> - <a class=\"cit-dark-link\" href=\"/intl/en/scholar/citations.html\">Help</a></div><br></div><div style=\"padding-left:1em\"><div class=\"g-section\"><div class=\"cit-rco cit-dgb\"></div><div class=\"cit-rci cit-dgb\"></div><div class=\"cit-dgb\" style=\"font-weight: bold\">&nbsp;Follow this author</div><div style=\"padding:.5em; border:.3em solid #9FD9A7\"><div>5 Followers</div><hr><div><a class=\"cit-dark-link\" href=\"javascript:void(0)\" onclick=\"citHide('cit-follow-citations-form');citToggleElem('cit-follow-articles-form', 'block')\">Follow new articles</a></div><div id=\"cit-follow-articles-form\" style=\"display:none\"><form method=\"post\" action=\"/citations?hl=en&amp;oe=ASCII&amp;user=HI-I6C0AAAAJ&amp;view_op=list_works\" style=\"border:2px solid #9FD9A7; padding:0.5em;margin-top:0.5em\">Create email alert for new articles in this profile<input type=\"hidden\" name=\"xsrf\" value=\"AMstHGQAAAAAUQazn5tZyyOYD5rdymlfWLBg6XXpZv2I\"><input type=\"hidden\" name=\"user\" value=\"HI-I6C0AAAAJ\"><input type=\"text\" size=\"25\" maxlength=\"100\" id=\"cit-articles-email\" style=\"color:gray;\" name=\"email_for_op\" value=\"Email\"onfocus=\"citClearTextHint('cit-articles-email', 'Email')\" onblur=\"citSetTextHint('cit-articles-email','Email')\"><br><input type=\"submit\"  name=\"follow_articles_btn\" value=\"Create alert\"> <input type=\"button\" name=\"cancel_follow_articles_btn\" value=\"Cancel\" onclick=\"citHide('cit-follow-articles-form', 'block')\"></form></div><div><a class=\"cit-dark-link\" href=\"javascript:void(0)\" onclick=\"citHide('cit-follow-articles-form');citToggleElem('cit-follow-citations-form', 'block')\">Follow new citations</a></div><div id=\"cit-follow-citations-form\" style=\"display:none\"><form method=\"post\" action=\"/citations?hl=en&amp;oe=ASCII&amp;user=HI-I6C0AAAAJ&amp;view_op=list_works\" style=\"border:2px solid #9FD9A7; padding:0.5em;margin-top:0.5em\">Create email alert for new citations to articles in this profile<input type=\"hidden\" name=\"xsrf\" value=\"AMstHGQAAAAAUQazn5tZyyOYD5rdymlfWLBg6XXpZv2I\"><input type=\"hidden\" name=\"user\" value=\"HI-I6C0AAAAJ\"><input type=\"text\" size=\"25\" maxlength=\"100\" id=\"cit-citations-email\" style=\"color:gray;\" name=\"email_for_op\" value=\"Email\"onfocus=\"citClearTextHint('cit-citations-email', 'Email')\" onblur=\"citSetTextHint('cit-citations-email','Email')\"><br><input type=\"submit\"  name=\"follow_citations_btn\" value=\"Create alert\"> <input type=\"button\" name=\"cancel_follow_citations_btn\" value=\"Cancel\" onclick=\"citHide('cit-follow-citations-form','block')\"></form></div></div></div><br><div class=\"g-section\"><div class=\"cit-rco cit-dgb\"></div><div class=\"cit-rci cit-dgb\"></div><div class=\"cit-dgb\" style=\"font-weight: bold\">&nbsp;Co-authors</div><div style=\"padding:.5em; border:.3em solid #9FD9A7\"><span style=\"color:#000\">No co-authors</span></div></div></div></div><div class=\"g-unit\"><div class=\"cit-user-info\"><div class=\"g-section g-tpl-150\"><div class=\"g-unit g-first\"><div style=\"text-align: center;\"><a href=\"/citations?user=HI-I6C0AAAAJ&amp;hl=en&amp;oe=ASCII\"><img width=\"113\" height=\"150\" src=\"/citations?view_op=view_photo&amp;user=HI-I6C0AAAAJ&amp;citpid=1\"></a><br><a class=\"cit-inplaceaction\" href=\"javascript:void(0)\" onclick=\"citTogglePhotoForm();\"></a></div></div><div class=\"g-unit\"><div style=\"margin-left:6px\"><form id=\"cit-name-form\" method=\"post\" class=\"cit-inplaceform\" action=\"\"><span id=\"cit-name-read\"><span id=\"cit-name-display\" class=\"cit-in-place-nohover\">Jeff Leek</span></span></form><form id=\"cit-affiliation-form\" method=\"post\" class=\"cit-inplaceform\" action=\"\"><span id=\"cit-affiliation-read\"><span id=\"cit-affiliation-display\" class=\"cit-in-place-nohover\">Assistant Professor of Biostatistics, Johns Hopkins Bloomberg School of Public Health</span></span></form><form id=\"cit-int-form\" method=\"post\" class=\"cit-inplaceform\" action=\"\"><span id=\"cit-int-read\"><a class=\"cit-dark-large-link\" href=\"/citations?view_op=search_authors&amp;hl=en&amp;oe=ASCII&amp;mauthors=label:statistics\">Statistics</a>&nbsp;<span style=\"font-size:120%\">- </span><a class=\"cit-dark-large-link\" href=\"/citations?view_op=search_authors&amp;hl=en&amp;oe=ASCII&amp;mauthors=label:computing\">Computing</a>&nbsp;<span style=\"font-size:120%\">- </span><a class=\"cit-dark-large-link\" href=\"/citations?view_op=search_authors&amp;hl=en&amp;oe=ASCII&amp;mauthors=label:genomics\">Genomics</a>&nbsp;<span style=\"font-size:120%\">- </span><a class=\"cit-dark-large-link\" href=\"/citations?view_op=search_authors&amp;hl=en&amp;oe=ASCII&amp;mauthors=label:personalized_medicine\">Personalized Medicine</a>&nbsp;<span style=\"font-size:120%\">- </span><a class=\"cit-dark-large-link\" href=\"/citations?view_op=search_authors&amp;hl=en&amp;oe=ASCII&amp;mauthors=label:scientific_communication\">Scientific Communication</a>&nbsp;</span></form><form id=\"cit-domain-form\" method=\"post\" class=\"cit-inplaceform\" action=\"\"><span id=\"cit-domain-read\"><span id=\"cit-domain-display\" class=\"cit-in-place-nohover\">Verified email at jhsph.edu</span></span></form><form id=\"cit-homepage-form\" method=\"post\" class=\"cit-inplaceform\" style=\"display:inline\" action=\"\"><span id=\"cit-homepage-read\"><a class=\"cit-dark-large-link\" href=\"http://biostat.jhsph.edu/~jleek/research.html\" rel=\"nofollow\" target=\"_blank\">Homepage</a></span></form></div></div></div></div><div class=\"g-section\"><div class=\"cit-messagebox\" id=\"message_box\" style=\"visibility:hidden\"><table style=\"display:inline-table\"><tr><td><b></b><i></i><form style=\"display:none\"><input type=\"hidden\" id=\"cit-show-msg\" value=\"\"><input type=\"text\" id=\"cit-shown-msg\" value=\"\"></form><form action=\"\" method=\"post\" name=\"undoFrm\"><input type=\"hidden\" name=\"\" value=\"\"/><div id=\"message_text\">&nbsp;</div></form><i></i><b></b></td></tr></table></div></div><div class=\"cit-rco cit-lbb\"></div><div class=\"cit-rci cit-lbb\"></div><div class=\"cit-lbb\"><table style=\"text-align:center;width:100%\"><tr><td valign=top><b>Citation indices</b><br><table id=\"stats\" cellspacing=\"0\" cellpadding=\"0\" width=\"205\"><tr class=\"cit-headerrow\"><td class=\"cit-caption\">&nbsp;</td><td class=\"cit-borderleft\">All</td><td class=\"cit-borderleft\">Since 2008</td></tr><tr class=\"cit-borderbottom\"><td class=\"cit-caption\"><a href=\"#\" class=\"cit-dark-link\" onclick=\"return citToggleIndexDef('total_citations_definition')\" title='This is the number of citations to all publications. The second column has the &quot;recent&quot; version of this metric which is the number of new citations in the last 5 years to all publications.'>Citations</a></td><td class=\"cit-borderleft cit-data\">1285</td><td class=\"cit-borderleft cit-data\">1146</td></tr><tr class=\"cit-borderbottom\"><td class=\"cit-caption\"><a href=\"#\" class=\"cit-dark-link\" onclick=\"return citToggleIndexDef('h_index_definition')\" title='h-index is the largest number h such that h publications have at least h citations. The second column has the &quot;recent&quot; version of this metric which is the largest number h such that h publications have at least h new citations in the last 5 years.'>h-index</a></td><td class=\"cit-borderleft cit-data\">10</td><td class=\"cit-borderleft cit-data\">10</td></tr><tr><td class=\"cit-caption\"><a href=\"#\" class=\"cit-dark-link\" onclick=\"return citToggleIndexDef('i_ten_index_definition')\" title='i10-index is the number of publications with at least 10 citations. The second column has the &quot;recent&quot; version of this metric which is the number of publications that have received at least 10 new citations in the last 5 years.'>i10-index</a></td><td class=\"cit-borderleft cit-data\">11</td><td class=\"cit-borderleft cit-data\">11</td></tr></table></td><td valign=top width=\"475\"><b>Citations to my articles</b><br><img src=\"http://www.google.com/chart?chs=475x90&amp;cht=bvs&amp;chf=bg,s,e8f4f7&amp;chco=1111cc&amp;chbh=r,2.0,0.0&amp;chxt=x,y&amp;chxr=1,0,402,402&amp;chd=t:2.5,10.2,19.2,29.9,26.9,47.3,68.4,100.0,8.5&amp;chxl=0:|2005||2007||2009||2011||2013\" height=\"90\" width=\"475\" alt=\"Citations to my articles\"></td></tr></table><div id=\"h_index_definition\" style=\"display:none\" class=\"cit-definition emphasis\">h-index is the largest number h such that h publications have at least h citations. The second column has the &quot;recent&quot; version of this metric which is the largest number h such that h publications have at least h new citations in the last 5 years. &nbsp;<font size=\"-1\"><a class=\"cit-light-link\" href=\"#\" onclick=\"return citHide('h_index_definition')\">hide</a></font></div><div id=\"i_ten_index_definition\" style=\"display:none\" class=\"cit-definition emphasis\">i10-index is the number of publications with at least 10 citations. The second column has the &quot;recent&quot; version of this metric which is the number of publications that have received at least 10 new citations in the last 5 years. &nbsp;<font size=\"-1\"><a class=\"cit-light-link\" href=\"#\" onclick=\"return citHide('i_ten_index_definition')\">hide</a></font></div><div id=\"total_citations_definition\" style=\"display:none\" class=\"cit-definition emphasis\">This is the number of citations to all publications. The second column has the &quot;recent&quot; version of this metric which is the number of new citations in the last 5 years to all publications. &nbsp;<font size=\"-1\"><a class=\"cit-light-link\" href=\"#\" onclick=\"return citHide('total_citations_definition')\">hide</a></font></div></div><form method=\"post\" action=\"/citations?hl=en&amp;oe=ASCII&amp;user=HI-I6C0AAAAJ&amp;view_op=list_works\" id=\"citationsForm\"><input type=\"hidden\" name=\"xsrf\" value=\"AMstHGQAAAAAUQazn5tZyyOYD5rdymlfWLBg6XXpZv2I\"><div class=\"g-section cit-dgb\"><div style=\"padding:0.3em 0.6em;\"><table style=\"width:100%\"><tr><td>Select: <a href=\"javascript:void(0)\" onclick=\"citSelectAll()\" class=\"cit-dark-link\">All</a>, <a href=\"javascript:void(0)\" onclick=\"citSelectNone()\" class=\"cit-dark-link\">None</a> <input type=\"submit\" value=\"Export\" id=\"export_btn_top\" name=\"export_btn\"> </td><td style=\"text-align:right;\">Show:<select onchange=\"citGo('/citations?hl\\x3den\\x26oe\\x3dASCII\\x26user\\x3dHI-I6C0AAAAJ\\x26view_op\\x3dlist_works\\x26pagesize\\x3d100')\"><option selected>20</option><option>100</option></select> <span style=\"font-weight: bold; margin: 0 0.5em 0 0.5em;\">1-20</span><a href=\"/citations?hl=en&amp;oe=ASCII&amp;user=HI-I6C0AAAAJ&amp;view_op=list_works&amp;cstart=20\" class=\"cit-dark-link\">Next &gt;</a></td></tr></table></div></div><div class=\"g-section\"><div style=\"min-height: 200px; height: auto !important;height: 200px; border-left: 0.4em solid #9fd9a7;border-bottom: 0.3em solid #9fd9a7;\"><table class=\"cit-table\"><tr class=\"cit-table header\"><td id=\"col-select\">&nbsp;</td><td id=\"col-title\"><a href=\"/citations?sortby=title&amp;hl=en&amp;oe=ASCII&amp;user=HI-I6C0AAAAJ&amp;view_op=list_works\" class=\"cit-dark-link\">Title / Author</a></td><td id=\"col-citedby\">Cited by</td><td id=\"col-asterisk\">&nbsp;</td><td id=\"col-year\"><a href=\"/citations?sortby=pubdate&amp;hl=en&amp;oe=ASCII&amp;user=HI-I6C0AAAAJ&amp;view_op=list_works\" class=\"cit-dark-link\">Year</a></td></tr> <tr class=\"cit-table item\"><td id=\"col-select\"><input type=\"checkbox\" name=\"s\" value=\"HI-I6C0AAAAJ:u5HHmVD_uO8C\"/></td><td id=\"col-title\"><a href=\"/citations?view_op=view_citation&amp;hl=en&amp;oe=ASCII&amp;user=HI-I6C0AAAAJ&amp;citation_for_view=HI-I6C0AAAAJ:u5HHmVD_uO8C\" class=\"cit-dark-large-link\">Significance analysis of time course microarray experiments</a><br><span class=\"cit-gray\">JD Storey, W Xiao, JT Leek, RG Tompkins, RW Davis</span><br><span class=\"cit-gray\">Proceedings of the National Academy of Sciences of the United States of ...</span></td><td id=\"col-citedby\"><a class=\"cit-dark-link\" href=\"http://scholar.google.com/scholar?oi=bibs&amp;hl=en&amp;oe=ASCII&amp;cites=8692182196465189153\">338</a></td><td id=\"col-asterisk\"></td><td id=\"col-year\">2005</td></tr> <tr class=\"cit-table item\"><td id=\"col-select\"><input type=\"checkbox\" name=\"s\" value=\"HI-I6C0AAAAJ:d1gkVwhDpl0C\"/></td><td id=\"col-title\"><a href=\"/citations?view_op=view_citation&amp;hl=en&amp;oe=ASCII&amp;user=HI-I6C0AAAAJ&amp;citation_for_view=HI-I6C0AAAAJ:d1gkVwhDpl0C\" class=\"cit-dark-large-link\">Capturing heterogeneity in gene expression studies by surrogate variable analysis</a><br><span class=\"cit-gray\">JT Leek, JD Storey</span><br><span class=\"cit-gray\">PLoS Genetics 3 (9), e161</span></td><td id=\"col-citedby\"><a class=\"cit-dark-link\" href=\"http://scholar.google.com/scholar?oi=bibs&amp;hl=en&amp;oe=ASCII&amp;cites=14943880347723800617\">171</a></td><td id=\"col-asterisk\"></td><td id=\"col-year\">2007</td></tr> <tr class=\"cit-table item\"><td id=\"col-select\"><input type=\"checkbox\" name=\"s\" value=\"HI-I6C0AAAAJ:u-x6o8ySG0sC\"/></td><td id=\"col-title\"><a href=\"/citations?view_op=view_citation&amp;hl=en&amp;oe=ASCII&amp;user=HI-I6C0AAAAJ&amp;citation_for_view=HI-I6C0AAAAJ:u-x6o8ySG0sC\" class=\"cit-dark-large-link\">EDGE: extraction and analysis of differential gene expression</a><br><span class=\"cit-gray\">JT Leek, E Monsen, AR Dabney, JD Storey</span><br><span class=\"cit-gray\">Bioinformatics 22 (4), 507-508</span></td><td id=\"col-citedby\"><a class=\"cit-dark-link\" href=\"http://scholar.google.com/scholar?oi=bibs&amp;hl=en&amp;oe=ASCII&amp;cites=8862746171832697560\">140</a></td><td id=\"col-asterisk\"></td><td id=\"col-year\">2006</td></tr> <tr class=\"cit-table item\"><td id=\"col-select\"><input type=\"checkbox\" name=\"s\" value=\"HI-I6C0AAAAJ:UeHWp8X0CEIC\"/></td><td id=\"col-title\"><a href=\"/citations?view_op=view_citation&amp;hl=en&amp;oe=ASCII&amp;user=HI-I6C0AAAAJ&amp;citation_for_view=HI-I6C0AAAAJ:UeHWp8X0CEIC\" class=\"cit-dark-large-link\">Tackling the widespread and critical impact of batch effects in high-throughput data</a><br><span class=\"cit-gray\">JT Leek, RB Scharpf, HC Bravo, D Simcha, B Langmead, WE Johnson, D Geman, K ...</span><br><span class=\"cit-gray\">Nature Reviews Genetics 11 (10), 733-739</span></td><td id=\"col-citedby\"><a class=\"cit-dark-link\" href=\"http://scholar.google.com/scholar?oi=bibs&amp;hl=en&amp;oe=ASCII&amp;cites=16403016020126782741\">133</a></td><td id=\"col-asterisk\"></td><td id=\"col-year\">2010</td></tr> <tr class=\"cit-table item\"><td id=\"col-select\"><input type=\"checkbox\" name=\"s\" value=\"HI-I6C0AAAAJ:9yKSN-GCB0IC\"/></td><td id=\"col-title\"><a href=\"/citations?view_op=view_citation&amp;hl=en&amp;oe=ASCII&amp;user=HI-I6C0AAAAJ&amp;citation_for_view=HI-I6C0AAAAJ:9yKSN-GCB0IC\" class=\"cit-dark-large-link\">The optimal discovery procedure for large-scale significance testing, with applications to comparative microarray experiments</a><br><span class=\"cit-gray\">JD Storey, JY Dai, JT Leek</span><br><span class=\"cit-gray\">UW Biostatistics Working Paper Series, 260</span></td><td id=\"col-citedby\"><a class=\"cit-dark-link\" href=\"http://scholar.google.com/scholar?oi=bibs&amp;hl=en&amp;oe=ASCII&amp;cites=16099641174606741636\">107</a></td><td id=\"col-asterisk\"></td><td id=\"col-year\">2005</td></tr> <tr class=\"cit-table item\"><td id=\"col-select\"><input type=\"checkbox\" name=\"s\" value=\"HI-I6C0AAAAJ:qjMakFHDy7sC\"/></td><td id=\"col-title\"><a href=\"/citations?view_op=view_citation&amp;hl=en&amp;oe=ASCII&amp;user=HI-I6C0AAAAJ&amp;citation_for_view=HI-I6C0AAAAJ:qjMakFHDy7sC\" class=\"cit-dark-large-link\">Systems-level dynamic analyses of fate change in murine embryonic stem cells</a><br><span class=\"cit-gray\">R Lu, F Markowetz, RD Unwin, JT Leek, EM Airoldi, BD MacArthur, A Lachmann ...</span><br><span class=\"cit-gray\">Nature 462 (7271), 358-362</span></td><td id=\"col-citedby\"><a class=\"cit-dark-link\" href=\"http://scholar.google.com/scholar?oi=bibs&amp;hl=en&amp;oe=ASCII&amp;cites=4114573275173642545\">95</a></td><td id=\"col-asterisk\"></td><td id=\"col-year\">2009</td></tr> <tr class=\"cit-table item\"><td id=\"col-select\"><input type=\"checkbox\" name=\"s\" value=\"HI-I6C0AAAAJ:IjCSPb-OGe4C\"/></td><td id=\"col-title\"><a href=\"/citations?view_op=view_citation&amp;hl=en&amp;oe=ASCII&amp;user=HI-I6C0AAAAJ&amp;citation_for_view=HI-I6C0AAAAJ:IjCSPb-OGe4C\" class=\"cit-dark-large-link\">Cloud-scale RNA-sequencing differential expression analysis with Myrna</a><br><span class=\"cit-gray\">B Langmead, KD Hansen, JT Leek</span><br><span class=\"cit-gray\">Genome Biology 11 (8), R83</span></td><td id=\"col-citedby\"><a class=\"cit-dark-link\" href=\"http://scholar.google.com/scholar?oi=bibs&amp;hl=en&amp;oe=ASCII&amp;cites=9392678635432440961\">78</a></td><td id=\"col-asterisk\"></td><td id=\"col-year\">2010</td></tr> <tr class=\"cit-table item\"><td id=\"col-select\"><input type=\"checkbox\" name=\"s\" value=\"HI-I6C0AAAAJ:2osOgNQ5qMEC\"/></td><td id=\"col-title\"><a href=\"/citations?view_op=view_citation&amp;hl=en&amp;oe=ASCII&amp;user=HI-I6C0AAAAJ&amp;citation_for_view=HI-I6C0AAAAJ:2osOgNQ5qMEC\" class=\"cit-dark-large-link\">A general framework for multiple testing dependence</a><br><span class=\"cit-gray\">JT Leek, JD Storey</span><br><span class=\"cit-gray\">Proceedings of the National Academy of Sciences 105 (48), 18718</span></td><td id=\"col-citedby\"><a class=\"cit-dark-link\" href=\"http://scholar.google.com/scholar?oi=bibs&amp;hl=en&amp;oe=ASCII&amp;cites=6862569568109470250\">78</a></td><td id=\"col-asterisk\"></td><td id=\"col-year\">2008</td></tr> <tr class=\"cit-table item\"><td id=\"col-select\"><input type=\"checkbox\" name=\"s\" value=\"HI-I6C0AAAAJ:Se3iqnhoufwC\"/></td><td id=\"col-title\"><a href=\"/citations?view_op=view_citation&amp;hl=en&amp;oe=ASCII&amp;user=HI-I6C0AAAAJ&amp;citation_for_view=HI-I6C0AAAAJ:Se3iqnhoufwC\" class=\"cit-dark-large-link\">Temporal dynamics and genetic control of transcription in the human prefrontal cortex</a><br><span class=\"cit-gray\">C Colantuoni, BK Lipska, T Ye, TM Hyde, R Tao, JT Leek, EA Colantuoni, AG ...</span><br><span class=\"cit-gray\">Nature 478 (7370), 519-523</span></td><td id=\"col-citedby\"><a class=\"cit-dark-link\" href=\"http://scholar.google.com/scholar?oi=bibs&amp;hl=en&amp;oe=ASCII&amp;cites=15401379057477374674\">53</a></td><td id=\"col-asterisk\"></td><td id=\"col-year\">2011</td></tr> <tr class=\"cit-table item\"><td id=\"col-select\"><input type=\"checkbox\" name=\"s\" value=\"HI-I6C0AAAAJ:LkGwnXOMwfcC\"/></td><td id=\"col-title\"><a href=\"/citations?view_op=view_citation&amp;hl=en&amp;oe=ASCII&amp;user=HI-I6C0AAAAJ&amp;citation_for_view=HI-I6C0AAAAJ:LkGwnXOMwfcC\" class=\"cit-dark-large-link\">Sequencing technology does not eliminate biological variability</a><br><span class=\"cit-gray\">KD Hansen, Z Wu, RA Irizarry, JT Leek</span><br><span class=\"cit-gray\">Nature Biotechnology 29 (7), 572-573</span></td><td id=\"col-citedby\"><a class=\"cit-dark-link\" href=\"http://scholar.google.com/scholar?oi=bibs&amp;hl=en&amp;oe=ASCII&amp;cites=13984583295080419572\">16</a></td><td id=\"col-asterisk\"></td><td id=\"col-year\">2011</td></tr> <tr class=\"cit-table item\"><td id=\"col-select\"><input type=\"checkbox\" name=\"s\" value=\"HI-I6C0AAAAJ:hqOjcs7Dif8C\"/></td><td id=\"col-title\"><a href=\"/citations?view_op=view_citation&amp;hl=en&amp;oe=ASCII&amp;user=HI-I6C0AAAAJ&amp;citation_for_view=HI-I6C0AAAAJ:hqOjcs7Dif8C\" class=\"cit-dark-large-link\">Significance analysis and statistical dissection of variably methylated regions</a><br><span class=\"cit-gray\">AE Jaffe, AP Feinberg, RA Irizarry, JT Leek</span><br><span class=\"cit-gray\">Biostatistics</span></td><td id=\"col-citedby\"><a class=\"cit-dark-link\" href=\"http://scholar.google.com/scholar?oi=bibs&amp;hl=en&amp;oe=ASCII&amp;cites=8713725236803269731\">10</a></td><td id=\"col-asterisk\"></td><td id=\"col-year\">2011</td></tr> <tr class=\"cit-table item\"><td id=\"col-select\"><input type=\"checkbox\" name=\"s\" value=\"HI-I6C0AAAAJ:8k81kl-MbHgC\"/></td><td id=\"col-title\"><a href=\"/citations?view_op=view_citation&amp;hl=en&amp;oe=ASCII&amp;user=HI-I6C0AAAAJ&amp;citation_for_view=HI-I6C0AAAAJ:8k81kl-MbHgC\" class=\"cit-dark-large-link\">The sva package for removing batch effects and other unwanted variation in high-throughput experiments</a><br><span class=\"cit-gray\">JT Leek, WE Johnson, HS Parker, AE Jaffe, JD Storey</span><br><span class=\"cit-gray\">Bioinformatics 28 (6), 882-883</span></td><td id=\"col-citedby\"><a class=\"cit-dark-link\" href=\"http://scholar.google.com/scholar?oi=bibs&amp;hl=en&amp;oe=ASCII&amp;cites=8144311546232376767\">9</a></td><td id=\"col-asterisk\"></td><td id=\"col-year\">2012</td></tr> <tr class=\"cit-table item\"><td id=\"col-select\"><input type=\"checkbox\" name=\"s\" value=\"HI-I6C0AAAAJ:WF5omc3nYNoC\"/></td><td id=\"col-title\"><a href=\"/citations?view_op=view_citation&amp;hl=en&amp;oe=ASCII&amp;user=HI-I6C0AAAAJ&amp;citation_for_view=HI-I6C0AAAAJ:WF5omc3nYNoC\" class=\"cit-dark-large-link\">Cooperation between referees and authors increases peer review accuracy</a><br><span class=\"cit-gray\">JT Leek, MA Taub, FJ Pineda</span><br><span class=\"cit-gray\">PLoS ONE 6 (11), e26895</span></td><td id=\"col-citedby\"><a class=\"cit-dark-link\" href=\"http://scholar.google.com/scholar?oi=bibs&amp;hl=en&amp;oe=ASCII&amp;cites=2817868503282973196\">9</a></td><td id=\"col-asterisk\"></td><td id=\"col-year\">2011</td></tr> <tr class=\"cit-table item\"><td id=\"col-select\"><input type=\"checkbox\" name=\"s\" value=\"HI-I6C0AAAAJ:5nxA0vEk-isC\"/></td><td id=\"col-title\"><a href=\"/citations?view_op=view_citation&amp;hl=en&amp;oe=ASCII&amp;user=HI-I6C0AAAAJ&amp;citation_for_view=HI-I6C0AAAAJ:5nxA0vEk-isC\" class=\"cit-dark-large-link\">Bump hunting to identify differentially methylated regions in epigenetic epidemiology studies</a><br><span class=\"cit-gray\">AE Jaffe, P Murakami, H Lee, JT Leek, MD Fallin, AP Feinberg, RA Irizarry</span><br><span class=\"cit-gray\">International journal of epidemiology 41 (1), 200-209</span></td><td id=\"col-citedby\"><a class=\"cit-dark-link\" href=\"http://scholar.google.com/scholar?oi=bibs&amp;hl=en&amp;oe=ASCII&amp;cites=13917393765835926103\">8</a></td><td id=\"col-asterisk\"></td><td id=\"col-year\">2012</td></tr> <tr class=\"cit-table item\"><td id=\"col-select\"><input type=\"checkbox\" name=\"s\" value=\"HI-I6C0AAAAJ:Tyk-4Ss8FVUC\"/></td><td id=\"col-title\"><a href=\"/citations?view_op=view_citation&amp;hl=en&amp;oe=ASCII&amp;user=HI-I6C0AAAAJ&amp;citation_for_view=HI-I6C0AAAAJ:Tyk-4Ss8FVUC\" class=\"cit-dark-large-link\">Asymptotic Conditional Singular Value Decomposition for High&#8208;Dimensional Genomic Data</a><br><span class=\"cit-gray\">JT Leek</span><br><span class=\"cit-gray\">Biometrics</span></td><td id=\"col-citedby\"><a class=\"cit-dark-link\" href=\"http://scholar.google.com/scholar?oi=bibs&amp;hl=en&amp;oe=ASCII&amp;cites=16751206081910057670\">8</a></td><td id=\"col-asterisk\"></td><td id=\"col-year\">2010</td></tr> <tr class=\"cit-table item\"><td id=\"col-select\"><input type=\"checkbox\" name=\"s\" value=\"HI-I6C0AAAAJ:0EnyYjriUFMC\"/></td><td id=\"col-title\"><a href=\"/citations?view_op=view_citation&amp;hl=en&amp;oe=ASCII&amp;user=HI-I6C0AAAAJ&amp;citation_for_view=HI-I6C0AAAAJ:0EnyYjriUFMC\" class=\"cit-dark-large-link\">ReCount: A multi-experiment resource of analysis-ready RNA-seq gene count datasets</a><br><span class=\"cit-gray\">A Frazee, B Langmead, J Leek</span><br><span class=\"cit-gray\">BMC bioinformatics 12 (1), 449</span></td><td id=\"col-citedby\"><a class=\"cit-dark-link\" href=\"http://scholar.google.com/scholar?oi=bibs&amp;hl=en&amp;oe=ASCII&amp;cites=5499264026160610251\">6</a></td><td id=\"col-asterisk\"></td><td id=\"col-year\">2011</td></tr> <tr class=\"cit-table item\"><td id=\"col-select\"><input type=\"checkbox\" name=\"s\" value=\"HI-I6C0AAAAJ:_FxGoFyzp5QC\"/></td><td id=\"col-title\"><a href=\"/citations?view_op=view_citation&amp;hl=en&amp;oe=ASCII&amp;user=HI-I6C0AAAAJ&amp;citation_for_view=HI-I6C0AAAAJ:_FxGoFyzp5QC\" class=\"cit-dark-large-link\">Dissecting Inflammatory Complications in Critically Injured Patients by Within-Patient Gene Expression Changes: A Longitudinal Clinical Genomics Study</a><br><span class=\"cit-gray\">KH Desai, CS Tan, JT Leek, RV Maier, RG Tompkins, JD Storey</span><br><span class=\"cit-gray\">PLoS Med 8 (9), e1001093</span></td><td id=\"col-citedby\"><a class=\"cit-dark-link\" href=\"http://scholar.google.com/scholar?oi=bibs&amp;hl=en&amp;oe=ASCII&amp;cites=10923603496726693889\">6</a></td><td id=\"col-asterisk\"></td><td id=\"col-year\">2011</td></tr> <tr class=\"cit-table item\"><td id=\"col-select\"><input type=\"checkbox\" name=\"s\" value=\"HI-I6C0AAAAJ:Y0pCki6q_DkC\"/></td><td id=\"col-title\"><a href=\"/citations?view_op=view_citation&amp;hl=en&amp;oe=ASCII&amp;user=HI-I6C0AAAAJ&amp;citation_for_view=HI-I6C0AAAAJ:Y0pCki6q_DkC\" class=\"cit-dark-large-link\">The tspair package for finding top scoring pair classifiers in R</a><br><span class=\"cit-gray\">JT Leek</span><br><span class=\"cit-gray\">Bioinformatics 25 (9), 1203-1204</span></td><td id=\"col-citedby\"><a class=\"cit-dark-link\" href=\"http://scholar.google.com/scholar?oi=bibs&amp;hl=en&amp;oe=ASCII&amp;cites=10521226315216814638\">6</a></td><td id=\"col-asterisk\"></td><td id=\"col-year\">2009</td></tr> <tr class=\"cit-table item\"><td id=\"col-select\"><input type=\"checkbox\" name=\"s\" value=\"HI-I6C0AAAAJ:zYLM7Y9cAGgC\"/></td><td id=\"col-title\"><a href=\"/citations?view_op=view_citation&amp;hl=en&amp;oe=ASCII&amp;user=HI-I6C0AAAAJ&amp;citation_for_view=HI-I6C0AAAAJ:zYLM7Y9cAGgC\" class=\"cit-dark-large-link\">The optimal discovery procedure II: applications to comparative microarray experiments</a><br><span class=\"cit-gray\">J Storey, J Dai, J Leek</span><br><span class=\"cit-gray\">Submitted</span></td><td id=\"col-citedby\"><a class=\"cit-dark-link\" href=\"http://scholar.google.com/scholar?oi=bibs&amp;hl=en&amp;oe=ASCII&amp;cites=2916467767938830107\">5</a></td><td id=\"col-asterisk\"></td><td id=\"col-year\">2005</td></tr> <tr class=\"cit-table item\"><td id=\"col-select\"><input type=\"checkbox\" name=\"s\" value=\"HI-I6C0AAAAJ:ufrVoPGSRksC\"/></td><td id=\"col-title\"><a href=\"/citations?view_op=view_citation&amp;hl=en&amp;oe=ASCII&amp;user=HI-I6C0AAAAJ&amp;citation_for_view=HI-I6C0AAAAJ:ufrVoPGSRksC\" class=\"cit-dark-large-link\">The Joint Null Criterion for Multiple Hypothesis Tests</a><br><span class=\"cit-gray\">JT Leek, JD Storey</span><br><span class=\"cit-gray\">Statistical Applications in Genetics and Molecular Biology 10 (1), 28</span></td><td id=\"col-citedby\"><a class=\"cit-dark-link\" href=\"http://scholar.google.com/scholar?oi=bibs&amp;hl=en&amp;oe=ASCII&amp;cites=4881367676737276124\">3</a></td><td id=\"col-asterisk\"></td><td id=\"col-year\">2011</td></tr></table></div></div><div class=\"g-section cit-dgb\"><div style=\"padding:0.3em 0.6em;\"><table style=\"width:100%\"><tr><td>Select: <a href=\"javascript:void(0)\" onclick=\"citSelectAll()\" class=\"cit-dark-link\">All</a>, <a href=\"javascript:void(0)\" onclick=\"citSelectNone()\" class=\"cit-dark-link\">None</a> <input type=\"submit\" value=\"Export\" id=\"export_btn_bottom\" name=\"export_btn\"> </td><td style=\"text-align:right;\">Show:<select onchange=\"citGo('/citations?hl\\x3den\\x26oe\\x3dASCII\\x26user\\x3dHI-I6C0AAAAJ\\x26view_op\\x3dlist_works\\x26pagesize\\x3d100')\"><option selected>20</option><option>100</option></select> <span style=\"font-weight: bold; margin: 0 0.5em 0 0.5em;\">1-20</span><a href=\"/citations?hl=en&amp;oe=ASCII&amp;user=HI-I6C0AAAAJ&amp;view_op=list_works&amp;cstart=20\" class=\"cit-dark-link\">Next &gt;</a></td></tr></table></div></div></form><div class=\"cit-rci cit-dgb\"></div><div class=\"cit-rco cit-dgb\"></div></div></div><div class=\"g-section\"><div style=\"margin-top: 1em; text-align: center; font-size: 1em;\"><div style=\"margin-bottom: 1em;font-style: italic\">Dates and citation counts are estimated and are determined automatically by a computer program.</div>&copy;2012 Google - <a href=\"/intl/en/scholar/about.html\" class=\"cit-dark-link\" target=\"_top\">About Google Scholar</a> - <a href=\"http://www.google.com/intl/en/about.html\" class=\"cit-dark-link\" target=\"_top\">All About Google</a> - <a href=\"http://www.google.com/support/scholar/bin/request.py?contact_type=general\" class=\"cit-dark-link\" target=\"_top\">Provide feedback</a> - <a href=\"/citations?hl=en&amp;oe=ASCII\" class=\"cit-dark-link\" target=\"_top\">My Citations</a></div></div></div></div></body></html>"
```




---

## Getting data off webpages


```r
html3 <- htmlTreeParse("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en", useInternalNodes=T)
xpathSApply(html3, "//title", xmlValue)
```

```
[1] "Jeff Leek - Google Scholar Citations"
```

```r
xpathSApply(html3, "//td[@id='col-citedby']", xmlValue)
```

```
 [1] "Cited by" "338"      "171"      "140"      "133"      "107"     
 [7] "95"       "78"       "78"       "53"       "16"       "10"      
[13] "9"        "9"        "8"        "8"        "6"        "6"       
[19] "6"        "5"        "3"       
```






---

## Further resources

* Packages:
  * [httr](http://cran.r-project.org/web/packages/httr/index.html) - for working with http connections 
  * [RMySQL](http://cran.r-project.org/web/packages/RMySQL/index.html) - for interfacing with mySQL
  * [bigmemory](http://www.bigmemory.org/) - for handling data larger than RAM
  * [RHadoop](https://github.com/RevolutionAnalytics/RHadoop/wiki) - for interfacing R and Hadoop (by [Revolution Analytics](http://www.revolutionanalytics.com/))
  * [foreign](http://cran.r-project.org/web/packages/foreign/index.html) - for getting data into R from SAS, SPSS, Octave, etc. 
  
* Reading/writing R videos [Part 1](http://www.youtube.com/watch?v=aBzAels6jPk&list=PLjTlxb-wKvXNSDfcKPFH2gzHGyjpeCZmJ&index=8), [Part 2](http://www.youtube.com/watch?v=cUUqDWttMws&list=PLjTlxb-wKvXNSDfcKPFH2gzHGyjpeCZmJ&index=9)












