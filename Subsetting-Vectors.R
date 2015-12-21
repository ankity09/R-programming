x # a vector 40 variables with 20 numbers and 20 NA values

x[1:10] # to select firct 10 values of the vector

x[is.na(x)] # will give us a subset of all NAs

y <-x[!is.na(x)] # # y will hold a value of all values except for NAs  

y # print y to the console

y[y>0] # gives all of the positive elements of y

x[x>0] # to see the effects of NAs in x and why we refined x to y

x[!is.na(x) & x>0] # we directly reduce x to numerical values and then subset further

x[c(3,5,7)] # to subset the 3rd 5th and 7th value of x

x[0] # to check what happens then we ask for the 0th element

x[3000] # to check the 3000th element of the the vector x

x[c(-2,-10)] # gives us all elements of x except for the 2nd and 10th elements

x[-c(2,10)] # same reslut as above

vect<- c(foo=11,bar=2,norf=NA) # create a vector with three named elements

vect # print vect to console

names(vect) # we can also get the names of vect by passong vect as an argument to the names()

vect2 <- c(11,2,NA) # create unamed vector vect2

names(vect2) <- c("foo","bar","norf") # add names to the vector vect2

identical(vect,vect2) # check whether the two vectors vect and vect2 are identical or not

vect["bar"] # to load the second element named bar from the vector

vect[c("foo","bar")] # to load the elements foo and bar from the vect vector
