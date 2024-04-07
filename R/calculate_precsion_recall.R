calculate_precsion_recall <- function(accuracy){
  stopifnot( identical(class(accuracy), "metrics"))
  stopifnot((attr(accuracy, "tp")+attr(accuracy, "fp")) !=0)
  stopifnot((attr(accuracy, "tp")+attr(accuracy, "fn")) !=0)

  prec <-  attr(accuracy, "tp")/(attr(accuracy, "tp")+attr(accuracy, "fp"))
  rec <- attr(accuracy, "tp")/(attr(accuracy, "tp")+attr(accuracy, "fn"))

  matrix(c(prec,  rec), nrow=2, byrow = TRUE)
}
