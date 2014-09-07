#Tutorial 2 From : http://trevorstephens.com/post/72918760617/titanic-getting-started-with-r-part-1-booting-up-r

#change working directory
setwd("~/MachineLearning/TitanicKaggle")
#import the training set
train <- read.csv("~/MachineLearning/TitanicKaggle/train.csv")

#import the test set
test <- read.csv("~/MachineLearning/TitanicKaggle/test.csv")

#set all to 0, i.e. predicting that all die
test$Survived <- 0 #same as using rep

#give genderwise data
summary(train$Sex)
prop.table(table(train$Sex, train$Survived),1)

#change all female predictions to will survive
test$Survived[test$Sex == 'female'] <- 1

#create data frame with titles same as that of kaggle format
submit <- data.frame(PassengerId = test$PassengerId, Survived = test$Survived)

#stored data in submit in CSV format and excluded row numbers
write.csv(submit, file = "AllMenMustDie.csv", row.names = FALSE)
