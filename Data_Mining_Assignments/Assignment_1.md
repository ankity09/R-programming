# Assignment 1

The goal of this homework is to review the fundamental concepts of regression modeling learned in earlier classes. You will also begin to develop facility with the statistical programming language R.
The Assignment
The data in the accompanying file “Airline data 2.csv” (posted on Canvas) was assembled by Professor Robert Windle of the Smith School with assistance from Oliver Yao. The file contains information on 627 air routes in the United States. A route refers to a pair of airports. Note that some cities are served by more than one airport. In such cases, the airports are distinguished by their 3-letter code. The data was collected for the third quarter of 1996 (3Q96). The variables in the data set are:
1. S_CODE: starting airport’s code
2. S_CITY: starting city
3. E_CODE: ending airport’s code
4. E_CITY: ending city
5. COUPON: average number of coupons (a one-coupon flight is a non-stop flight, a two-coupon flight is a one stop flight, etc.) for that route
6. NEW: number of new carriers entering that route between Q3-96 and Q2-97
7. VACATION: whether a vacation route (Yes) or not (No); Florida and Las Vegas routes are generally
considered vacation routes
8. SW: whether Southwest Airlines serves that route (Yes) or not (No)
9. HI: Herfindahl Index – airlines use this as a measure of market concentration (a larger value indicates
greater concentration)
10. S_INCOME: starting city’s average personal income
11. E_INCOME: ending city’s average personal income
12. S_POP: starting city’s population
13. E_POP: ending city’s population
14. SLOT: whether either endpoint airport is slot controlled or not; this is a measure of airport congestion
15. GATE: whether either endpoint airport has gate constraints or not; this is another measure of airport
congestion
16. DISTANCE: distance between two endpoint airports in miles
17. PAX: number of passengers on that route during period of data collection
18. FARE: average fare on that route
There are two goals of the study. The first is to predict the FARE as a function of the other variables. The second is to determine how the presence of Southwest Airlines affects fares.
We will not use the first four attributes (S_CODE, S_CITY, E_CODE, and E_CITY) in our analysis.

Please answer all questions in the dedicated space and upload on Canvas. Please ensure that your numbering of questions matches those below.


## 1) Working with data and regression in R
The VACATION, SW, GATE and SLOT variables will have type Factor. The dollar sign before FARE is likely to create a problem – you may choose to address this in R, or directly in Excel by changing the format from currency to number. Using the resulting new dataset run a multivariable regression for FARE, with all numerical variables (i.e. of type num or int) and the four factors above as independent variables.

```R
airline.data <- read.csv("/Users/ankityadav/Desktop/Spring_2019/DMPA/Assignments/Assignme nt 1/Airline Data V2.csv")
linear.model.1 <- lm(FARE ~ VACATION + GATE + SW + SLOT + COUPON + NEW + HI + S_POP + E_P OP + DISTANCE + PAX + S_INCOME + E_INCOME, airline.data)
summary(linear.model.1)
```

```R
##
## Call:
## lm(formula = FARE ~ VACATION + GATE + SW + SLOT + COUPON + NEW +
## HI + S_POP + E_POP + DISTANCE + PAX + S_INCOME + E_INCOME,
##     data = airline.data)
##
## Residuals:
##      Min       1Q   Median       3Q      Max
## -110.795  -23.089   -1.085   20.955  128.678
##
## Coefficients:
##               Estimate Std. Error t value Pr(>|t|)
## (Intercept) -9.175e+00 2.861e+01 -0.321 0.748572
## VACATIONYes -3.293e+01 3.779e+00 -8.714 < 2e-16 ***
## GATEFree -2.052e+01 4.048e+00 -5.069 5.31e-07 ***
## SWYes -4.090e+01 3.767e+00 -10.860 < 2e-16 ***
## SLOTFree -1.497e+01 3.913e+00 -3.824 0.000145 ***
## COUPON 6.721e+00 1.234e+01 0.545 0.586215
## NEW -2.384e+00 1.898e+00 -1.256 0.209629
## HI           8.140e-03  1.005e-03   8.103 2.95e-15 ***
## S_POP 3.613e-06 6.590e-07 5.482 6.17e-08 ***
## E_POP 4.204e-06 7.621e-07 5.517 5.11e-08 ***
## DISTANCE 7.359e-02 3.631e-03 20.265 < 2e-16 ***
## PAX -9.179e-04 1.475e-04 -6.225 8.98e-10 ***
## S_INCOME 1.485e-03 5.264e-04 2.820 0.004954 **
## E_INCOME 1.824e-03 4.132e-04 4.415 1.20e-05 ***
## ---
## Signif. codes: 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
##
## Residual standard error: 35.47 on 609 degrees of freedom
## (4 observations deleted due to missingness)
## Multiple R-squared: 0.7909, Adjusted R-squared: 0.7865
## F-statistic: 177.2 on 13 and 609 DF, p-value: < 2.2e-16
```

**a) What is the resulting R2?**

The Resulting R2 is 0.786.

**b) State precisely what effect the value of SLOT has on the predicted FARE:**

If SLOT is “Free”, the FARE will decrease by $14.97 while all other variables are held constant.

**c) What is the predicted fare of a leg that has COUPON = 1, NEW = 3, VACATION = No, SW = No, HI =6000, S_INCOME = $2000, E_INCOME = $2000, S_POP = 4,000,000, E_POP=7,150,000, SLOT=Free and GATE = Constrained, DISTANCE = 1000, and PAX = 6000?**
  
```R
linear.model.2 <- lm(FARE ~ VACATION + GATE + SW + SLOT + COUPON + NEW + HI + S_POP + E_POP + DISTANCE + PAX + S_INCOME + E_INCOME, airline.data)
test.data <- data.frame(VACATION = 'No', GATE = 'Constrained', SW = 'No', SLOT = 'Free ', COUPON = 1, NEW = 3, HI = 6000, S_POP = 4000000, E_POP = 7150000, DISTANCE = 1000, PAX = 6000, S_INCOME = 2000, E_INCOME = 2000)
predict.test <- predict(linear.model.2,test.data) print(predict.test)

## 1
## 143.4773
```
The predicted FARE for the leg with the above variables will be $143.47

**d) Do you have any reservations about your predicted fare? If so, explain why.**

The input values of S_INCOME and E_INCOME are extremely small as compared to the values in the data set. Hence our model is predicting fare by extrapolating and hence chances of errors is very high. Predictions may not be very reliable.


## 2) Exploratory Analysis

```R
numeric.data <- airline.data[c(5,9,10,11,12,13,16,17,18)]
```
**a) Use the PAIRS function in R to depict pairwise scatterplots of all numerical variables in the data set.**

```R
pairs(numeric.data)
```
~[alt_text](https://github.com/ankity09/R-programming/blob/master/Data_Mining_Assignments/Assignment1_2_a.png)

