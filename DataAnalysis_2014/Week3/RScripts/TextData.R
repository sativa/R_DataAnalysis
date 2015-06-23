# -----------------------------------------------------------------------------
# Program: TextData.R  
# Author: Baburao Kamble
# Date: 09/15/2014
# Purpose: Read and Write Text Data in R 
# -----------------------------------------------------------------------------




#set working directory 
setwd("E:/Teaching/R/Lectures/week3/Text/")
# list the contents of the current directory
dir() 


# Read values from tab-delimited autos.dat 

wildlife_data_text <- read.table("Wildcats.txt", header=T, sep="\t")

#check the data 
head(wildlife_data)
# sample bar plot 
barplot(as.matrix(wildlife_data_text), main="Wildlife Data", ylab= "Total",
        beside=TRUE, col=rainbow(5))





#reading csv data 
MyData <- read.csv(file="csvdata.csv", header=TRUE, sep=",")
#check summary 
head(MyData)
attributes(MyData)
# calculations 
Tmean<-(MyData$Tmax+MyData$Tmin)/2
RMmean<-(MyData$Rhmax+MyData$Rhmin)/2

# insert Tmean and RHmean in the data frame 

MyData[, "Tmean"] <- Tmean
MyData[, "RMmean"] <- RMmean

summary(MyData)

#Excluding (DROPPING) Variables from the data frame 

MyData2 <- MyData[c(-3,-5)]
MyData2

write.csv(MyData2, file = "MyData.csv",row.names=TRUE)


#The subset function is probably the easiest way to select variables and observations.

MyData3 <- subset(MyData, Tmean >= 16 | Windspeed < 7,select=c(1:10)) 
MyData3










#reading excel data 

#install packages
install.packages("XLConnect", dependencies=TRUE) 
# Load the XLConnect package
require(XLConnect)
#Load the workbook
myfile = loadWorkbook("MyExcelData.xlsx")
# Read the data on the sheet named "Sheet2"
mydata = readWorksheet(myfile, sheet = "Sheet2", header = TRUE)
# check the variables 
head(mydata)
#check the summary 
head(summary)
#check the dimension 
dim(mydata)


res<-mydata*2




# Write excel data 

#Load workbook (create if not existing)
wb <- loadWorkbook("writeWorksheet.xlsx", create = TRUE) 
#Create a worksheet called 'Output'
createSheet(wb, name = "Output") 
# Write built-in data set 'Output' to the worksheet created above;
writeWorksheet(wb, res, sheet = "Output",rownames="Row Names") 
#save workbook (this actually writes the file to disk)
saveWorkbook(wb) 





# You can add analysis to same workbook as Output sheet 

#Create a worksheet called 'Output'
createSheet(myfile, name = "Output") 
# Write built-in data set 'Output' to the worksheet created above;
writeWorksheet(myfile, res, sheet = "Output",rownames="Row Names") 
#save workbook (this actually writes the file to disk)
saveWorkbook(myfile) 






#SPSS, Stata and data
library(foreign)
spssdata<- read.spss("Mydata.sav")
statadata <- read.dta("Mydata.dta")
sasdata <- read.xport("Mydata.xpt")



