#' provide a summary for a set of Rx codes that
#' might represent a patient's profile
#' @examples
#' data(costore)
#' ss = setsumm(costore[[1]])
#' @export
setsumm = function(codes, level=2, sleeptime=1) {
  cl = lapply(codes, function(x) {
     Sys.sleep(sleeptime)
     getclass(x)
  })
  ns = sapply(cl, function(x) x$name)
  cl = sapply(cl, function(x) x$paths[[1]]$className[level])
  data.frame(rxname=ns, class=cl)
}


