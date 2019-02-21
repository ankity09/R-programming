# Reading Data
airline.data <- read.csv("/Users/ankityadav/Desktop/Spring_2019/DMPA/Assignments/Assignment 1/Airline Data V2.csv")
str(airline.data)
summary(airline.data)
head(airline.data)

#Regression 

linear.model.1 <- lm(FARE ~ VACATION + GATE + SW + SLOT + COUPON + NEW + HI + S_POP + E_POP + DISTANCE + PAX + S_INCOME + E_INCOME, airline.data)
summary(linear.model.1)
test.data <- data.frame(VACATION = 'No', GATE = 'Constrained', SW = 'No', SLOT = 'Free', COUPON = 1, NEW = 3, HI = 6000, S_POP = 4000000, E_POP = 7150000, DISTANCE = 1000, PAX = 6000, S_INCOME = 2000, E_INCOME = 2000)

predict.test <- predict(linear.model.1,test.data)

#Exploratory Analysis
numeric.data <- data.frame(airline.data$COUPON,airline.data$HI,airline.data$S_INCOME,airline.data$E_INCOME,airline.data$S_POP,airline.data$E_POP,airline.data$DISTANCE,airline.data$PAX)
pairs(numeric.data)


library(ggplot2)
ggplot(data = airline.data) +
  aes(x = DISTANCE, y = FARE, color = SW) +
  geom_point() +
  theme_minimal()

cor.data <- cor(numeric.data, use = "complete.obs")
print(cor.data)

#More Regression Modelling
linear.model.2 <- lm(FARE ~ SW, airline.data)
summary(linear.model.2)

#Further Analysis
linear.model.3 <- lm(FARE ~ VACATION + GATE + SW + SLOT + COUPON + NEW + HI + S_POP + E_POP + DISTANCE + PAX + S_INCOME + E_INCOME + SW*VACATION, airline.data)
summary(linear.model.3)
ggplot(data = airline.data) +
  aes(x = VACATION, y = FARE, color = SW) +
  geom_point() +
  theme_classic()

#Comparing two Models
linear.model.4 <- lm(FARE ~ VACATION + SW + HI + S_INCOME + E_INCOME + S_POP + E_POP + DISTANCE + PAX, airline.data)
linear.model.5 <- lm(FARE ~ VACATION + SW + HI + S_POP + E_POP + DISTANCE + PAX, airline.data)
summary(linear.model.4)
summary(linear.model.5)




