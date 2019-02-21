# Assignment 2

The goal of this homework is to introduce you to classification concepts. You will develop (1) a linear probability model and (2) a logistic regression model. You will need to create random partitions of a data set, build your model on the training data set and then compute prediction errors using the test data set. There are a couple of helpful hints at the end of the assignment.
The Assignment
The data in the accompanying file “VoterPref.csv” (posted on Canvas) contains data from a survey of random sample of registered voters in a state. The subjects were asked whether they were “For” or “Against” a proposal on the ballot to increase the state sales tax by 0.5%, with the stipulation that the additional tax revenues be spent on education. In addition to their position on the proposition, some additional demographic information is collected. The variables in the data set are:
PREFERENCE AGE
INCOME GENDER
“For” or “Against”
Years of age at time of survey
Annual income in thousands of US dollars “M” or “F”
The intent of the survey is to develop a strategy to target individuals for a marketing campaign designed to “get out the vote”.

## 1) Data Preparation

**a. Read the data set in R. For the PREFERENCE variable ensure that “Against” is the success class (i.e. the
class with higher level – e.g. “1” for binary variable)**

```R
library(ggplot2)
voter.data <- read.csv("/Users/ankityadav/Desktop/Spring_2019/DMPA/Assignments/Assi gnment 2/VoterPref.csv")
voter.data$PREFERENCE <- factor(voter.data$PREFERENCE, levels = c('For','Against')) voter.data$PREFERENCE <- as.numeric(voter.data$PREFERENCE)-1 # As values are factor ed as 1 and 2
tail(voter.data)
##      AGE INCOME GENDER PREFERENCE
## 995   32  52.21
## 996   44  84.64
## 997   27  55.15
## 998   37  89.70
## 999   41  41.68
## 1000  40  87.70
F          1
F          0
F          0
F          0
F          1
F          0
```

**b. Set the seed to 71923**

```R
set.seed(71923)
```

**c. Randomly partition the data set into the training and test data sets. The proportion of observations in
the training data set should be 70%. The remaining 30% of observations should be in the test data set.**

```R
 Train <- sample(nrow(voter.data), 0.7*nrow(voter.data))
 train.data <- data.frame(voter.data[Train,])
 test.data <- data.frame(voter.data[-Train,])
```

## 2) Exploratory analysis of the training data set

**a. Construct boxplots of INCOME and AGE (broken up by values of PREFERENCE). Present the plot as
Exhibit A. What do you observe?**

```R
ggplot(train.data, aes(x= factor(PREFERENCE), y = AGE)) + geom_boxplot(aes(fill=factor (PREFERENCE))) + scale_fill_manual(values=c("#4286f4", "#b71c0b")) + xlab("PREFERENCE" ) + ylab("AGE")
```
**Exhibit A - AGE VS PREFERENCE**

