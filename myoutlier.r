#Script to detect outlier from sample data.
myoutlier = function(x) {
  library(outliers)           #outliers package
  x <- as.data.frame(x)
  n <- ncol(x)
  x <- apply(x, 2, function(x) as.numeric(as.factor(x)))
  outlier_tf = outlier(x[, 1:n],logical=TRUE)
  find_outlier = which(outlier_tf==TRUE,arr.ind=TRUE)
  print(find_outlier)
}
