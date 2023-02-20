# import data from csv file
data <- read.csv("Training_Data.csv", header = TRUE, sep = ",")

# print conlumn names
colnames(data)

# create a linear model relating sleep efficiency to age
model <- lm(Sleep.efficiency ~ Age, data = data)

# print model summary
summary(model)

# plot the data
plot(data$Age, data$Sleep.efficiency, xlab = "Age", ylab = "Sleep Efficiency", main = "Sleep Efficiency vs Age")

# add the regression line
abline(model, col = "red")

#  get the predicted values
confint(model, level = 0.95)

# correlate sleep efficiency with Deep.sleep.percentage
model2 <- lm(Sleep.efficiency ~ Deep.sleep.percentage, data = data)

# print model summary
summary(model2)

# plot the data
plot(data$Deep.sleep.percentage, data$Sleep.efficiency, xlab = "Deep Sleep Percentage", ylab = "Sleep Efficiency", main = "Sleep Efficiency vs Deep Sleep Percentage")

# add the regression line
abline(model2, col = "red")

# correlate sleep efficiency with Light.sleep.percentage
model3 <- lm(Sleep.efficiency ~ Light.sleep.percentage, data = data)

# print model summary
summary(model3)

# plot the data
plot(data$Light.sleep.percentage, data$Sleep.efficiency, xlab = "Light Sleep Percentage", ylab = "Sleep Efficiency", main = "Sleep Efficiency vs Light Sleep Percentage")

# losgictic regression light sleep percentage and sleep efficiency
model4 <- glm(Sleep.efficiency ~ Light.sleep.percentage, data = data, family = "binomial")

# print model summary
summary(model4)

# plot the data
plot(data$Age, data$Sleep.efficiency, xlab = "Age", ylab = "Sleep Efficiency", main = "Sleep Efficiency vs Age")

abline(model4, col = "red")

# add the regression line
abline(model3, col = "red")

# ======================================================

# create a decision tree model
library(rpart)
library(rpart.plot)
model5 <- rpart(Sleep.efficiency ~ Age + Deep.sleep.percentage + Light.sleep.percentage, data = data, method = "class")

# print model summary
summary(model5)

# plot the model
rpart.plot(model5)

# predict sleep efficiency using the test data
test_data <- read.csv("Testing_Data.csv", header = TRUE, sep = ",")
test_data$predicted_sleep_efficiency <- predict(model5, test_data)

# print the predicted values
test_data$predicted_sleep_efficiency

# save highest predicted values per value to csv file
write.csv(test_data, "predicted_sleep_efficiency.csv")