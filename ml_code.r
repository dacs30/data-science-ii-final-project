# import data from csv file
data <- read.csv("Sleep_Efficiency.csv", header = TRUE, sep = ",")

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