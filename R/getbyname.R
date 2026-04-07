#' rough approach to dealing with names for rx without functioning RXCUI
#' @param name a string
#' @export
getbyname = function (name="lovastatin", filter = TRUE)
{
    stopifnot(is.atomic(name))
    stopifnot(length(name) == 1)
    ans = try(GET(sprintf("https://rxnav.nlm.nih.gov/REST/rxclass/class/byDrugName.json?drugName=%s&relaSource=ATC",
        name)))
    if (inherits(ans, "try-error"))
        stop("GET to rxnav failed, request limit exceeded?")
    cont = content(ans)
    #cuis = con2rxcui(cont)
    #cty = con2rxitem(cont, itemtype = "classType")
    cna = rxclassR:::con2rxitem(cont, itemtype = "className")
    cid = rxclassR:::con2rxitem(cont, itemtype = "classId")
    #ansdf = data.frame(rxcui = cuis, classtype = cty, classname = cna,
    #    classid = cid)
    #atcdf = ansdf[which(ansdf$classtype == "ATC1-4"), ]
    #pa = list()
    #if (addPaths & nrow(atcdf) > 0)
    #    pa = lapply(unique(atcdf$classid), getpath)
    #if (atcOnly)
    #    ansdf = atcdf
    #list(input = name, classinfo = ansdf,
    #    paths = pa)
    list(name=name, cna=cna, cid=cid)
}

