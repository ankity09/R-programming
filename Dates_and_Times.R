d1 <- Sys.Date() # get the current data and store it in a variable

class(d1) # to fetch the class of d1

unclass(d1) # to see what d1 looks like internally

d1 # print d1

d2 <- as.Date("1969-01-01") # create a date prior to 1970-01-01

unclass(d2) 

t1 <- Sys.time() # to get the current time

t1 # view the contents of t1

class(t1) # check the class of t1

unclass(t1) # to see what t1 looks like internally

t2 <- as.POSIXlt(Sys.time()) #  By default, Sys.time() returns an object of class POSIXct, but we can coerce the result to POSIXlt with as.POSIXlt(Sys.time()). Give it a try and
# store the result in t2.

class(t2)

t2

unclass(t2)

str(unclass(t2)) # to have a more compact view of t2

t2$min # to access only the minutes from t2

weekdays(d1) # weekdays will return the day of the week from any date or time object

months(t1) # months like weekdays will also work on any form of date or time object

quarters(t2) # same as above but for quarters

t3 <- "October 17, 1986 08:24" # create a variable 

t4 <- strptime(t3,"%B %d, %Y %H:%M") # to help R convert our date/time object to a format that it understands

t4

class(t4)

Sys.time() > t1 # compare the current time with t1 

Sys.time() - t1 # subtract the current time from t1

difftime(Sys.time(),t1,units = 'days') # to find the amount of time in DAYS that has passed since you created t1


