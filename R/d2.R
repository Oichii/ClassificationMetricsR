#' Dataset for classification testing
#'
#' Data on cases filed in 1990, in which refugee claimants rejected by the Canadian
#' Immigration and Refugee Board asked the Federal Court of Appeal for leave to appeal the negative ruling of the Board.
#'
#' @docType data
#' @usage data(d2)
#' @format dataframe with 384 rows and 3 columns
#' \describe{
#'  \item{judge}{Name of judge hearing case. A factor with levels: Desjardins, Heald, Hugessen, Iacobucci, MacGuigan, Mahoney, Marceau, Pratte, Stone, Urie.}
#'  \item{location}{Location of original refugee claim. A factor with levels: Montreal, other, Toronto.}
#'  \item{decision}{Judge's decision. A factor with levels: no, leave to appeal not granted; yes, leave to appeal granted.}
#' }
#' @keywords datasets d2
#' @examples histogram(d2$decision)
"d2"
