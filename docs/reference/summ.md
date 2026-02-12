<div id="main" class="col-md-9" role="main">

# produce a summary from a getclass collection

<div class="ref-description section level2">

produce a summary from a getclass collection

</div>

<div class="section level2">

## Usage

<div class="sourceCode">

``` r
summ(cl, level = 4)
```

</div>

</div>

<div class="section level2">

## Arguments

-   cl:

    a list of outputs of getclass

-   level:

    depth in hierarchy of rxClass path

</div>

<div class="section level2">

## Examples

<div class="sourceCode">

``` r
data(allcls)
summ(allcls[[1]])
#>                                               rxname
#> 1              cholecalciferol 0.025 MG Oral Capsule
#> 2                            apixaban 5 MG [Eliquis]
#> 3          albuterol Metered Dose Inhaler [Ventolin]
#> 4 dabigatran etexilate 150 MG Oral Capsule [Pradaxa]
#> 5                 losartan potassium 100 MG [Cozaar]
#> 6                           alendronate Oral Product
#>                           rxclass level
#> 1 ALIMENTARY TRACT AND METABOLISM     4
#> 2  BLOOD AND BLOOD FORMING ORGANS     4
#> 3              RESPIRATORY SYSTEM     4
#> 4  BLOOD AND BLOOD FORMING ORGANS     4
#> 5           CARDIOVASCULAR SYSTEM     4
#> 6         MUSCULO-SKELETAL SYSTEM     4
```

</div>

</div>

</div>
