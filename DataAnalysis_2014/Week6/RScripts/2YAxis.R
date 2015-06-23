# -----------------------------------------------------------------------------
# Program: 2YAxix.R  
# Author: Baburao Kamble
# Date: 10/06/2014
# Purpose: Plot Two Y axis 
# -----------------------------------------------------------------------------

setwd("R:/bkamble/V1.0/R/download/Week6")


#Read in the data
weatherdata<-read.table(file = "Data/mead_2013.txt", header=TRUE, sep = "")


head(weatherdata)
weatherdata$Date <- as.Date(as.character(weatherdata$Date),format="%m/%d/%Y")


#data is attached to the R .
attach(weatherdata)
#Covert Date from dataframe to the Date format 
par(mar=c(5,5,5,5))

plot(as.Date(Date),THigh,ylim=c(0,110), xlab="",ylab="y1", las = 1)
title(main="Multiple Y-Axes Example")
# Draw second plot
par(new=TRUE)
plot(as.Date(Date),TLow,ylim=c(0,110),xaxt="n",yaxt="n",xlab="Date",ylab="",pch=16) 
axis(4,at=c(0,20,40,60,80,100)) # axis ticks 
mtext(side = 4, "Y2", line=2) # Y axis name 

#if you are not usre where to put your second Y axis use locator

text( locator(1),"This is Y Axis 2", srt = 270, xpd = TRUE)
