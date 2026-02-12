<div id="main" class="col-md-9" role="main">

# given rxcui, produce a list from rxclass 'byRxcui'

<div class="ref-description section level2">

given rxcui, produce a list from rxclass 'byRxcui'

</div>

<div class="section level2">

## Usage

<div class="sourceCode">

``` r
getclass(num, filter = TRUE, atcOnly = TRUE, addPaths = TRUE)
```

</div>

</div>

<div class="section level2">

## Arguments

-   num:

    a numeric identifier for a drug

-   filter:

    logical(1), if TRUE, will extract only the elements with
    'minConcept$rxcui' matching \`num\`

-   atcOnly:

    logical(1), if TRUE (default) will confine attention to class in
    ATC1-4, for producing paths

</div>

<div class="section level2">

## Value

a list with elements input (the identifier), items (a matrix with three
rows: classId, className, classType), and paths (output of getpath for
the discovered classId, describing path upward through hierarchy)

</div>

<div class="section level2">

## Examples

<div class="sourceCode">

``` r
chk = getclass(1364447)
str(chk)
#> List of 4
#>  $ input    : num 1364447
#>  $ name     : chr "apixaban 5 MG Oral Tablet [Eliquis]"
#>  $ classinfo:'data.frame':   5 obs. of  4 variables:
#>   ..$ rxcui    : chr [1:5] "1364430" "1364445" "1364447" "1992427" ...
#>   ..$ classtype: chr [1:5] "ATC1-4" "ATC1-4" "ATC1-4" "ATC1-4" ...
#>   ..$ classname: chr [1:5] "Direct factor Xa inhibitors" "Direct factor Xa inhibitors" "Direct factor Xa inhibitors" "Direct factor Xa inhibitors" ...
#>   ..$ classid  : chr [1:5] "B01AF" "B01AF" "B01AF" "B01AF" ...
#>  $ paths    :List of 1
#>   ..$ :'data.frame': 5 obs. of  3 variables:
#>   .. ..$ classId  : chr [1:5] "B01AF" "B01A" "B01" "B" ...
#>   .. ..$ className: chr [1:5] "Direct factor Xa inhibitors" "ANTITHROMBOTIC AGENTS" "ANTITHROMBOTIC AGENTS" "BLOOD AND BLOOD FORMING ORGANS" ...
#>   .. ..$ classType: chr [1:5] "ATC1-4" "ATC1-4" "ATC1-4" "ATC1-4" ...
```

</div>

</div>

</div>
