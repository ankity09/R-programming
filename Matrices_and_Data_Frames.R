my_vector <- 1:20 # create a vector with sequnce 1:20

my_vector # view the contents of the vector you just created

dim(my_vector) # the dim() tells us the dimensions of an object

length(my_vector) # get the length of the my_vector

dim(my_vector) <- c(4,5) # give my_vect a dim attribute

dim(my_vector) # to confirm we've set the dim attribute

attributes(my_vector) # an alternative to the above command

my_vector # view the contents of my_vector

class(my_vector) # check the class of my_vect

my_matrix <- my_vector # store my_vector in a new variable called my_matrix

?matrix # the help function for matrix

my_matrix2 <- matrix (data = 1:20,nrow =4,ncol = 5) # create a matrix with 1-20 numbers and 4 rows and 5 columns and store it in my_matrix2

identical(my_matrix,my_matrix2) # check if my_matrix and my_matrix2 are identical

patients <- c("Bill","Gina","Kelly","Sean") # create a character vector with four names

cbind(patients,my_matrix) # Now we'll use the cbind() function to 'combine columns'. Don't worry about storing the result in a new variable

my_data <- data.frame(patients,my_matrix) # to avoid implicit corecion as the above command has changed all values to character

my_data # view contents of my_Data

class(my_data) # confirm the class of my_data

cnames <- c("patient","age","weight","bp","rating","test") # create a variable with column names

colnames(my_data) <- cnames # set the column names using colnames

my_data # check the contents of my_data


