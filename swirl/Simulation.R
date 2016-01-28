?sample # to pull up documentation

sample(1:6,4,replace=TRUE) # simulate rolling four six-sided dice

#sample(1:6, 4, replace = TRUE) instructs R to randomly select four numbers between 1 and 6, WITH replacement. Sampling with replacement simply

# means that each number is "replaced" after it is selected, so that the same number can show up more than once. This is what we want here, since

# what you roll on one die shouldn't affect what you roll on any of the others.

sample(1:20,10) # sapmple 10 numbers without replacement

LETTERS # LETTERS is a predefined variable in R containing a vector of all 26 letters of the english alphabet

sample(LETTERS) 
#This is identical to taking a sample of size 26 from LETTERS, without replacement. When the 'size' argument to sample() is not specified, R takes
# a sample equal in size to the vector from which you are sampling.
 
flips <- sample(c(0,1),100,replace=TRUE,prob=c(0.3,0.7))  #| Let the value 0 represent tails and the value 1 represent heads. Use sample() to draw a sample of size 100 from the vector c(0,1), with replacement. Since the coin is unfair, we must attach specific probabilities to the values 0 (tails) and 1 (heads) with a fourth argument, prob =c(0.3, 0.7). Assign the result to a new variable called flips.

flips # view contents

sum(flips) # to count the actual number of 1s contained in flips

?rbinom

# A binomial random variable represents the number of 'successes' (heads) in a given number of independent 'trials' (coin flips). Therefore, we can

# generate a single random variable that represents the number of heads in 100 flips of our unfair coin using rbinom(1, size = 100, prob = 0.7).

# Note that you only specify the probability of 'success' (heads) and NOT the probability of 'failure' (tails). Try it now.

rbinom(1, size = 100, prob = 0.7)

flips2 <- rbinom(100, size = 1, prob = 0.7)

flips2 # to view the contents 

sum(flips2) # to calculate the sum

?rnorm

rnorm(10) # trial

rnorm(10,mean=100,sd=25) # with mean =100 and a standard deviation =25

?rpois


rpois(5,lambda=10) # to create a poisson distribution

my_pois <-replicate(100,rpois(5,10))

my_pois

cm <- colMeans(my_pois) # to get column means

hist(cm) # to create a histogram

