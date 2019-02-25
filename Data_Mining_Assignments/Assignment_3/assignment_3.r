# 
# Tittle: Assignment 3
# Author: Ankit Yadav
#
library(ROCR)
library(ggplot2)
voter.data <- read.csv("/Users/ankityadav/Desktop/Spring_2019/DMPA/Assignments/Assignment 2/VoterPref.csv")
voter.data$PREFERENCE <- factor(voter.data$PREFERENCE, levels = c('For','Against'))
voter.data$PREFERENCE <- as.numeric(voter.data$PREFERENCE)-1

#Set Seed and Partiton Data Randomly
set.seed(71923)
Train <- sample(nrow(voter.data), 0.7*nrow(voter.data))
train.data <- data.frame(voter.data[Train,])
test.data <- data.frame(voter.data[-Train,])
summary(train.data)
str(train.data)

#Logistic Regression Model
logistic.model <- glm(PREFERENCE ~ AGE + INCOME + GENDER, data = train.data, family = 'binomial')
summary(logistic.model)

predictprob.log.train <- predict(logistic.model, type = 'response')
predictprob.log.test <- predict(logistic.model, newdata = test.data, type = 'response')

actual.train <- train.data$PREFERENCE
actual.test <- test.data$PREFERENCE
predictclass.log.train <- ifelse(predictprob.log.train > 0.5, 1 , 0)
predictclass.log.test <- ifelse(predictprob.log.test > 0.5, 1 , 0)
train.data$PREDICTED <- predictprob.log.train
test.data$PREDICTED <- predictprob.log.test

(table.train <- table(actual.train,predictclass.log.train))
(table.test <- table(actual.test,predictclass.log.test))

#Performance Metrics
perfomrance.metrics <- function(x,y,z){
  metrics <- c('Accuracy','Sensitivity','Specificity','Error Rate', 'PPV','NP')
  acc <- sum(x == y)/nrow(z)
  sens <- sum(x == 1 & y == 1)/sum(x == 1)
  speci <- sum(x == 0 & y == 0)/sum(x == 0)
  er <- 1 - acc
  ppv <- sum(x == 1 & y == 1)/sum(y == 1)
  npv <- sum(x == 0 & y == 0)/sum(y == 0)
  values <- c(acc,sens,speci,er,ppv,npv)
  X <- data.frame(metrics,values)
  X
}

perfomrance.metrics(actual.train, predictclass.log.train, train.data)
perfomrance.metrics(actual.test, predictclass.log.test, test.data)

train.accuracy <- sum(actual.train == predictclass.log.train)/nrow(train.data)

#ROC
pred.train <- prediction(predictprob.log.train,train.data$PREFERENCE) # Training data
perf.train <- performance(pred.train, "tpr", "fpr" ) # ROC Curve

pred.test <- prediction(predictprob.log.test, test.data$PREFERENCE) # Testing data
perf.test <- performance( pred.test, "tpr", "fpr" ) # ROC Curve
plot(perf.train ,col="blue", main = "ROC Curves")
plot(perf.test,col="green",add = TRUE)
abline(a = 0, b = 1, lty = 2,col="red")
legend("bottomright", c("Train","Test"), lty = 1, col = c("blue","green"), bty="n")

x <- performance(pred.train,"acc",x.measure = "cutoff")
y <- performance(pred.test,"acc",x.measure = "cutoff")
plot(x,col = "red", main = "Accuracy vs Cutoff")
plot(y,col = "black", add = TRUE)
legend("bottomright", c("Train","Test"), lty = 1, col = c("red","black"), bty="n")


###########################
# Get maximum value of Accuracy 
accuracy.data.train <- data.frame(Cutoff = rep(0,10),Accuracy = rep(0,10))
for (i in seq(from = 0, to = 10, by = 1)) {
  class.log.train <- ifelse(predictprob.log.train>i/10,1,0)
  train.accuracy <- sum(actual.train == class.log.train)/nrow(train.data)
  accuracy.data.train[i,] <- c(i/10,train.accuracy)
}
accuracy.data.train[which.max(accuracy.data.train$Accuracy),]
accuracy.data.train

