# -----------------------------------------------------------------------------
# Program: TrendAnalysis.R  
# Author: Baburao Kamble
# Date: 01/22/2015
# Purpose:Trend Analysis 
# -----------------------------------------------------------------------------

setwd("R:/bkamble/V1.0/R/download/Week9/Data/")
#Read Data
data<-read.csv("Mead_Temp_19902010.csv", header=TRUE, sep = ",")
head(data)
# read Date string as Date 
data$Date <- as.Date(data$Date, "%m/%d/%Y")

#Subset data by date range 
data<-data[data$Date >= as.Date("2001-01-01") & data$Date <= as.Date("2005-12-31"), ]

head(data)
attach(data)


#Seasonal Trend Decomposition using Loses 
#Convert data to the time series data frame using ts function or xts from zoo package 
timeT<-ts(data$Temp,frequency=365.25 )

#apply stl of the data
Temp.stl<-stl(timeT,s.window="periodic")

plot (Temp.stl)


#Fit Structural Time Series
#https://stat.ethz.ch/R-manual/R-devel/library/stats/html/StructTS.html

# trend analysis using  Fit Structural Time Series
par(mar = rep(1, 4))
#Fit a structural model for a time series by maximum likelihood.

fit <- StructTS(timeT, type = "trend")
plot(timeT)
