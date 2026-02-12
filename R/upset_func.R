## Load required packages
#library(tidyverse)
#library(UpSetR)
#
## Read the data
#drug_data <- read.csv("mydat.csv")
#
#' produce an upset plot for drug categories based
#' on output of `summ` applied to multiple prescription
#' series
#' @import tidyverse
#' @import UpSetR
#' @import dplyr
#' @import tidyr
#' @param drugdf a data.frame as produced by `summ`
#' @param nsets_in passed to nsets of upset()
#' @param nintersects_in passed to nsets of upset()
#' @param maxlablength numeric default to 22, class labels longer than this will be presented via substr
#' @examples
#' data(allcls)
#' thes = lapply(allcls, summ, 3)
#' for (i in seq_len(length(allcls))) thes[[i]]$id = i
#' ddf = do.call(rbind, thes)
#' make_upset(ddf)
#' @export
make_upset = function(drugdf, nsets_in=7, nintersects_in=8, maxlablength=32) {
  stopifnot(all(c("id", "rxclass") %in% names(drugdf)))
  drugdf$rxclass = substr(drugdf$rxclass, 1, maxlablength)
  drug_data_unique <- drugdf %>%
    select(id, rxclass) %>%
    distinct()
  
  # Create a binary matrix where each row is an individual 
  # and each column is a drug class
  # Value is 1 if the person takes that drug class, 0 otherwise
  upset_matrix <- drug_data_unique %>%
    mutate(value = 1) |>
    pivot_wider(
      id_cols = id,
      names_from = rxclass,
      values_from = value,
      values_fill = 0
    )
  upset(
    as.data.frame(upset_matrix[, -1]),  # Exclude the id column
 #   sets = colnames(upset_matrix)[-1],   # All drug classes
    nsets = nsets_in,
    nintersects = nintersects_in,
    keep.order = FALSE,
    order.by = "freq",                   # Order by frequency
    decreasing = TRUE,
    mainbar.y.label = "Number of Individuals",
    sets.x.label = "Total Individuals per Drug Class",
    text.scale = c(1.5, 1.3, 1.2, 1.1, 1.5, 1.2),  # Adjust text sizes
    point.size = 4,
    line.size = 1.5,
    set_size.show = TRUE,
    set_size.scale_max = max(colSums(upset_matrix[, -1])) + 1
  )
}

##m1 = make_upset(drug_data)
