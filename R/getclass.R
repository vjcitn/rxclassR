#' given rxcui, produce a list from rxclass 'byRxcui'
#' @param num a numeric identifier for a drug
#' @param filter logical(1), if TRUE, will extract only the elements with 'minConcept$rxcui' matching `num`
#' @param atcOnly logical(1), if TRUE (default) will confine attention to class in ATC1-4, for producing paths
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
 cuis = con2rxcui(cont) # vector of matching rxcui that need not agree with num
 cty = con2rxitem(cont, itemtype="classType")
 cna = con2rxitem(cont, itemtype="className")
 cid = con2rxitem(cont, itemtype="classId")
 ansdf = data.frame(rxcui=cuis, classtype=cty, classname=cna, classid=cid)
 atcdf = ansdf[which(ansdf$classtype == "ATC1-4"),]
 pa = list()
 if (addPaths & nrow(atcdf)>0) pa = lapply(unique(atcdf$classid), getpath)
 if (atcOnly) ansdf = atcdf
 list(input=num, name=id2name(num), classinfo=ansdf, paths=pa)
}

