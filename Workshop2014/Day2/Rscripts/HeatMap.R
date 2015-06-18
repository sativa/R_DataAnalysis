# -----------------------------------------------------------------------------
# Program: HeatMap.R  
# Author: Baburao Kamble
# Date: 01/22/2015
# Purpose:Climate Heat Map Analysis and Visulization 
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

# calculate weeks and numerical week day

Temp.data <- transform(Temp,
                       week = as.POSIXlt(Date)$yday %/% 7 + 1,
                       wday = as.POSIXlt(Date)$wday,
                       year = as.POSIXlt(Date)$year + 1900)

head(Temp.data)

# Color ramp 
color3=c("#FF00FF","#0000FF","#006400","#7FFF00","#40E0D0","#D2B38C","#F5F5DC","#FFA500","#FF0000","#7F0000","#000000")

# Call ggplot2 
library(ggplot2)
# plot heat map 
ggplot(Temp.data, aes(week, wday, fill = Temp)) + 
  geom_tile(colour = "white") + 
  scale_fill_gradientn(colours = color3) + 
  facet_wrap(~ year, ncol = 1) +
  scale_x_continuous(breaks = round (seq(min(Temp.data$week), max(Temp.data$week), 3)))

