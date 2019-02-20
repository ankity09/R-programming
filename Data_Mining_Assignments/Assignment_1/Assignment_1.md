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
![alt_text](https://github.com/ankity09/R-programming/blob/master/Data_Mining_Assignments/Assignment_Images/Assignment1_2_a.png)

**b) Present a scatterplot of FARE (Y-axis) and DISTANCE (X-axis). Use different colors or symbols to distinguish routes where Southwest is present. Briefly describe what you observe.**

```R
library(ggplot2)
ggplot(data = airline.data) +
aes(x = DISTANCE, y = FARE, color = SW) + geom_point() +
theme_minimal()
## Warning: Removed 4 rows containing missing values (geom_point).
```
![alt_text](https://github.com/ankity09/R-programming/blob/master/Data_Mining_Assignments/Assignment_Images/Assignement1_2_b.png)

The green dots(SW=Yes), are more clustered on the bottom left of the graph, which suggests SouthWest operates more on the shorter distances

As the green dots(SW=Yes) suggest, fares are lower with respect to distance when compared to routes not served by Southwest
Fare decreases, if the route has Southwest serving it.

**c) High correlations between independent variables can be problematic. Present a table of linear correlations and identify any values greater than 0.7.**

```R
cor.data <- cor(numeric.data, use = "complete.obs")
print(cor.data)
                     airline.data.COUPON airline.data.HI airline.data.S_INCOME airline.data.E_INCOME
airline.data.COUPON            1.00000000     -0.35063532           -0.09234955            0.05169139
airline.data.HI               -0.35063532      1.00000000           -0.01522888            0.09567214
airline.data.S_INCOME         -0.09234955     -0.01522888            1.00000000           -0.17437258
airline.data.E_INCOME          0.05169139      0.09567214           -0.17437258            1.00000000
airline.data.S_POP            -0.10834075     -0.16002891            0.51347744           -0.16756233
airline.data.E_POP             0.09924225     -0.07157575           -0.26222300            0.51061293
airline.data.DISTANCE          0.74790923     -0.31100919            0.02459152            0.18545503
airline.data.PAX              -0.33343861     -0.16397826            0.13522296            0.26939217
                      airline.data.S_POP airline.data.E_POP airline.data.DISTANCE airline.data.PAX
airline.data.COUPON          -0.10834075         0.09924225            0.74790923       -0.3334386
airline.data.HI              -0.16002891        -0.07157575           -0.31100919       -0.1639783
airline.data.S_INCOME         0.51347744        -0.26222300            0.02459152        0.1352230
airline.data.E_INCOME        -0.16756233         0.51061293            0.18545503        0.2693922
airline.data.S_POP            1.00000000        -0.27502675            0.01460752        0.2816837
airline.data.E_POP           -0.27502675         1.00000000            0.11935084        0.3190252
airline.data.DISTANCE         0.01460752         0.11935084            1.00000000       -0.1028586
airline.data.PAX              0.28168371         0.31902519           -0.10285862        1.0000000
```

**Correlation between DISTANCE and COUPON is higher than 0,7(0.7459)**

## 3)More Regression Modelling

**Run a simple regression to determine the effect of the presence of Southwest on FARE. Compare the coefficient with the corresponding value in (1) and explain discrepancies, if any.**

In the simple Linear Model(linear.model.2) at (-92.00). We can infer, if Southwest flies on the route, then the fares will decrease by $92.00.
The coefficient of Southwest(-45.77) in Linear Model(linear.model.1). Which tells us, if Southwest flies on the route, then fares will decrease by $45.77.
Linear Model(linear.model.1) is a better model, as it has an Adjusted R-Squared value of 0.786 and will predict the coefficient of Southwest better. It is also important to note that, Linear Model (linear.model.1) has more independent variables and hence will be able to better predict FARES than this linear model(liner.model.2)

