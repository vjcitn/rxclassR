con2rxitem = function(x, itemtype="classType") {
  stopifnot(itemtype %in% c("classType", "className", "classId"))
  sapply(x[[1]][[1]], function(z) z$rxclassMinConceptItem[[itemtype]])
}

con2rxcui = function(x) sapply(x[[1]][[1]], function(z) z$minConcept$rxcui)

id2name = function(x=1364446) {
  url = sprintf("https://rxnav.nlm.nih.gov/REST/rxcui/%s/properties.json", x)
  g = httr::GET(url)
  cc = content(g)
  cc$properties$name
}
