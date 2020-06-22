############Iris Dataset work################
install.packages('readr')

#call the readr library
library('readr')

#read the dataset

IrisDataSet <- read.csv('iris.csv')

#get familiar the data
attributes(IrisDataSet)
summary(IrisDataSet)
str(IrisDataSet)
names(IrisDataSet)

#plot a histogram, cannot plot hist with factor so plot a bar

species_counts <-table(IrisDataSet$Species)

barplot(species_counts, main = "Species Distribution", xlab="Number of Species")

#make a scatter plot. the 'close' parenthesis was missing in the task
plot(IrisDataSet$Sepal.Length)

#plot the quantiles
qqnorm(IrisDataSet$Sepal.Length, main = "Sepal Length")
qqnorm(IrisDataSet$Sepal.Width, main = "Sepal Width")
qqnorm(IrisDataSet$Petal.Length, main = "Petal Length")
qqnorm(IrisDataSet$Petal.Width, main = "Petal Width")

#convert the species column to numeric
IrisDataSet$Species<- as.numeric(IrisDataSet$Species)

#Set the seed
set.seed(123)

#define training and test size, first had error


trainSize<-round(nrow(IrisDataSet)*.7)
testSize<-nrow(IrisDataSet)-trainSize

trainSize
testSize

##Ceate the training and test sets
training_indices<-sample(seq_len(nrow(IrisDataSet)),size=trainSize)
trainSet <-IrisDataSet[training_indices,]
testSet <-IrisDataSet[-training_indices,]

#define the model
LinearModel<-lm(trainSet$Petal.Width ~ trainSet$Petal.Length)
LM2 <-lm(Petal.Width ~ Petal.Length, trainSet)

summary(LinearModel)
summary(LM2)

#The two above models have different syntax but produce the same result

prediction<-predict(LM2, testSet)
prediction

Petal_Width_Predictions<-data.frame(prediction)

final <-data.frame(Actual_Pedal_Width=testSet$Petal.Width, Predicted_Length=prediction)
head(final)

write.csv(final, 'final.csv')

