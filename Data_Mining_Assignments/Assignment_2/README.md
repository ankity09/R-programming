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

