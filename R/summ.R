#' produce a summary from a getclass collection
#' @param cl a list of outputs of getclass
#' @param level depth in hierarchy of rxClass path
#' @examples
#' data(allcls)
#' summ(allcls[[1]])
#' @export
summ = function(cl, level=4) {
  haserr = which(sapply(cl, function(x) inherits(x, "try-error")))
  if (length(haserr)>0) cl = cl[-haserr]
  rows = lapply(cl, function(x) {
    classes = sapply(x$paths, function(p) p$className[level])
    data.frame(rxname=x$name, rxclass=classes, level=level, stringsAsFactors=FALSE)
  })
  do.call(rbind, rows)
}
