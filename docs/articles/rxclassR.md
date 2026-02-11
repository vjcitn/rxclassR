<div id="main" class="col-md-9" role="main">

# rxclassR: use the NIH rxclass API for drug classification

<div class="section level2">

## Introduction

We will use the API at `https://rxnav.nlm.nih.gov/REST/rxclass` as
defined in early 2026 to simplify classification of drugs.

We will assume that an `rxcui` identifier is available for any drug of
interest.

This package is not designed to do large scale interrogation of the API,
which might lead to banning the host IP address for overuse. Any loops
should include sleep directives.

</div>

<div class="section level2">

## Obtaining classification codes

The endpoint `rxclass/class/byRxcui` is very inclusive and will return
information on multiple related compounds. The `filter` argument forces
focus on the compound rxcui supplied.

<div id="cb1" class="sourceCode">

``` r
library(rxclassR)
getclass(1364447, filter=TRUE)
```

</div>

    ## $input
    ## [1] 1364447
    ## 
    ## $items
    ##           [,1]                         
    ## classId   "B01AF"                      
    ## className "Direct factor Xa inhibitors"
    ## classType "ATC1-4"                     
    ## 
    ## $paths
    ## $paths$classId
    ##       [,1]                          [,2]                   
    ## code  "B01AF"                       "B01A"                 
    ## label "Direct factor Xa inhibitors" "ANTITHROMBOTIC AGENTS"
    ## base  "ATC1-4"                      "ATC1-4"               
    ##       [,3]                    [,4]                            
    ## code  "B01"                   "B"                             
    ## label "ANTITHROMBOTIC AGENTS" "BLOOD AND BLOOD FORMING ORGANS"
    ## base  "ATC1-4"                "ATC1-4"                        
    ##       [,5]                             
    ## code  "0"                              
    ## label "Anatomical Therapeutic Chemical"
    ## base  "ATC1-4"

</div>

<div class="section level2">

## Learning about the hierarchy of a given class

Here we assume the argument is a potential class code known to the
rxclass API.

<div id="cb3" class="sourceCode">

``` r
getpath("B01AF")
```

</div>

    ##       [,1]                          [,2]                   
    ## code  "B01AF"                       "B01A"                 
    ## label "Direct factor Xa inhibitors" "ANTITHROMBOTIC AGENTS"
    ## base  "ATC1-4"                      "ATC1-4"               
    ##       [,3]                    [,4]                            
    ## code  "B01"                   "B"                             
    ## label "ANTITHROMBOTIC AGENTS" "BLOOD AND BLOOD FORMING ORGANS"
    ## base  "ATC1-4"                "ATC1-4"                        
    ##       [,5]                             
    ## code  "0"                              
    ## label "Anatomical Therapeutic Chemical"
    ## base  "ATC1-4"

</div>

</div>
