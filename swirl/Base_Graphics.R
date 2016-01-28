data(cars) # load included dataframe cars
?cars # help page for cars
head(cars) # to view the first 6 lines of cars
plot(cars) # 
?plot
plot(x=cars$speed,y=cars$dist) # plot to show speed on the x-axis and dist on the y-axis from the cars data frame
plot(x=cars$dist,y=cars$speed) # opposite of what we did above
plot(x = cars$speed,y = cars$dist , xlab = "Speed") # to create a plot with xlabel as Speed
plot(x = cars$speed,y = cars$dist,ylab = "Stopping Distance") # to create a plot with y label as Stopping distance
plot(x = cars$speed,y = cars$dist,xlab= "Speed" , ylab = "Stopping Distance") # to create a plot with y label as Stopping distance
plot(x = cars$speed,y = cars$dist,xlab= "Speed" , ylab = "Stopping Distance",main="My Plot") # add a title My Plot
plot(cars,main= "My Plot")
plot (cars,sub="My Plot Subtitle")

#The plot help page (?plot) only covers a small number of the many arguments that can be passed in to plot() and to other graphical functions. To
# begin to explore the many other options, look at ?par. Let's look at some of the more commonly used ones. Continue using plot(cars, ...) as the
# base answer to these questions.
plot(cars,col=2) # the plotted points are colored red
plot(cars,xlim=c(10,15)) # plot cars while limiting x-axis to 10 through 15

# You can also change the shape of the symbols in the plot. the help page for points(?points provides the details)
plot(cars,pch =2) # plot cars using triangles
data(mtcars) # load the mtcars dataframe
?boxplot 
boxplot(formula = mpg ~ cyl,data = mtcars) # use boxplot with formula and data = mtcars
hist(mtcars$mpg) #  to create a histogram

# In this lesson, you learned how to work with base graphics in R. The best place to go from here is to study the ggplot2 package. If you want to
# explore other elements of base graphics, then this web page (http://www.ling.upenn.edu/~joseff/rstudy/week4.html) provides a useful overview.

# There is a school of thought that this approach is backwards, that we should teach ggplot2 first. See
# http://varianceexplained.org/r/teach_ggplot2_to_beginners/ for an outline of this view.
