# import data from csv file
data <- read.csv("Training_Data.csv", header = TRUE, sep = ",")

# print conlumn names
colnames(data)

# in the Smoking.status column, replace "Yes" with 1 and "No" with 0
data$Smoking.status <- as.numeric(data$Smoking.status == "Yes")

# ======================================================

# create a decision tree model
library(rpart)
library(rpart.plot)
model5 <- rpart(Sleep.efficiency ~ Age + Alcohol.consumption + Smoking.status, data = data, method = "class")

# print model summary
summary(model5)

# plot the model
rpart.plot(model5)

# predict sleep efficiency using the test data
test_data <- read.csv("Testing_Data.csv", header = TRUE, sep = ",")

# replace "Yes" with 1 and "No" with 0
test_data$Smoking.status <- as.numeric(test_data$Smoking.status == "Yes")

test_data$predicted_sleep_efficiency <- predict(model5, test_data)

# print the predicted values
test_data$predicted_sleep_efficiency

# get MSE of predicted values
MSE <- mean((test_data$Sleep.efficiency - test_data$predicted_sleep_efficiency)^2)

# print MSE
MSE

# save highest predicted values per value to csv file
write.csv(test_data, "predicted_s_effi_smoke_alch_no_age.csv")