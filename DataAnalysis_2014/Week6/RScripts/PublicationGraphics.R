# -----------------------------------------------------------------------------
# Program: PublicationGraphics.R  
# Author: Baburao Kamble
# Date: 10/06/2014
# Purpose: Publication Graphics in R 
# -----------------------------------------------------------------------------



#Read Data 
setwd("R:/bkamble/V1.0/R/download/Week5/")
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

#Equation to put on graphics 
#bquote allows you to interpolate variables and expressions into a mathematical formula
eqn <- bquote(italic(y) == .(b0)*italic(x) * "," ~~ 
                r^2 ==.(r2) * "," ~~ RMSE == .(rmse))

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
#Place equation at proper place  
text(0.8,6.3, eqn, pos = 4, cex=1.2, family="Arial")

#dev.off()




