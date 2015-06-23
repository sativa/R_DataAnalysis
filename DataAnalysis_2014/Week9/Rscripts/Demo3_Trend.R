# -----------------------------------------------------------------------------
# Program: Time Series Demo.R  
# Author: Baburao Kamble
# Date: 11/10/2014
# Purpose:Trend Analysis 
# -----------------------------------------------------------------------------


#Read Data
data<-read.csv("Data/Mead_Temp_19902010.csv", header=TRUE, sep = ",")
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




# trend analysis using  Fit Structural Time Series
par(mar = rep(1, 4))

fit <- StructTS(timeT, type = "trend")
plot(timeT)
lines(fitted(fit), col = "green")
tsdiag(fit)



