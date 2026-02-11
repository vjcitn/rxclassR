#' decode a classid and provide information on the hierarchy in which it is included
#' @param classid character(1) defaults to an ATC1-4 code B01AF
#' @examples
#' getpath()
#' @export
getpath = function(classid="B01AF") {
 url = sprintf("https://rxnav.nlm.nih.gov/REST/rxclass/classContext.json?classId=%s", classid)
 ans = GET(url)
 ans
}