![alt_text](https://github.com/ankity09/R-programming/blob/master/Data_Mining_Assignments/Assignment_Images/Assignment2_2_a.png)

From the above Boxplot(Exhibit A – AGE vs PREFERENCE) we can observe that, voters who voted AGAINST the proposal are older in AGE, this can be seen from the Red Boxplot above, which has a higher range and median value of 37. Older voters do not want the state sales tax to increase.

```R
ggplot(train.data, aes(x= factor(PREFERENCE), y = INCOME)) + geom_boxplot(aes(fill= factor(PREFERENCE))) + scale_fill_manual(values=c("#4286f4", "#b71c0b")) + xlab("PR EFERENCE") + ylab("INCOME")
```

**Exhibit A - INCOME VS PREFERENCE**

![alt_text](https://github.com/ankity09/R-programming/blob/master/Data_Mining_Assignments/Assignment_Images/Assignment2_2_a1.png)

From the above Boxplot(Exhibit A – INCOME vs PREFERENCE) we can observe that, voters who voted FOR the proposal have an higher INCOME, this can be seen from the Blue Boxplot above, which has a higher range and median value of $82,360. Voters with a higher INCOME want the state sales tax to increase.

**b. Construct a table for PREFERENCE showing proportions for and against.**

```R
(table.preferences <- table(train.data$PREFERENCE))
##
##   0   1
## 569 131
prop.table(table.preferences)
 ##
 ## 0 1
 ## 0.8128571 0.1871429
```

There are 569 voters who voted FOR the proposition and 131 who voted AGAINST it, or 0.8128571 (81.28%) voted FOR and 0.1871429 (18.71%) voted AGAINST the proposition.

**c. Construct a two-way table for count of PREFERENCE broken up by GENDER (i.e. what are the numbers of men and women who are for and against the proposition).**

```R
(table.preferences.gender <- table(train.data$GENDER,train.data$PREFERENCE))
##
     0   1
  F 276  76
  M 293  55
```

For Females, 276 have voted FOR and 76 have voted AGAINST the proposal. For Males, the count is 293 who voted for FOR and 55 who voted AGAINST the proposition.

## 3) Run a linear regression model of PREFERENCE on the demographic variables. Use only the training data set for fitting the model.

```R
#Function to compute errors AE, RMSE, MAE
error.metrics <- function(a,p) { metrics <- c('AE','RMSE','MAE') x1 <- mean(a - p)
x2 <- sqrt(mean((a - p)^2))
x3 <- mean(abs(a - p))
values <- c(x1,x2,x3)
X <- data.frame(metrics,values) X
}
```

**a. Compute the average error, RMSE and the mean absolute error (MAE) for both in-sample predictions (i.e. for the training data set) and the out-of-sample predictions (i.e. for the test data set). Use predicted values from the regression equation (do not do the classification for this yet).**

```R
linear.model <- lm(PREFERENCE~ AGE + INCOME + GENDER, data = train.data) summary(linear.model)
##
## Call:
## lm(formula = PREFERENCE ~ AGE + INCOME + GENDER, data = train.data) ##
## Residuals:
## Min 1Q Median 3Q Max
## -0.74013 -0.20850 -0.06941 0.16001 0.89611
##
## Coefficients:
## Estimate Std. Error t value Pr(>|t|)
## (Intercept) 0.3490527 0.0632336 5.520 4.79e-08 ***
 ## AGE
## INCOME
## GENDERM
## ---
## Signif. codes: 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 ##
## Residual standard error: 0.3102 on 696 degrees of freedom
## Multiple R-squared: 0.371, Adjusted R-squared: 0.3683
## F-statistic: 136.8 on 3 and 696 DF, p-value: < 2.2e-16
 0.0202591  0.0014690  13.791  < 2e-16 ***
-0.0096474  0.0005916 -16.308  < 2e-16 ***
-0.0721760  0.0234616  -3.076  0.00218 **
5
predicted.lin.train <- predict(linear.model,newdata=train.data) predicted.lin.test <- predict(linear.model,newdata=test.data)
actual.train <- as.numeric(train.data$PREFERENCE) actual.test <- as.numeric(test.data$PREFERENCE) error.metrics(actual.train,predicted.lin.train)
##   metrics        values
## 1 ## 2 ## 3
  AE -9.061468e-16
RMSE  3.093274e-01
 MAE  2.429269e-01
error.metrics(actual.test,predicted.lin.test) ## metrics values
## 1 ## 2 ## 3
  AE 0.02349681
RMSE 0.32391675
 MAE 0.26122096
```

**b. For which data set are these errors smaller?**

The errors are smaller for the train dataset.

**c. Use a cutoff of 0.5 and do the classification (i.e. make the class predictions). What proportions of predicted classes are for and against in each data set?**

```R
predictclass.lin.train <- ifelse(predicted.lin.train>0.5,1,0) predictclass.lin.test <- ifelse(predicted.lin.test>0.5,1,0)
(table.train <- table(train.data$PREFERENCE,predictclass.lin.train))
## predictclass.lin.train ## 01
## 0 557 12
## 17556
prop.table(table.train)
## predictclass.lin.train
## ## ##
           0          1
0 0.79571429 0.01714286
1 0.10714286 0.08000000
(table.test <- table(test.data$PREFERENCE,predictclass.lin.test))
## predictclass.lin.test ## 01
## 0236 4
## 13525
prop.table(table.test)

## predictclass.lin.test ## 0 1
##   0 0.78666667 0.01333333
##   1 0.11666667 0.08333333
```

For the train dataset, 0.9028571 or 90.2% of the predicted classes are voting FOR the proposition as opposed to 0.09714286 or 9.8% are AGAINST.
For the test dataset, 0.9033333 or 90.3% of the predicted classes are voting FOR the proposition as opposed to 0.09666666 or 9.7% are AGAINST.

**d. What proportion of class predictions are in error in each of the training and test data set? Ans) For the training dataset, 0.1242857 or 12.4% of the predictions are in error.**

For the test dataset, 0.13 or 13% of the predictions are in error.


## 4) Run a logistic regression model of PREFERENCE on the demographic variables. Use only the training data set for this.

**a. Present the output as Exhibit B.**

**ExhibitB
```R
logistic.model <- glm(PREFERENCE ~ AGE + INCOME + GENDER, data = train.data, family = 'bi nomial')
summary(logistic.model)
Call:

glm(formula = PREFERENCE ~ AGE + INCOME + GENDER, family = "binomial", 
    data = train.data)

Deviance Residuals: 
     Min        1Q    Median        3Q       Max  
-2.65726  -0.37215  -0.16886  -0.04293   2.76761  

Coefficients:
            Estimate Std. Error z value Pr(>|z|)    
(Intercept) -0.41788    0.76950  -0.543  0.58710    
AGE          0.22478    0.02331   9.642  < 2e-16 ***
INCOME      -0.11617    0.01129 -10.286  < 2e-16 ***
GENDERM     -0.73941    0.27662  -2.673  0.00752 ** 
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

(Dispersion parameter for binomial family taken to be 1)

    Null deviance: 674.87  on 699  degrees of freedom
Residual deviance: 353.26  on 696  degrees of freedom
AIC: 361.26

Number of Fisher Scoring iterations: 7
```

**b. Provide a precise interpretation of the coefficient of AGE.**

When interpreting the coefficient of AGE = 0.22478, or exp(coeeficient of age) = 1.25, It is implied that, a 1 year increase in age increases the odds of people preferring to vote AGAINST the proposal by a factor of 1.25, for those with same gender and income.

**c. Provide a precise interpretation of the coefficient of the gender variable.**

When interpreting the coefficient of GENDER = -0.73941, or exp(coeeficient of age) = 0.48, Implies that, odds of a male preferring to vote AGAINST the proposal are 0.48 times the odds of a female voter of the same Income and Age.


**d. Use a cutoff of 0.5 and do the classification. What proportion of predicted classes are in error (in the training and test data set)?**

```R
predictprob.log.train <- predict(logistic.model, type = 'response') predictprob.log.test <- predict(logistic.model, newdata = test.data, type = 'response' )
predictclass.log.train <- ifelse(predictprob.log.train>0.5,1,0) predictclass.log.test <- ifelse(predictprob.log.test>0.5,1,0)
(table.train.log <- table(actual.train,predictclass.log.train))
            predictclass.log.train
actual.train   0   1
           0 545  24
           1  56  75
prop.table(table.train.log)
            predictclass.log.train
actual.train          0          1
           0 0.77857143 0.03428571
           1 0.08000000 0.10714286
(table.test.log <- table(actual.test,predictclass.log.test))
           predictclass.log.test
actual.test   0   1
          0 230  10
          1  25  35
prop.table(table.test.log)
           predictclass.log.test
actual.test          0          1
          0 0.76666667 0.03333333
          1 0.08333333 0.11666667
```

For the training dataset, 0.1142857 or 11.4% of the predictions are in error. For the test dataset, 0.1166667 or 11.6% of the predictions are in error.

**e. Compare these error rates with those in question 3d (linear regression).**

When compared to the error rates in question 3d, we see a drop for both training and test datasets.
The new error rates are 11.4 and 11.6 for train and test datasets respectively Train Dataset –
Linear Model Error Rate :- 0.1242857 or 12.4%
Logisitic Model Error Rate :- 0.1142857 or 11.4%
Test Dataset –
Linear Model Error Rate :- 0.13 or 13%
Logisitic Model Error Rate ;- 0.1166667 or 11.6%

**f. Compute the predicted probability for voting against the proposition for an individual who is a female, is 36 years old, and has an income $70,000.**

```R
test.data.val <- data.frame(AGE = 36, INCOME = 70, GENDER = 'F') (predictprob.test.val <- predict(logistic.model,newdata = test.data.val, type = 'respo nse'))
##         1
## 0.3875589
#Predicted Class for the above dataframe
(predictclass.log.test.val <- ifelse(predictprob.test.val>0.5,1,0))
1 
0 
```
The predicted probability of a Female who is 36 years old and has an income of $70,000 will vote AGAINST the proposition is 0.3875589 or 38.75%
When predicting, using 0.5 as the cutoff, this voter will be classified as voting FOR the proposition.
