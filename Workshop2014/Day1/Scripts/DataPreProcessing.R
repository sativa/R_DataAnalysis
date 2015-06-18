# -----------------------------------------------------------------------------
# Program: DataPreprocessing.R  
# Author: Baburao Kamble
# Date: 01/21/2015
# Purpose:  Preprocessing - Data Subset, Merge and Reshape  in R 
# -----------------------------------------------------------------------------


#Subset data from the vector and data frame 
# V is sample vector
v <- c(1,4,4,3,2,2,3)
v
v1<-subset(v, v<3)
v1
v2<-v[v>3]
v2

# Character vector 
States <- c("NE", "ID", "KS", "ID", "KS", "NE", "CO", "SD", "ND")
# Remove "small" entries
subset(States, States!="NE")


#Merge two vectors or data frames 
#Vectors can be combined via the function c.
VStates<-c(v2, States)

# Lets consider two data frame 
DataFrameA <- 
#To merge two data frames (datasets) horizontally, use the merge function. 
#merge two data frames by ID
d <- c(1,2,3,4,5)
e <- c("NE", "KS", "IA", "ND", "SD")
f <- c(0.2, 0.34, 0.11, 0.23, 0.21)
DataFrameA <- data.frame(d,e,f)
names(DataFrameA) <- c("ID","State","Value") # variable names

DataFrameB <- data.frame(c(8,3,9,5),c("KS", "IA", "CA", "SD"),c(0.3, 0.65, 0.38, 0.45), c(1.2, 1.4, 1.7, 1.32))
names(DataFrameB) <- c("ID","State","Value", "Value2") # variable names

MergedData <- merge(DataFrameA,DataFrameB,by="ID")
MergedData
MergedData2 <- merge(DataFrameA,DataFrameB,by="State")
MergedData2
#To join two data frames (datasets) vertically, use the rbind function. 
Data3 <- cbind(DataFrameA,DataFrameB)

#Aggregation of data (mean, mode median)
attach(mtcars)
aggdata <-aggregate(mtcars, by=list(cyl,vs), 
                    FUN=mean, na.rm=TRUE)
print(aggdata)
detach(mtcars)

#Reshape the data frame 
library (reshape)
#Reshape is an R package for flexibly restructuring and aggregating data.


#Sorting data in ascending and descending
# ascending
newdata <- DataFrameA[order(State),] 
newdata
newdata2 <- DataFrameA[order(ID),] 
newdata2

#descending
newdata3 <- DataFrameA[order(-ID),] 
newdata3
newdata3 <- DataFrameA[order(State,decreasing = TRUE),] 
newdata3
