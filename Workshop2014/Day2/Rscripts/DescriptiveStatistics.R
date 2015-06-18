# -----------------------------------------------------------------------------
# Program: DescriptiveStatistics.R  
# Author: Baburao Kamble
# Date: 01/22/2015
# Purpose: Descriptive statistics in R 
# -----------------------------------------------------------------------------




setwd("R:/bkamble/V1.0/r-pac/download/Day2/Data")

mydata<-read.table(file = "mead_2013.txt", header=TRUE, sep = "")
#check the data 
head(mydata)



install.packages("psych")

#A general purpose toolbox for personality, psychometrics and experimental psychology. 
library(psych)

# describe function provides the ones most useful for
# scale construction and item analysis in classic psychometrics.

describe(mydata)



attach(mydata)


install.packages("stargazer") #Use this to install it, do this only once
library(stargazer)

# produce descriptive statistics

stargazer(mydata, type = "text", title="Descriptive statistics", digits=1, out="table1.txt")
# Same output, transposed (variables in columns)
stargazer(mydata, type = "text", title="Descriptive statistics", digits=1, out="table1.txt", flip=TRUE)
# Descriptive statistics: in text format, replacing variable names with labels

#Descriptive statistics: in text format, selected variables 
stargazer(mydata[c("THigh","RelHum","WindSpeed")], type = "text",
          title="Descriptive statistics/selected variables", digits=1, out="table2.txt")

#same output transposed and with labels instead of variable names
stargazer(mydata[c("THigh","RelHum","SoilTemp", "WindSpeed")], type = "text",
          title="Descriptive statistics/selected variables", digits=1, out="table2.txt", flip=TRUE,
          covariate.labels=c("Maximum Temperature","Relative Humidity","Soil Temperature", "Windspeed"))


