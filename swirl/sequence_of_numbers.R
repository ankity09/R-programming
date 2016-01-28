1:20 # to create a sequence of numbers from 1 to 20

pi:10 # to create a sequence of real numbers from pi to 10

15:1 # to print a sequnce from 15 to 1 

?`:` # to read the documentation of : we need to pass it '?' using backticks(`)

seq(1,20) # the seq() also prints the sequence from 1 to 20

seq(0,10, by=0.5) # this command gives us the sequence from 0 to 10 with an increment of 0.5 which is possible because of the seq()

my_seq <- seq(5,10, length=30) # this stores a sequence from 5 to 10 with 30 variables

length(my_seq) # to check the length of the my_seq variable we use the length()

1:length(my_seq) # this command creates a sequence of the 30 by passing the ending value from the length function

seq(along.with = my_seq) # is another option for the above commmand

seq_along(my_seq) # the dedicated R function to the above task is seq along

rep(0, times=40) # to create a vector that contains 40 zeroes repeateadly

rep( c(0,1,2), times=10) # to create a vector of (0,1,2) repeating 10 times

rep( c(0,1,2), each=10) # if we want our vector to contain 10 zeros, then 10 ones, then 10 twos. We can do this with the `each` argument




