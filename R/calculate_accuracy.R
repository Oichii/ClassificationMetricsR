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