```R
linear.model.2 <- lm(FARE ~ SW, airline.data) summary(linear.model.2)
##
## Call:
## lm(formula = FARE ~ SW, data = airline.data)
##
## Residuals:
##     Min      1Q  Median      3Q     Max
## -132.24  -46.12  -14.05   42.11  212.16
##
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)
## (Intercept)  189.862      3.069   61.86
## SWYes        -92.007      5.524  -16.66
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01
##
  <2e-16 ***
  <2e-16 ***
'*' 0.05 '.' 0.1 ' ' 1
## Residual standard error: 63.8 on 623 degrees of freedom
## (2 observations deleted due to missingness)
## Multiple R-squared: 0.3081, Adjusted R-squared: 0.307
## F-statistic: 277.5 on 1 and 623 DF, p-value: < 2.2e-16
```

## 4)Further Analysis

**a) A senior consultant in the airline industry has indicated that the presence of Southwest on Vacation routes has been driving prices down on these legs. Add this domain knowledge to your regression model and run a new multivariable linear regression. Describe how you added this feature to the model.**

We can add this feature in our existing Linear Model, by introducing Interaction Variables in the equation. We will set Southwest and Vacation as our interaction variables in the equation and run the new linear model which will tell us how the presence of Southwest on Vacation routes affects the prices.

```R
linear.model.3 <- lm(FARE ~ VACATION + GATE + SW + SLOT + COUPON + NEW + HI + S_POP + E_P OP + DISTANCE + PAX + S_INCOME + E_INCOME + SW*VACATION, airline.data) summary(linear.model.3)
##
## Call:
## lm(formula = FARE ~ VACATION + GATE + SW + SLOT + COUPON + NEW +
## HI + S_POP + E_POP + DISTANCE + PAX + S_INCOME + E_INCOME +
##     SW * VACATION, data = airline.data)
##
## Residuals:
##      Min       1Q   Median       3Q      Max
## -111.330  -19.565   -0.309   21.723  124.047
##
## Coefficients:
##                     Estimate Std. Error t value Pr(>|t|)
## (Intercept) 3.869e+01 2.806e+01 1.379 0.168480
## VACATIONYes -5.273e+01 4.446e+00 -11.860 < 2e-16 ***
## GATEFree -2.006e+01 3.870e+00 -5.183 2.97e-07 ***
## SWYes -5.763e+01 4.214e+00 -13.675 < 2e-16 ***
## SLOTFree -1.464e+01 3.741e+00 -3.913 0.000101 ***
## COUPON -8.006e+00 1.195e+01 -0.670 0.503272
## NEW -1.071e+00 1.823e+00 -0.588 0.556841
## HI                 7.706e-03  9.621e-04   8.010 5.88e-15 ***
## S_POP 3.627e-06 6.300e-07 5.758 1.35e-08 ***
## E_POP 4.129e-06 7.286e-07 5.667 2.24e-08 ***
## DISTANCE 7.752e-02 3.510e-03 22.090 < 2e-16 ***
## PAX -9.227e-04 1.410e-04 -6.545 1.27e-10 ***
## S_INCOME 8.742e-04 5.096e-04 1.716 0.086756 .
## E_INCOME 1.331e-03 4.003e-04 3.324 0.000939 ***
## VACATIONYes:SWYes 5.257e+01 6.882e+00 7.639 8.54e-14 ***
## ---
## Signif. codes: 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
##
## Residual standard error: 33.9 on 608 degrees of freedom
## (4 observations deleted due to missingness)
## Multiple R-squared: 0.8092, Adjusted R-squared: 0.8048
## F-statistic: 184.2 on 14 and 608 DF, p-value: < 2.2e-16
```

**b) What is the resulting R2?**
The resulting R2 is 0.8048

**c) Now how would you quantify the effect of SW on the fare?**

If SW is “Yes”, and VACATION is “No” the FARE will decrease by $57.63 while all other variables are held constant.
If SW is “Yes”, and VACATION is “Yes” the FARE will decrease by $57.79 while all other variables are held constant. Calculation for above value (Coef (VACATIONYes) + Coef(SWYes) - Coef (VACATIONYes:SWYes)). = (52.73+57.63-52.57)