accuracy.data.test <- data.frame(Cutoff = rep(0,10),Accuracy = rep(0,10))
for (i in seq(from = 1, to = 10, by = 1)) {
  class.log.test <- ifelse(predictprob.log.test>i/10,1,0)
  test.accuracy <- sum(actual.test == class.log.test)/nrow(test.data)
  accuracy.data.test[i,] <- c(i/10,test.accuracy)
}
accuracy.data.test[which.max(accuracy.data.test$Accuracy),]
accuracy.data.test

##############################################
#Misclassification Cost
misclass.cost.train <- data.frame(Cutoff = rep(0,10),Cost = rep(0,10))
for (i in 1:10) {
  predict.class.train <- ifelse(predictprob.log.train>i/10,1,0)
  false.negative <- sum(actual.train == 1 & predict.class.train == 0) * 1
  false.positive <- sum(actual.train == 0 & predict.class.train == 1) * 4
  misclass.cost.train[i,] <- c(i/10,false.negative + false.positive)
}
misclass.cost.train[which.min(misclass.cost.train$Cost),]
misclass.cost.train


misclass.cost.test <- data.frame(Cutoff = rep(0,10),Cost = rep(0,10))
for (i in 1:10) {
  predict.class.test <- ifelse(predictprob.log.test>i/10,1,0)
  false.negative <- sum(actual.test == 1 & predict.class.test == 0) * 1
  false.positive <- sum(actual.test == 0 & predict.class.test == 1) * 4
  misclass.cost.test[i,] <- c(i/10,false.negative + false.positive)
}
misclass.cost.test[which.min(misclass.cost.test$Cost),]
misclass.cost.test

########################################


#Decile wise chart
decile_Lift <- function(df) {
  #Sort the dataframe
  df <- df[order(-df$PREDICTED),]
  
  #Add rownumbers
  df$roworder <- 1:nrow(df)
  
  #Create a variable that holds the baseline successes for each decile
  baseline <- sum(df$PREFERENCE) / 10
  
  #Assign decile
  df$decile <- ceiling((df$roworder / nrow(df)) * 10)
  
  #Count successes in each decile
  
  library("data.table")
  dt <- data.table(df)
  dt <- dt[, sum(PREFERENCE), by = decile]
  dt$baseline <- baseline
  
  #Plot bargraph
  barplot(t(data.frame(dt$V1,dt$baseline)), main="Decile wise comparision of successes", xlab="Deciles", col=c("darkblue","red"), beside=TRUE, names=dt$decile)
  barplot(t(data.frame(dt$V1)/data.frame(dt$baseline)), main="Decile wise comparision of successes", xlab="Deciles", col=c("darkblue"), beside=TRUE, names=dt$decile)
}
decile_Lift(train.data)   ## Training
decile_Lift(test.data)  ## Validation


#Lift Chart
df1 <- data.frame(predictprob.log.train,train.data$PREFERENCE)
df1S <- df1[order(-predictprob.log.train),]
df1S$Gains <- cumsum(df1S$train.data.PREFERENCE)
plot(df1S$Gains,type="n",main="Training Data Lift Chart",xlab="Number of Cases",ylab="Cumulative Success")
lines(df1S$Gains)
abline(0,sum(df1S$train.data.PREFERENCE)/nrow(df1S),lty = 2, col="red")

df <- data.frame(predictprob.log.test,test.data$PREFERENCE)
df2 <- df[order(-predictprob.log.test),]
df2$Gains <- cumsum(df2$test.data.PREFERENCE)
plot(df2$Gains,type="n",main="Test Data Lift Chart",xlab="Number of Cases",ylab="Cumulative Success")
lines(df2$Gains)
abline(0,sum(df2$test.data.PREFERENCE)/nrow(df2),lty = 2, col="red")

