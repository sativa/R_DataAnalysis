# -----------------------------------------------------------------------------
# Program: DataType.R  
# Author: Baburao Kamble
# Date: 01/21/2015
# Purpose: Data Input, Output
# -----------------------------------------------------------------------------



#set working directory 
setwd("R:/Data/Text")  # Windows 

#setwd()                                      #Unix
# list the contents of the current directory
dir() 

#Text Data 
# Read values from tab-delimited
wildlife_data_text <- read.table("Wildcats.txt", header=T, sep="\t")
#check the data 
head(wildlife_data)
# sample bar plot 
barplot(as.matrix(wildlife_data_text), main="Wildlife Data", ylab= "Total",
        beside=TRUE, col=rainbow(5))

# Seperated Data
# Comma, semicolon or tab separated values

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

#install XLConnect packages (one time)
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
#Create a worksheet called 'NEUnion'
createSheet(wb, name = "NEUnion") 
# Write built-in data set 'NEUnion' to the worksheet created above;
writeWorksheet(wb, res, sheet = "NEUnion",rownames="Row Names") 
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








