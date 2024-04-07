#' Calculate Accuracy
#'
#' @description Function to calculate accuracy based on ground truth and
#' predicted probability. First threshold is applied and then mean accuracy
#' across samples is calculated. Function also calculates number of true positive, false positive, true negative and false negative examples.
#'
#' @param true_val ground truth values in range {0, 1}
#' @param pred_val predicted probability in range [0, 1]
#' @param threshold probability threshold, can be a single value or a vector, default 0.5
#'
#' @return mean accuracy
#' @examples  calculate_accuracy(true_val, pred_val) or calculate_accuracy(true_val, pred_val, threshold)
#' @export

calculate_accuracy <- function(true_val, pred_val, threshold=0.5){
  stopifnot(is.numeric(true_val))
  stopifnot(is.numeric(pred_val))
  stopifnot(is.numeric(threshold))

  stopifnot(length(true_val)==length(pred_val))

  stopifnot(!any(pred_val>1))
  stopifnot(!any(pred_val<0))
  stopifnot(true_val==1 | true_val ==0)

  thresholded = as.matrix(sapply(threshold, function(t) as.integer(pred_val > t)))
  accuracy <- apply(as.matrix(thresholded == true_val), 2, mean)

  tp <- apply(as.matrix(true_val[true_val == 1] == thresholded[true_val == 1,]), 2, sum)
  tn <- apply(as.matrix(true_val[true_val == 0] == thresholded[true_val == 0,]), 2, sum)
  fn <- apply(as.matrix(true_val[true_val == 1] != thresholded[true_val == 1,]), 2, sum)
  fp <- apply(as.matrix(true_val[true_val == 0] != thresholded[true_val == 0,]), 2, sum)

  attr(accuracy, "class") <- "metrics"
  attr(accuracy, "tp") <- tp
  attr(accuracy, "tn") <- tn
  attr(accuracy, "fp") <- fp
  attr(accuracy, "fn") <- fn
  accuracy

}
