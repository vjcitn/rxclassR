#' decode a classid and provide information on the hierarchy in which it is included
#' @param classid character(1) defaults to an ATC1-4 code B01AF
#' @return a matrix with three rows
#' @examples
#' getpath()
#' @export
getpath = function(classid="B01AF") {
 stopifnot(length(classid)==1)
 stopifnot(is.atomic(classid))
 url = sprintf("https://rxnav.nlm.nih.gov/REST/rxclass/classContext.json?classId=%s", classid)
 ans = GET(url)
 cans = content(ans)
 stopifnot(names(cans)=="classPathList")
 ans = cans[[1]][[1]][[1]] |> sapply(unlist, recursive=FALSE) |> matrix(nrow=3)
 rownames(ans) = c("code", "label", "base")
 ans
}
