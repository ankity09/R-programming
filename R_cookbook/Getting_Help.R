### Getting Help ###

# Getting help on a function
help(mean) # to display the help page for mean function
?mean # same as above
args(mean) # to know the arguments that can be passed to a function
example(mean) # to get a working demonstration of the function

# Searching the supplied documentation
help.search("adf.test") # searches the documentation of packages for "adf.test" requires the quotations
??adf.test

# Getting help on a package 
help(package="ggplot2") # tp learn more about a package
# Some packages also include vignettes which are additional documents which can be viewed via
vignette()
vignette(package="Matrix") # to see vignettes of a particular package
vignette("Intro2Matirx") # to check a particular vignette 