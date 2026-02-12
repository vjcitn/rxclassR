<div id="main" class="col-md-9" role="main">

# produce an upset plot for drug categories based on output of \`summ\` applied to multiple prescription series

<div class="ref-description section level2">

produce an upset plot for drug categories based on output of \`summ\`
applied to multiple prescription series

</div>

<div class="section level2">

## Usage

<div class="sourceCode">

``` r
make_upset(drugdf, nsets_in = 7, nintersects_in = 8, maxlablength = 22)
```

</div>

</div>

<div class="section level2">

## Arguments

-   drugdf:

    a data.frame as produced by \`summ\`

-   nsets\_in:

    passed to nsets of upset()

-   nintersects\_in:

    passed to nsets of upset()

-   maxlablength:

    numeric default to 22, class labels longer than this will be
    presented via substring

</div>

<div class="section level2">

## Examples

<div class="sourceCode">

``` r
data(allcls)
thes = lapply(allcls, summ, 3)
for (i in seq_len(length(allcls))) thes[[i]]$id = i
ddf = do.call(rbind, thes)
make_upset(ddf)
```

</div>

</div>

</div>
