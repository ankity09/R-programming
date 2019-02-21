library(ggplot2)
voter.data <- read.csv("/Users/ankityadav/Desktop/Spring_2019/DMPA/Assignments/Assignment 2/VoterPref.csv")
str(voter.data)
summary(voter.data)
class(voter.data$PREFERENCE)
voter.data$PREFERENCE <- factor(voter.data$PREFERENCE, levels = c('For','Against'))
voter.data$PREFERENCE <- as.numeric(voter.data$PREFERENCE)-1


set.seed(71923)
Train <- sample(nrow(voter.data), 0.7*nrow(voter.data))
train.data <- data.frame(voter.data[Train,])
test.data <- data.frame(voter.data[-Train,])
summary(train.data)
str(train.data)

ggplot(train.data, aes(x= INCOME, y = AGE)) + geom_boxplot(aes(fill=factor(PREFERENCE))) + facet_grid(.~PREFERENCE) 
ggplot(voter.data, aes(x= factor(PREFERENCE), y = AGE)) + geom_boxplot(aes(fill=factor(PREFERENCE))) + scale_fill_manual(values=c("#4286f4", "#b71c0b"))
ggplot(voter.data, aes(x= factor(PREFERENCE), y = INCOME)) + geom_boxplot(aes(fill=factor(PREFERENCE))) + scale_fill_manual(values=c("#4286f4", "#b71c0b"))

(table.preferences <- table(train.data$PREFERENCE))
(table.preferences.gender <- table(train.data$GENDER,train.data$PREFERENCE))

#Linear Model

linear.model <- lm(PREFERENCE~ AGE + INCOME + GENDER, data = train.data)
summary(linear.model)
predicted.lin.train <- predict(linear.model)
predicted.lin.test <- predict(linear.model,newdata=test.data)

actual.train <- as.numeric(train.data$PREFERENCE)
actual.test <- as.numeric(test.data$PREFERENCE)
error.metrics(actual.train,predicted.lin.train)
error.metrics(actual.test,predicted.lin.test)

predictclass.lin.train <- ifelse(predicted.lin.train>0.5,1,0)
predictclass.lin.test <- ifelse(predicted.lin.test>0.5,1,0)

(table.train <- table(train.data$PREFERENCE,predictclass.lin.train))
table.test <- table(test.data$PREFERENCE,predictclass.lin.test)
prop.table(table.test)

error.metrics <- function(a,p) {
  metrics <- c('AE','RMSE','MAE')
  x1 <- mean(a - p)
  x2 <- sqrt(mean((a - p)^2))
  x3 <- mean(abs(a - p))
  values <- c(x1,x2,x3)
  X <- data.frame(metrics,values)
  X
}

error.metrics(actual,predicted)


#Logistic Model
logistic.model <- glm(PREFERENCE ~ AGE + INCOME + GENDER, data = train.data, family = 'binomial')
summary(logistic.model)

predictprob.log.train <- predict(logistic.model, type = 'response')
predictprob.log.test <- predict(logistic.model, newdata = test.data, type = 'response')

predictclass.log.train <- ifelse(predictprob.log.train>0.5,1,0)
predictclass.log.test <- ifelse(predictprob.log.test>0.5,1,0)

(table.train <- table(actual.train,predictclass.log.train))
(table.test <- table(actual.test,predictclass.log.test))
(prop.table(table.train))
(prop.table(table.test))

test.data.val <- data.frame(AGE = 36, INCOME = 70, GENDER = 'F')
predictprob.test.val <- predict(logistic.model,newdata = test.data.val, type = 'response')
(predictclass.log.test.val <- ifelse(predictprob.test.val>0.5,1,0))


