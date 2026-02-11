<div id="main" class="col-md-9" role="main">

# given rxcui, produce a list from rxclass 'byRxcui'

<div class="ref-description section level2">

given rxcui, produce a list from rxclass 'byRxcui'

</div>

<div class="section level2">

## Usage

<div class="sourceCode">

``` r
getclass(num, filter = TRUE)
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

</div>

<div class="section level2">

## Examples

<div class="sourceCode">

``` r
chk = getclass(1364447)
length(chk)
#> [1] 2
```

</div>

</div>

</div>
