sapply(flags,unique) # unique() returns a vector ofthe unique values contained in the object passed to it

vapply(flags,unique,numeric(1)) # this should give an error

sapply(flags,class) # will return a charcter vector of length 1

vapply(flags,class,character(1)) # we specify to vapply the format of the result

?tapply # to look up the documentation

table(flags$landmass) # the landmass variable in our dataset takes on integer values between 1 and 6

table(flags$animate) # the animate variable takes the value if a country's flag contains an animate object

tapply(flags$animate,flags$landmass,mean) # to apply the mean function to animate variable separately for ecah of thensix landmasses

tapply(flags$population,flags$red,summary) # we can loook at a summary of population values for countries with and without the color red on thier flag

tapply(flags$population,flags$landmass,summary) # above summary with respect to landmasses

