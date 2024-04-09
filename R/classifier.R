library(caret)
#' Binary classification
#'
#' @description function for training model and classifying test data
#'
#' @param training_x input for model training
#' @param training_y expected output (true value)
#' @param testing input for model testing
#' @return classification of testing vector
#' @examples classifier(training_x, training_y, testing)
#' @export

classifier <- function(training_x, training_y, testing){
  fitControl <- trainControl(## 10-fold CV
    method = "repeatedcv",
    number = 10,
    ## repeated ten times
    repeats = 10)
  gbmFit1 <- caret::train(training_x, training_y,
                   method = 'glm',
                   trControl = fitControl)
  predictions <- predict (gbmFit1, newdata = testing, type = "prob")
}
