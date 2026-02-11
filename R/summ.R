#' produce a summary from a getclass collection
#' @param cl a list of outputs of getclass
#' @param level depth in hierarchy of rxClass path
#' @examples
#' data(allcls)
#' summ(allcls)
#' @export
summ = function(cl, level=4) {
  haserr = which(sapply(cl, function(x) inherits(x, "try-error")))
  if (length(haserr)>0) cl = cl[-haserr]
  ns = sapply(cl, function(x) x$name)
  cl = sapply(cl, function(x) x$paths[[1]]$className[level])
  data.frame(rxname=ns, class=cl)
}
