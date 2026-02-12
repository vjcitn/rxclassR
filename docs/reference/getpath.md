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

## Value

a matrix with three rows

</div>

<div class="section level2">

## Examples

<div class="sourceCode">

``` r
getpath()
#>   classId                       className classType
#> 1   B01AF     Direct factor Xa inhibitors    ATC1-4
#> 2    B01A           ANTITHROMBOTIC AGENTS    ATC1-4
#> 3     B01           ANTITHROMBOTIC AGENTS    ATC1-4
#> 4       B  BLOOD AND BLOOD FORMING ORGANS    ATC1-4
#> 5       0 Anatomical Therapeutic Chemical    ATC1-4
```

</div>

</div>

</div>
