#' helper in channing system
#' @export
getcodesNOURISHbase = function() {
 ans = try(haven::read_sas("~stmst00/datasets/basemedusage_all.sas7bdat"))
 if (inherits(ans, "try-error")) stop("only working on stmst00-enabled channing account")
 ans
}

