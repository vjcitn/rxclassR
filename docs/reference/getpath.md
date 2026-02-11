<div id="main" class="col-md-9" role="main">

# decode a classid and provide information on the hierarchy in which it is included

<div class="ref-description section level2">

decode a classid and provide information on the hierarchy in which it is
included

</div>

<div class="section level2">

## Usage

<div class="sourceCode">

``` r
getpath(classid = "B01AF")
```

</div>

</div>

<div class="section level2">

## Arguments

-   classid:

    character(1) defaults to an ATC1-4 code B01AF

</div>

<div class="section level2">

## Examples

<div class="sourceCode">

``` r
getpath()
#>       [,1]                          [,2]                   
#> code  "B01AF"                       "B01A"                 
#> label "Direct factor Xa inhibitors" "ANTITHROMBOTIC AGENTS"
#> base  "ATC1-4"                      "ATC1-4"               
#>       [,3]                    [,4]                            
#> code  "B01"                   "B"                             
#> label "ANTITHROMBOTIC AGENTS" "BLOOD AND BLOOD FORMING ORGANS"
#> base  "ATC1-4"                "ATC1-4"                        
#>       [,5]                             
#> code  "0"                              
#> label "Anatomical Therapeutic Chemical"
#> base  "ATC1-4"                         
```

</div>

</div>

</div>
