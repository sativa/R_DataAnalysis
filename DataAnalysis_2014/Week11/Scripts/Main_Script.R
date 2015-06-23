
x <- matrix( 1:12, nrow = 3, ncol = 4)
x 



# find median of each row
apply (x, 1, median) 


# find mean of each column
apply (x, 2, mean) 


#lapply() function returns a list: 
a=1:10

x <- list(a = 1:10, beta = exp(-3:3), logic = c(TRUE,FALSE,FALSE))



sapply (x, myFun) 

# simple function: calculate (x+1)2
myFun <- function (x) {
  x^2 + 2*x + 1
} 



myFun(3, 4)

# If you to do time profiling 

myFun <- function(x) {
   y = vector(length=x)
   for (i in 1:x) y[i]=i/(i+1)
  y
}

source ("log_script.R", echo = TRUE)
# get particular function from the script 
debug(inv_log2)

inv_log(3)


#debugging

setwd("R:\\bkamble\\V1.0\\R\\download\\Week11\\Scripts")

R:\bkamble\V1.0\R\download\Week11\RScripts.zip\Scripts


source ("log_script.R", echo = TRUE)
# get particular function from the script 
debug(inv_log)






system.time( myFun(1000000000) )
