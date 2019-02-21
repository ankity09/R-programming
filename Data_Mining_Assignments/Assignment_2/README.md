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

##1 Data Preparation

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

##(2) Exploratory analysis of the training data set

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
