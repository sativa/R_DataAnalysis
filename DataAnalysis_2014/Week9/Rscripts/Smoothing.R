# -----------------------------------------------------------------------------
# Program: Time Series Demo.R  
# Author: Baburao Kamble
# Date: 11/10/2014
# Purpose:Time Series Smoothing  
# -----------------------------------------------------------------------------

library(rcolorbrewer)

data<-read.csv("Data/Mead_Temp_19902010.csv", header=TRUE, sep = ",")
head(data)
tail(data)
# read Date string as Date 
data$Date <- as.Date(data$Date, "%m/%d/%Y")



attach(data)
# Method 1 - Moving average smoother
temp_10 = filter(Temp, sides=2, rep(1,10)/10) # This is a  10 period moving average


plot(Temp, type="o", ylab="Temperature",
     main="Mead Weather Station Temperature: 1990 - 2010")
lines(temp_10, col ="#ff0000") # Add the moving average line to the graph ...
legend( "topright",text.width=c(0,0.235), inset = c(0.1,-0.17),
        x.intersp=0.5, xjust=0,yjust=0, legend=c("10YrMA","Actual"), col=c("red", "black"),
        lwd=3, cex = 0.75, xpd = TRUE, horiz=T)




# Method 2 - Kernel Smoothing
# "Kernel smoothing is a moving average smoother that uses a weight function, or kernel, to average the observations"

# ksmooth function. The wider the bandwidth, b, the smoother the result."

plot(Temp, type="o", ylab="Temperature (C)",
     main="Mead Weather Station Temperature: 1990 - 2010")
lines(ksmooth(time(Temp), Temp, "normal", bandwidth = 10), col = "#008000")


# Method 3 - Smoothing Splines
# The code for the general smoothing spline estimation is provided on page 76 of the text ...
# Smoothing Splines
plot(Temp, type="o", ylab="Temperature (C)",
     main="Mead Weather Station Temperature: 1990 - 2010")
lines(smooth.spline(time(Temp), Temp, spar=1), col = "#0000FF") # This is use to estimate the trend


#Lets Combine all 

plot(Temp, type="o", ylab="Temperature (C)",
     main="Mead Weather Station Temperature: 1990 - 2010")
lines(smooth.spline(time(Temp), Temp, spar=1), col = "#0000ff0000") # This is use to estimate the trend
lines(ksmooth(time(Temp), Temp, "normal", bandwidth = 5), col = "#00ff00")
lines(temp_10, col = "#ff0000") # Add the moving average line to the graph ...

legend( "topright",text.width=c(0,0.35,0.35,0.35), inset = c(0.1,0), bty = "n", 
        x.intersp=0.5, xjust=0,yjust=0, 
        legend=c("10Yr MA","Kernel", "Splines", "Actual"),
        col=c( "red", "green", "blue", "black"), 
        lwd=3, cex = 0.75, xpd = TRUE)


#Holt–Winters procedure for advanced users 


