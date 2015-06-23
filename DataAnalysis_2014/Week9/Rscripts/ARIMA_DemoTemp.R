# -----------------------------------------------------------------------------
# Program: Time Series Demo1.R  
# Author: Baburao Kamble
# Date: 11/10/2014
# Purpose:Autoregressive integrated moving average 
# -----------------------------------------------------------------------------

library(TSA)



library(zoo)
data<-read.csv("Data/Mead_19902010.csv", header = TRUE, sep = ",")
head(data)
# merge year month and day in Date format using ISOdate 
data$Date<-as.Date(ISOdate(data$year, data$month, data$day))
library(xts)

# time series data frame for high tempearture
Temp <- as.xts(data$THigh,order.by=as.Date(data$Date))

#Convert daily data to  monthly
monthly   <-apply.monthly(Temp,mean)

plot(monthly, main = "Monthly Average Temp at Mead, Nebraska")

Ttimeseries <- ts(monthly, frequency=12, start=c(1990,1))
# Exhibit 10.2
plot(window(Ttimeseries, start = c(2000,1)), 
     main = "Monthly Average Temp with Monthly Symbols", 
     ylab = "Temp (c)")
# specify the y-label as Temp", otherwise it will use "window(Temp,start=c(2000,1))"
Month <- c("J","F","M","A","M","J","J","A","S","O","N","D")
points(window(Ttimeseries, start = c(2000,1)), pch = Month)




# ARIMA modeling  
par(mfrow = c(1,1))
acf(as.vector(Ttimeseries), lag.max = 36, 
    main = expression(Sample~~ACF~~of~~Temp~~Levels))

# 
plot(diff(Ttimeseries), 
     main = expression(Time~~Series~~Plot~~of~~the~~First~~Differences~~of~~
                         Ttimeseries~~Levels), 
     ylab = expression(First~~Difference~~of~~Ttimeseries)) 

# 
acf(as.vector(diff(Ttimeseries)), lag.max = 36,
    main = expression(Sample~~ACF~~of~~the~~First~~Differences~~of~~
                        Ttimeseries~~Levels))


# 
plot(diff(diff(Ttimeseries), lag = 12), 
     main = expression(Time~~Series~~Plot~~of~~the~~First~~and~~
                         Seasonal~~Differences~~of~~Ttimeseries~~Levels),
     ylab = expression(First~~and~~Seasonal~~Difference~~of~~Ttimeseries)) 

# 
acf(as.vector(diff(diff(Ttimeseries), lag = 12)), lag.max = 36, 
    ci.type = "ma", 
    main=expression(Sample~~ACF~~of~~the~~First~~and~~Seasonal~~Differences~~of~~
                      Ttimeseries~~Levels))

#

library(forecast)
m1.Temp <- Arima(Ttimeseries, order = c(0,1,1), 
                seasonal = list(order=c(0,1,1), period = 12))
m1.Temp

# first thirteen residuals are omitted from the plot.
plot(window(rstandard(m1.Temp), start = c(1995,2)),
     ylab = "Standardized Residuals", type = "o",
     main = expression(Residuals~~from~~the~~ARIMA(list(0,1,1))%*%(list(0,1,1))[12]~~Model))
abline(h = 0)

# 
acf(as.vector(window(rstandard(m1.Temp), start = c(1995,2))),
    lag.max = 36, 
    main = expression(ACF~~of~~Residuals~~from~~the~~ARIMA(list(0,1,1))%*%(list(0,1,1))[12]~~Model))

# The figures in the above two exhibits can also be obtained as the first two sub-plots from the
# following command. The plotting convention is slightly different for the first sub-plot.
# by default, the first 13 residuals are ommited; please use ?tsdiag to learn
# more about the function.
tsdiag(m1.Temp, gof.lag = 36)

# 

hist(window(rstandard(m1.Temp), start = c(1995,2)),
     xlab = "Standardized Residuals",
     main = expression(Residuals~~from~~the~~ARIMA(list(0,1,1))%*%(list(0,1,1))[12]~~Model))

#
qqnorm(window(rstandard(m1.Temp), start = c(1995,2)),
       main = expression(Normal~~Q-Q~~Plot))
title(main = expression(Residuals~~from~~the~~ARIMA(list(0,1,1))%*%(list(0,1,1))[12]~~Model),
      line = 3)
qqline(window(rstandard(m1.Temp),start=c(1995,2)))











# Seasonal ARIMA
m2.Temp <- Arima(Ttimeseries, order = c(0,1,2), 
                seasonal = list(order=c(0,1,1), period = 12))
m2.Temp

# Use ARIMA for next 24 months temperature prediction
plot(m1.Temp, n1 = c(2000,1), n.ahead = 24, 
     col = "red", xlab = "Year", type = "o",
     ylab = expression(Temp~~Levels),
     main = expression(Forecasts~~and~~Forecast~~Limits~~"for"~~the~~Temp~~Model))
# Note that for is a reserved word in R so it has to be enclosed in quotation marks.
fc1.m1.Temp <- forecast(m1.Temp, 24)
plot(fc1.m1.Temp)


# Prediction for next 48 months 
plot(m1.Temp, n1 = c(2004,1), n.ahead = 48, col = "red", 
     xlab = "Year", type = "o", 
     ylab = expression(Temp~~Levels),
     main = expression(Long~~Term~~Forecasts~~"for"~~the~~Temp~~Model))

fc2.m1.Temp <- forecast(m1.Temp, 48)
plot(fc2.m1.Temp)