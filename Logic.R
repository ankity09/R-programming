
TRUE == TRUE # the first logical operator we are going to work with is the equality operator "=="

(FALSE == TRUE) == FALSE # to check parenthesis in logical operations

6 == 7 # to check if 6 == 7

6 < 7 # to check if the number on the left hand side is less than the the number on the right hand side

10 <= 10 # to check the less than or equal to operator

5 != 7 # to check the not equal to operator

!5 == 7 #Let's take a moment to review. The equals operator `==` tests whether two boolean values or numbers are equal, the not equals operator `!=` tests whether two boolean values or numbers are unequal, and the NOT operator `!` negates logical expressions so that TRUE expressions become FALSE and| FALSE expressions become TRUE.

FALSE & FALSE # to check the working of the AND "&" operation

TRUE & c(TRUE,FALSE,FALSE) # to check the working of single AND "&"

TRUE && c(TRUE,FALSE,FALSE) # to check the working of double AND "&&" only the first element of the logical vector has been evaluated

TRUE | c(TRUE,FALSE,FALSE) # Let's test out the vectorized version of the OR operator.

TRUE || c(TRUE,FALSE,FALSE) # Let's test out the non-vectorized version of the OR operator.

5 > 8 || 6 != 8 && 4 > 3.9 # lets look at an example of an ambiguous case

isTRUE(6>4) # try using the function isTRUE()

identical('twins','twins') # try usin the identical operation

xor(5==6,!FALSE) #You should also be aware of the xor() function, which takes two arguments. The xor() function stands for exclusive OR. If one argument evaluates to TRUE and one argument evaluates to FALSE, then this function will return TRUE, otherwise it will return FALSE. Try out the xor() function by  typing: xor(5 == 6, !FALSE)

ints <- sample(10) # create a vector called ints

ints # display the contents of int

ints > 5 # we will get a logical vector corresponding to whether each element of ints is greater than 5

which(ints>7) # The which() function takes a logical vector as an argument and returns  the indices of the vector that are TRUE. For example which(c(TRUE, FALSE, TRUE)) would return the vector c(1, 3).

any(ints < 0) # Like the which() function, the functions any() and all() take logical vectors as their argument. The any() function will return TRUE if one or  more of the elements in the logical vector is TRUE. The all() function will return TRUE if every element in the logical vector is TRUE.

all(ints>0) # use the all() to check if all elements are greater than 0 in ints


