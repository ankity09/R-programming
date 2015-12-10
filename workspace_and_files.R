## Workspace and Files



getwd() #to print the current working directory

ls() #list all the objects in your local workspace

x <- 9 # assign 9 to x

list.files() # list all the files in your working directory using list.files() or dir().

?list.files #to check the help page for list.files

args(list.files) # the args function is used to determine the arguments to list.files()

old.dir <- getwd() # assign the value of the current working directory to a variable called old.dir

dir.create("testdir") #to create a directory in the current working directory called tesrdir

setwd("testdir") # set your working directory to testdir with setwd()

file.create("mytest.R") # create a file in your working directory using file.create() function

file.exists("mytest.R") # check to see if mytest.R exists in the working directory using file.exists()

file.info("mytest.R") # acces information about file mytest.R using file.info()

file.rename("mytest.R","mytest2.R") # rename file mytest.R to mytest2.R

file.copy("mytest2.R","mytest3.R") # make a copy of mytest2.R called mytest3.R using file.copy()

file.path("mytest3.R") #proivde the relative path to file mytest3.R using file.path()

file.path("folder1","folder2") # Pass 'folder1' and 'folder2' as arguments to file.path to make a platform-independent pathname.

dir.create(file.path("testdir2","testdir3"),recursive = TRUE) # in order ti create nested directories 'recursive must be set to TRUE

unlink("testdir2",recursive = TRUE) # delete the testdir2 directory with recursive = TRUE to delete subdirectories

setwd(old.dir) # go back to original working directory

unlink("testdir",recursive = TRUE) # delete the testdir directory with everythin in it


