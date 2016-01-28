ls() # to list variables in my workspace

class(plants) # to check the class of the plants variable, tp give us a clue of the overall structure

dim(plants) # to see exactly how many rows and columns there are in plants

nrow(plants) # to see the number of rows in the plant dataframe

ncol(plants) # to see the number of cloumns

object.size(plants) # to see how much space the dataset is occupying in memory

names(plants) # will return a charcter vector of column(i.e. variable) names

head(plants) # will let you preview the top of the dataset

head(plants,10) # to see the first 10 rows of the dataset and not 6 which is the default

tail(plants,15) # is to see the last 15 rows of the dataset

summary(plants) #gives us a summary of how much of the data is present and missing

#summary() provides different output for each variable, depending on its class. For numeric data such as Precip_Min, summary() displays the

# minimum, 1st quartile, median, mean, 3rd quartile, and maximum. These values help us understand how the data are distributed.

#For categorical variables (called 'factor' variables in R), summary() displays the number of times each value (or 'level') occurs in the data.

# For example, each value of Scientific_Name only appears once, since it is unique to a specific plant. In contrast, the summary for Duration (also

# a factor variable) tells us that our dataset contains 3031 Perennial plants, 682 Annual plants, etc.

table(plants$Active_Growth_Period) # to see how many times each value actually occurs 

str(plants) # the most useful function dor understanding your data




