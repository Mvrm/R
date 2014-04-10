# Outlier detection function using R

outlier_test = function(x) {
  library(DMwR)                     # package
  x <- as.data.frame(x)
  n <- ncol(x)
  x <- apply(x, 2, function(x) as.numeric(as.factor(x)))    # Data conversion into Numeric
  outlier_score <- lofactor(x[ ,1:n], k=5)
  print(outlier_score)
  outliers <- order(outlier_score, decreasing=T)[1:5]
  print(outliers)
}
