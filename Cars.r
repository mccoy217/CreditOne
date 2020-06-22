df<- read.csv('cars.csv')
summary(df)
str(df)
names(df)
df$name.of.car
hist(df$mph)
hist(df$dis)
qqnorm(df$speed.of.car)
names(df)<-c("make","mph","dis")
df$make<-as.character(df$make)
is.na(df)
na.omit(df)

#Training and testing sets

#set the see number
set.seed(123)

#Split the data 
trainSize<-round(nrow(df)*.7)
testSize<-nrow(df)-trainSize

#Ceate the training and test sets
training_indices<-sample(seq_len(nrow(df)),size=trainSize)
trainSet<-df[training_indices,]                        
testSet<-df[-training_indices,]

#Linear Regression Modelling

#Create the model
lm_mod<-lm(dis~ mph, trainSet)

#View model metrics
summary(lm_mod)

#R-squared is around 92% so the regression line fits the data very well
#The p-value is less than .05 so the relationship is significant

#Make Predictions

#Use the predictions function on the test set
#First set the prediction variable
predicted_dist <- predict(lm_mod, testSet)

#View the predictions
predicted_dist

#Create the linear model of the test set
predDis<-lm(lm_mod, testSet)
summary(predDis)

write.csv()

#R-squared is around 92% so the regression line fits the data very well
#The p-value is less than .05 so the relationship is significant


#confidence interval on predictions
predict(lm_mod, testSet, interval = "confidence")

#plot the data
##install tidyverse for ggplot
install.packages("tidyverse")
library(ggplot2)

######## R needs updated  ##########
install.packages("installr")
library(installr)
updateR()

#now call ggplot
library(ggplot2)

#begin plotting
ggplot(df, aes(dist))

Predicted_Distance<-data.frame(predicted_dist)


Actual_Distance <- data.frame(testSet$dis)

Comparison <- data.frame(Actual_Distance, Predicted_Distance)

write.csv(Compare)
