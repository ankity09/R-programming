#####     DS_Titatnic     ######
#####     The Gender-Class Model     #####

# Set Working Directory and Import Datasets
setwd("/Users/Ankit/Desktop/Data Sciences/R_Dir")

train <- read.csv("/Users/Ankit/Desktop/Data Sciences/R_Dir/train.csv")
test <- read.csv("/Users/Ankit/Desktop/Data Sciences/R_Dir/test.csv")

View(train)
View(test)

summary(train$Sex)

prop.table(table(train$Sex, train$Survived)) # Express Table Entries as Fraction of Marginal Table

prop.table(table(train$Sex, train$Survived),1) # Express Table Entries as Fraction of Marginal Table, the "1" does the fraction on individual rows and not the entire table

test$Survived <- 0 # Create new column in "test" dataset and assign all rows 0
test$Survived[test$Sex == 'female'] <- 1 # Assign 1 in cloumn "Survived" where the "Sex" is 'female'

summary(train$Age) # Get summary for column "Age" in "train" dataset

train$Child <- 0 
train$Child[train$Age < 18] <- 1

aggregrate(Survived ~ Child + Sex, data = train, FUN = sum)

aggregrate(Survived ~ Child + Sex, data = train, FUN = length)

aggregrate(Survived ~ Child + Sex, data = train, FUN = function(x) {sum(x) / length(x)})

train$Fare2 <- '30+'
train$Fare2[train$Fare < 30 & train$Fare >= 20] <- '20-30'
train$Fare2[train$Fare < 20 & train$Fare >= 10] <- '10-20'
train$Fare2[train$Fare < 10 ] <- '<10'

aggregrate(Survived ~ Fair2 + Child + Sex, data = train, FUN = function(x) {sum(x) / length(x) } )

test$Survived <- 0
test$Survived[test$Sex == 'female'] <- 1
test$Survived[test$Sex == 'female' & test$Pclass == 3 & test$Fare >= 20  ] <- 0