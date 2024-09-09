
#Load the data and inspect it:
data <- student.por
str(data)


#Encode the categorical variables as needed:
data$schoolsup <- as.factor(data$schoolsup)

#Split the data into training and testing sets:
library(caret)
set.seed(123)
trainIndex <- createDataPartition(data$schoolsup, p = 0.8, list = FALSE)
train_data <- data[trainIndex, ]
test_data <- data[-trainIndex, ]

#Fit the Logistic Regression model:
library(glm2)
model <- glm(schoolsup ~ ., data = train_data, family = "binomial")

#Evaluate the model's performance on the test set:
predictions <- predict(model, newdata = test_data, type = "response")
predicted_class <- ifelse(predictions > 0.5, "yes", "no")

library(caret)
confusionMatrix(as.factor(predicted_class), test_data$schoolsup)

#Interpret the model coefficients and feature importance:
summary(model)


