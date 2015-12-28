head(flags) # to view the first 6 lines of the dataset flags

dim(flags) # to check the dimensions the flags it has 194 rows and 30 coloumns

viewinfo(flags) # to open a more complete description of the dataset in a separate text file

class(flags) # to know the format for variables that have been stored

cls_list <- lapply(flags,class) # to apply the class() function to each column of the flags dataset and store the result in a variable called cls_list

cls_list # to view the contents of cls_list

class(cls_list) # to confirm that lapply() returned a list

as.character(cls_list) # to simplify cls_list as a character vector

cls_vect <- sapply(flags, class) # sapply calls lapply() behind the scenes and simplifies the result for us

class(cls_vect) # to confirm that sapply() simplified the result to character vector

#In general, if the result is a list where every element is of length one, then sapply() returns a vector. If the
# result is a list where every element is a vector of the same length (> 1), sapply() returns a matrix. If sapply()
# can't figure things out, then it just returns a list, no different from what lapply() would give you

sum(flags$orange) # if we want to know the total number of countries with, for example,color orange on thier flag

flag_colors <- flags[,11:17] #First, use flag_colors <- flags[, 11:17] to extract the columns containing the color data and store them in a new  data frame called flag_colors. (Note the comma before 11:17. This subsetting command tells R that we want all rows, but only columns 11 through 17.)

head(flag_colors) # to see the first 6 lines of flag_colors

lapply(flag_colors,sum) # to get a list containing the sum of each coloumn of flag_colors

sapply(flag_colors,sum) # to get a simplified vector

sapply(flag_colors,mean) # to find the proportion of flags containing each color

flag_shapes <- flags[,19:23] # will create a new data frame

lapply(flag_shapes,range) # the range function returns the min an max of its first argument which should be a numeric vector

shape_mat <- sapply(flag_shapes,range) # to simplify and store result in a matrix

shape_mat # view the contents of shape_mat

class(shape_mat) # to confirm the class of shape_mat

unique(c(3,4,5,5,5,6,6)) # to test the unique function

unique_vals <- lapply(flags,unique) # we want to know the unique values for each variable in the flags dataset

unique_vals # print the values of unique_vals

sapply(unique_vals,length) # to check the number of unique values for each variable

sapply(flags,unique) # check the above reuslt

lapply(unique_vals,function(elem) elem[2]) # get the second element of each variable in unique vals