## 5) Comparing two different models

We will now build a model for FARES using the following explanatory variables: Factor variables for VACATION and SW, HI, S_INCOME, E_INCOME, S_POP, E_POP, DISTANCE, PAX. Then we will compare this with the model without the two INCOME variables.
a) Run the regression with and without the INCOME variables.

```R
linear.model.4 <- lm(FARE ~ VACATION + SW + HI + S_INCOME + E_INCOME + S_POP + E_POP + DISTANCE + PAX, airline.data)
linear.model.5 <- lm(FARE ~ VACATION + SW + HI + S_POP + E_POP + DISTANCE + PAX, airli ne.data)
```

**b) On the basis of the output evaluate which model is better for predicting FARES. Explain carefully how you made this determination.**

WITH INCOME – linear.model.4 WITHOUT INOMCE – linear.model.5
The Linear Model(linear.model.4) with the INCOME variables is better for predicting FARES.
It has an Adjusted R-Squared value of 0.7762 compared to that of Linear Model(linear.model.5) which has an R-Squared value of 0.7662.
The Linear Model(linear.model.4) also has an Residual standard error of 36.3 which is lower than Linear Model(linear.model.5)’s Residual standard error 37.11.As per the above values, Linear Model(linear.model.4) is a better model for predicting FARE.
 
```R
 summary(linear.model.4)
Call:
lm(formula = FARE ~ VACATION + SW + HI + S_INCOME + E_INCOME + 
    S_POP + E_POP + DISTANCE + PAX, data = airline.data)

Residuals:
     Min       1Q   Median       3Q      Max 
-124.916  -22.787    0.426   22.711  117.819 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept) -5.134e+01  2.056e+01  -2.498 0.012764 *  
VACATIONYes -3.262e+01  3.856e+00  -8.459  < 2e-16 ***
SWYes       -4.676e+01  3.692e+00 -12.666  < 2e-16 ***
HI           7.863e-03  9.629e-04   8.166 1.82e-15 ***
S_INCOME     1.848e-03  5.269e-04   3.507 0.000486 ***
E_INCOME     1.950e-03  4.160e-04   4.687 3.42e-06 ***
S_POP        4.605e-06  6.413e-07   7.181 2.01e-12 ***
E_POP        5.579e-06  7.346e-07   7.594 1.16e-13 ***
DISTANCE     7.176e-02  2.586e-03  27.746  < 2e-16 ***
PAX         -1.013e-03  1.395e-04  -7.261 1.17e-12 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 36.3 on 613 degrees of freedom
  (4 observations deleted due to missingness)
Multiple R-squared:  0.7795,	Adjusted R-squared:  0.7762 
F-statistic: 240.7 on 9 and 613 DF,  p-value: < 2.2e-16

summary(linear.model.4)
Call:
lm(formula = FARE ~ VACATION + SW + HI + S_POP + E_POP + DISTANCE + 
    PAX, data = airline.data)

Residuals:
     Min       1Q   Median       3Q      Max 
-115.712  -23.015   -1.116   23.935  113.970 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept)  4.537e+01  8.188e+00   5.540 4.48e-08 ***
VACATIONYes -3.825e+01  3.770e+00 -10.148  < 2e-16 ***
SWYes       -5.341e+01  3.498e+00 -15.272  < 2e-16 ***
HI           8.731e-03  9.651e-04   9.046  < 2e-16 ***
S_POP        4.827e-06  6.205e-07   7.779 3.11e-14 ***
E_POP        5.837e-06  6.929e-07   8.423 2.59e-16 ***
DISTANCE     7.476e-02  2.569e-03  29.098  < 2e-16 ***
PAX         -7.808e-04  1.357e-04  -5.754 1.38e-08 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 37.11 on 615 degrees of freedom
  (4 observations deleted due to missingness)
Multiple R-squared:  0.7689,	Adjusted R-squared:  0.7662 
F-statistic: 292.2 on 7 and 615 DF,  p-value: < 2.2e-16
```
