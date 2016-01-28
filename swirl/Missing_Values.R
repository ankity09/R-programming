x <- c(44,NA,5,NA) # create a vector with a NA value

x * 3 # multiply x by 3

y <- rnorm(1000) # create a vector containing 1000 draws from a standard normal distribution

z <- rep(NA,1000) # create a vector containing 1000 NAs 

my_data <- sample(c(y,z),100) # select 100 elements at random by combining y and z and having no control over the number of NAs present

my_na <- is.na(my_data) # store the NAs in my_na varibales using the is.na()

my_na # print my_na

my_data == NA # to check if my_data == NA yields the same result as the above command

sum(my_na) # get the sum of all NAs in my_na

my_data # print my_data to console

0 / 0 # to print a NaN(Not a Number)

Inf - Inf # Inf stands for infinity this has been done to generate a NaN
