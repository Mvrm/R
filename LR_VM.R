# Reading train and test data

train <- read.csv("~/Desktop/train.csv")

test <- read.csv("~/Desktop/test.csv")

# Build Logistic Regression model on training data

model <- glm(Target ~ utilization + F_size + c_index + F_priority + Duration + state + CPU + Memory + Disk, data=train, binomial(link="logit"))

# Test model on testing data

predictions <- predict.glm(model, test, type="response")

# set the range of the predicted value

target <- cut(predictions, c(-Inf,0.5,Inf), labels=c("0","1"))

# Attach the predicted value in test data

test["target"] <- target

# Update the Table

write.table(test, "~/Desktop/test.csv", sep=",")
