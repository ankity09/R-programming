num_vect <- c(0.5,55,-10,6) # create a numeric vector

tf <- num_vect < 1 # variable tf gets the value num_vect < 1 logically

tf # print tf 

num_vect >=6 # geets the result of num_vect >= 6 logically

my_char <- c("My","name","is") # create a character vector 

my_char # print variables of my_char

paste(my_char, collapse = " ") # Let's say we want to join the elements of my_char together into one continuous character string (i.e. a character vector of length 1). We can do this using the paste() function.

my_name <- c(my_char,"Ankit") # concatenate your name in the my_char variable

my_name # print contents of my_name

paste(my_name,collapse = " ") # above paste function

paste("Hello","world!", sep = " ") # we can join two character vectors of length 1 using paste() where the sep tells R that we want to seprate the elements with a single space

paste(1:3,c("X","Y","Z"),sep = "") # a complex join of two vectors each of length 3 

paste(LETTERS,1:4,sep = "-") # to show recycling function of R

