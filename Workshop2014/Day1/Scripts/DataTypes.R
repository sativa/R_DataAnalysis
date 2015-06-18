# -----------------------------------------------------------------------------
# Program: DataType.R  
# Author: Baburao Kamble
# Date: 01/21/2015
# Purpose: Data Types in R 
# -----------------------------------------------------------------------------


# Numeric
x = 10.5       # assign a decimal value 
x              # print the value of x 
class(x)       # print the class name of x 

is.integer(x) # is x an integer? 


# Integer 
y = as.integer(3) 
y              # print the value of y 
class(y)       # print the class name of y 
is.integer(y)  # is y an integer? 


#Complex
z = 1 + 2i     # create a complex number 
z              # print the value of z 
class(z) 
sqrt(as.complex(-1)) 

#Logical 
#Standard logical operations greater than, less than, equal to, are "&" (and), "|" (or), and "!" (negation).
x = 1; y = 2   # sample values 
z = x > y      # is x larger than y? 
z              # print the logical value 





#Vector 
# Numeric vector
A <-c(1, 2, 3, 4, 5,6 ) 
# Logical Vector 
B<-c(TRUE, FALSE, TRUE, FALSE, NA, TRUE) 
# Character vector
C<-c('NE','IA', 'KS', 'CO', 'ND', 'SD')

#check length of vector 
length(C)

#Get element of vector 
#Lets see,  I want only NE from C vector 
C[c(1)]





# Matrix
MatrixA = matrix( c(2, 4, 3, 1, 5, 7), nrow=2, ncol=3,   byrow = TRUE) 
MatrixA
#Get element of matrix 
MatrixA[1,2]

#Define row and column names 
dimnames(MatrixA) = list(  c("row1", "row2"),  c("col1", "col2", "col3"))
# row names...... it can be cat1, cat2
# column names... it can be Var1, Var2, Var3 


#Data frame
#A data frame is used for storing data tables.



mydata <- data.frame(A,B,C)
mydata
names(mydata) <- c("ID","Logic","State") # variable names
mydata

# Identify the elements of a data frame 

mydata[2:3] # Column 2 and 3 
mydata["State"] # Column by name 
mydata$Logic # Column by variable name 


# List
#List is collection of objects 

w <- list(name="MyObsservations", mynumbers=A, mymatrix=MatrixA, Height=5.9)
w
#get only one object
w$mymatrix




# Factors 

Wildlife <- c(rep("Lions",20), rep("Wildcats", 30), rep("Mt.Lions", 10)) 
Wildlife
Wildlife <- factor(Wildlife) 
Wildlife
summary(Wildlife)
