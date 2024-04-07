#' Calculate precision and recall
#'
#' @description Function to calculate precision and recall based on metrics object
#'
#' @param accuracy metrics
#' @return precision and recall in a matrix of size length(thresholds)x2
#' @examples calculate_precision_recall(accuracy)
#' @export
calculate_precsion_recall <- function(accuracy){
  stopifnot( identical(class(accuracy), "metrics"))
  stopifnot((attr(accuracy, "tp")+attr(accuracy, "fp")) !=0)
  stopifnot((attr(accuracy, "tp")+attr(accuracy, "fn")) !=0)

  prec <-  attr(accuracy, "tp")/(attr(accuracy, "tp")+attr(accuracy, "fp"))
  rec <- attr(accuracy, "tp")/(attr(accuracy, "tp")+attr(accuracy, "fn"))

  matrix(c(prec,  rec), nrow=2, byrow = TRUE)
}
