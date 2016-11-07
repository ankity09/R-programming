#####     DS_Titatnic     ######

# Set Working Directory and Import Datasets
setwd("C:/Users/AY186021/Desktop/DS/Titanic")

train <- read.csv("C:/Users/AY186021/Desktop/DS/Titanic/train.csv")
test <- read.csv("C:/Users/AY186021/Desktop/DS/Titanic/test.csv")

View(train)
View(test)


str(train) #Compactly Display the Structure of an Arbitrary R Object

table(train$Survived) #table uses the cross-classifying factors to build a contingency table of the counts at each combination of factor levels

prop.table(table(train$Survived)) #Express Table Entries as Fraction of Marginal Table

test$Survived <- rep(0,418) #Insert Column named Survived in test table with value 0 for all 418 rows

submit <- data.frame(PassengerId = test$PassengerId, Survived = test$Survived) #Create a dataframe "submit" with only the PassengerId and Survived columns from test

write.csv(submit, file="theyallperish.csv", row.names = FALSE) #Create a CSV file named "theyallperish.csv" with the submit dataframe and no row names

