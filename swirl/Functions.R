Sys.Date() # returns todays date

mean(c(2,4,5)) # passing arguments to the mean()

boring_function <- function(x) {
  x
} # first function which takes a value and returns it without any change

boring_function('My first function!') # test boring function

boring_function # only writing the name of the function displays its source code

my_mean <- function(my_vector) {
  # Write your code here!
  x <- sum(my_vector)
  y <- length(my_vector)
  z <- x/y
  z
  # Remember: the last expression evaluated will be returned! 
} # a function to compute the mean of my_vector

my_mean(c(4,5,10)) # to check the working of the function my_mean

remainder <- function(num, divisor=2) {
  # Write your code here!
  num %% divisor
  # Remember: the last expression evaluated will be returned! 
} # to calculate the remainder

remainder(5) # testing the remainder function

remainder(11,5) # testing the function

remainder(divisor = 11,num=5) #testing function

remainder(4,div=2) # partially matching arguments by R

args(remainder) # to check the arguments taken by the function remainder

# You may not realize it but I just tricked you into doing something pretty interesting! args() is a function, remainder() is a function, yet  remainder was an argument for args(). Yes it's true: you can pass functions as arguments! This is a very powerful concept. Let's write a script  to see how it works.

evaluate <- function(func, dat){
  # Write your code here!
  func(dat)
  # Remember: the last expression evaluated will be returned! 
} # passing a function as an argument to a function

evaluate(sd,c(1.4,3.6,7.9,8.8)) # testing the eavaluate function

evaluate(function(x){x+1},6) #The first argument is a tiny anonymous function that takes one argument `x` and returns `x+1`. We passed the number 6 into this function so the  entire expression evaluates to 7.

evaluate(function(x){x[1]},c(8,4,0)) # Try using evaluate() along with an anonymous function to return the first element of the vector c(8, 4, 0). Your anonymous function should only take one argument which should be a variable `x`.

evaluate(function(x){x[length(x)]}, c(8, 4, 0)) #Now try using evaluate() along with an anonymous function to return the last element of the vector c(8, 4, 0). Your anonymous function should  only take one argument which should be a variable `x`.

?paste #documentation for paste

paste("Programming","is","fun!") # testing paste

telegram <- function(...){
  paste("START",...,"STOP")
}# Telegrams used to be peppered with the words START and STOP in order to
# demarcate the beginning and end of sentences. Write a function below called 
# telegram that formats sentences for telegrams.
# For example the expression`telegram("Good", "morning")` should evaluate to:
# "START Good morning STOP"

telegram("good morning")

mad_libs <- function(...){
  # Do your argument unpacking here!
  args <- list(...)
  place <- args[["place"]]
  adjective <- args[["adjective"]]
  noun <- args[["noun"]]
  
  # Don't modify any code below this comment.
  # Notice the variables you'll need to create in order for the code below to
  # be functional!
  paste("News from", place, "today where", adjective, "students took to the streets in protest of the new", noun, "being installed on campus.")
} # unpacking a ellipses

mad_libs(adjective = "", place = "", noun = "") # passing arguments to the above function

# Write your own binary operator below from absolute scratch! Your binary
# operator must be called %p% so that the expression:
#
#       "Good" %p% "job!"
#
# will evaluate to: "Good job!"

"%p%" <- function(left, right){ # Remember to add arguments!
  paste(left, right)
} # correct function

"I" %p% "love" %p% "R!" # using the %p% function
