#' helper in channing system
#' @export
getcodesNOURISHbase = function() {
 ans = try(haven::read_sas("~stmst00/datasets/basemedusage_all.sas7bdat"))
 if (inherits(ans, "try-error")) stop("only working on stmst00-enabled channing account")
 ans
}

#' given rxcui, produce a list from rxclass 'byRxcui'
#' @param num a numeric identifier for a drug
#' @param filter logical(1), if TRUE, will extract only the elements with 'minConcept$rxcui' matching `num`
#' @param atcOnly logical(1), if TRUE (default) will confine attention to class in ATC1-4
#' @return a list with elements input (the identifier),
#' items (a matrix with three rows: classId, className, classType), and paths
#' (output of getpath for the discovered classId, describing path upward through hierarchy)
#' @examples
#' chk = getclass(1364447)
#' str(chk)
#' @export
getclass = function(num, filter=TRUE, atcOnly=TRUE, addPaths=TRUE) {
 stopifnot(is.atomic(num))
 stopifnot(length(num)==1)
 ans = try(GET(sprintf("https://rxnav.nlm.nih.gov/REST/rxclass/class/byRxcui.json?rxcui=%s", num)))
 if (inherits(ans, "try-error")) stop("GET to rxnav failed, request limit exceeded?")
 cont = content(ans)
 if (filter) {
   chk = sapply(cont[[1]][[1]], function(x) x$minConcept) # returns 3 x number of entities matched
   kp = which(chk[1,] == as.character(num))
   if (length(kp)==0) stop("no matches in minConcept component")
   items = sapply(cont[[1]][[1]][kp], function(x) unlist(x$rxclassMinConceptItem)) # or matrix will have list columns!
   chk = chk[,kp]
   #return(list(concepts=chk, items=items))
   if (atcOnly) items = items[,which(items["classType",]=="ATC1-4"),drop=FALSE]
  }
  pa = list()
  if (addPaths) pa = lapply(items["classId",], getpath)
  list(input=num, items=items, paths=pa)
}

