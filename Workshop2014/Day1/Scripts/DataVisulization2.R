# -----------------------------------------------------------------------------
# Program: DataVisulization2.R  
# Author: Baburao Kamble
# Date: 01/21/2015
# Purpose: Advanced Plotting  in R 
# -----------------------------------------------------------------------------

#2YAxis using time series data 

setwd("R:/bkamble/V1.0/R/download/Week6")


#Read in the data
weatherdata<-read.table(file = "Data/mead_2013.txt", header=TRUE, sep = "")


head(weatherdata)
#Covert Date from dataframe to the Date format 
weatherdata$Date <- as.Date(as.character(weatherdata$Date),format="%m/%d/%Y")


#data is attached to the R .
attach(weatherdata)
#par can be used to set or query graphical parameters for layouts 
par(mar=c(5,5,5,5))

plot(as.Date(Date),THigh,ylim=c(0,110), xlab="",ylab="y1", col="blue", las = 1)
title(main="Multiple Y-Axes Example")
# Draw second plot
par(new=TRUE)
plot(as.Date(Date),TLow,ylim=c(0,110),xaxt="n",yaxt="n",xlab="Date",ylab="",col="red", pch=16) 
axis(4,at=c(0,20,40,60,80,100)) # axis ticks 
mtext(side = 4, "Y2", line=2) # Y axis name 

#if you are not usre where to put your second Y axis use locator

text( locator(1),"This is Y Axis 2", srt = 270, xpd = TRUE)





# Purpose: Publication Graphics in R 
# -----------------------------------------------------------------------------



#Read Data 
setwd("R:/bkamble/V1.0/R/download/Week6/")
dir()
MyData = read.csv("Data/Data.csv", header = TRUE)
head(MyData)

# Handle missing data --- na.omit returns the object with incomplete cases removed
data=na.omit(MyData)

#Allocate x and y 
x = data$LAI_L7
y = data$LAI_L8
#make new data frame
mydata = data.frame(x,y)

#Regression analysis with intercept 0
fit <- lm(y~x) 
summary(fit)

# RMSE
# The root mean square error (RMSE) for 
# a regression model is similar to the standard deviation (SD) for the ideal measurement model.
rmse<-sd(fit$residual)




#Output directly saved in your directory 
#jpeg(filename = "Output.jpeg",width = 600, height = 600, units = "px", pointsize = 12,  quality = 100, bg = "white")

#par can be used to set or query graphical parameters. 
#pty: character specifying the type of plot region to be used;
#"s" generates a square plotting region and "m" generates the maximal plotting region.
par(pty="s")

#plot parameters 
plot(y ~ x, data = mydata,asp=FALSE,xlim=c(0,7),ylim=c(0,7),
     xlab = "Landsat 7", ylab = "Landsat 8", col = "black", 
     bg="grey",  pch = 21, cex=1.5, cex.lab=1.5 , cex.axis=1.5, family="Arial", 
     xaxs = "i", yaxs = "i")



#Plot regression line 
abline(fit,lty=2)
# line through origin  /(0,0)
abline(0,1,lty=1)

#abline(0,1,lty=1,col="green")
#abline(v=seq(0.5,10,0.5),lty=2,col="grey")
#abline(h=seq(1,6,2),lty=2,col="red")

#Title 
title(main = list("Leaf Area Index, LAI "  , cex = 1.5))

#Equation to put on graphics 
#bquote allows you to interpolate variables and expressions into a mathematical formula

cf <- round(coef(fit), 2) 
eq <- paste0("L8 = ", cf[1],
             ifelse(sign(cf[2])==1, " + ", " - "), abs(cf[2]), " L7 ")



#Place equation at proper place  
text(0.8,6.7, eq, pos = 4, cex=1.2, family="Arial")
## printing of the equation
mtext(eq, 1, line=-19)





