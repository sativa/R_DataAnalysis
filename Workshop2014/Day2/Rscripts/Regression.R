# -----------------------------------------------------------------------------
# Program: Regression.R  
# Author: Baburao Kamble
# Date: 01/22/2015
# Purpose: Regression analysis 
# -----------------------------------------------------------------------------



setwd("R:\bkamble\V1.0\r-pac\download\Day2\Data")

#Read in the data
weatherdata<-read.table(file = "mead_2013.txt", header=TRUE, sep = "")
head(weatherdata)

########################################################################
# Find estimated simple linear regression model (sample model)
X<-weatherdata$T.High
Y<-weatherdata$ET
#Fit the simple linear regression model and save the results in fit
#lm is used to fit linear models.
fit<-lm(formula = Y~X)

plot(X,Y)
abline(fit)

#A very brief look of what is inside of fit - see the summary function for a better way
fit

#See the names of all of the object components
names(fit)
fit$coefficients

#Model dignositic and Interpreting 
summary(fit) # show results


# Other useful functions 
coefficients(fit) # model coefficients
confint(fit, level=0.90) # CIs for model parameters 
fitted(fit) # predicted values
residuals(fit) # residuals
anova(fit) # anova table 
vcov(fit) # covariance matrix for model parameters 
influence(fit) # regression diagnostics

layout(matrix(c(1,2,3,4),2,2)) # optional 4 graphs/page 
#Specifically, the command partitioned the graphics window into four parts, 
#two rows by two columns, so four graphs could be plotted in one window.
par(mfrow=c(2,2))
plot(fit)

#reset window back to the oroginal structure 
par(mfrow=c(1,1))


#Prediction 



plot(fit, id.n = 5, labels.id = NULL)  # 5 id numbers ....labels.id: vector of labels:NULL uses obs number
#Cook's distances instead of Residual-Leverage plot
plot(fit, which = 1:4)



predict(fit, data.frame(X=c(80,90)))
predict(fit, data.frame(X=c(80,90)), level = 0.95, interval = "confidence") 



########################################################################
#Put sample model on plot

#Open a new graphics window
win.graph(width = 10, height = 10, pointsize = 11) #windows
x11(width = 10, height = 10, pointsize = 11) #mac

#Same scatter plot as before

plot(X,Y, 
     xlab = "High Temperature", ylab = "ET", main = "High Temperature vs. ET", 
     xlim = c(0,110), ylim = c(0,0.6), 
     col = "black", pch = 1, cex = 1.0, panel.first=grid(col = "gray", lty = "dotted"))

#Puts the line y = a + bx on the plot
demo(plotmath)
abline(a = fit$coefficients[1], b = fit$coefficients[2], lty = 1, col = "blue", lwd = 2)

abline(lm(Y ~ X + 0), lty = 1, col="blue",lwd = 2)

abline(v=60,col="red")
abline(h=0.3,col="red")

abline(h=0.2,v=70,col="blue")

#Notice the above line goes outside of the range of the x-values.  To prevent this, we can use the segments function
#Open a new graphics window - do not need to
win.graph(width = 6, height = 6, pointsize = 10)

#Same scatter plot as before

plot(X,Y, 
     xlab = "High Temperature", ylab = "ET", main = "High Temperature vs. ET", 
     xlim = c(0,110), ylim = c(0,0.6), 
     col = "black", pch = 1, cex = 1.0, panel.first=grid(col = "gray", lty = "dotted"))



#Another way
curve(expr = fit$coefficients[1] +  fit$coefficients[2]*x, xlim =
  c(min(X), max(X)), add = TRUE, col = "red")

#demo(plotmath)
# Multiple Linear Regression Example 
#A matrix of scatterplots all possible combinantions 
pairs (weatherdata)


fit <- lm(y ~ x1 + x2 + x3, data=mydata)
summary(fit) # show results




library(ggplot2)
library(gridExtra)
a <- signif(coef(fit)[1], digits = 2)
b <- signif(coef(fit)[2], digits = 2)
textlab <- paste("y = ",b,"x ",a, sep="")
print(textlab)

p1 <- ggplot(weatherdata, aes(x = X, y = Y))

p2 <- p1 + geom_point(color="red") + geom_smooth(method = "lm", se = TRUE)

##add regression text using geom_text
p3<- p2 + geom_text(aes(x = 25, y = 0.5, label = textlab), color="black", size=5, parse = FALSE)

##add regression text using annotate
p4 <- p3 + annotate("text",x = 25, y = 0.5, label = textlab, color="black", size = 5, parse=FALSE)

grid.arrange(p3, p4, nrow=1)






# Purpose: Demontstaion of Multiple Linear Regression Example
# -----------------------------------------------------------------------------


mydata<-read.table(file = "mead_2013.txt", header=TRUE, sep = "")

head(mydata)

# Multiple Linear Regression Example
fit <- lm(ET ~ THigh + RelHum + SolarRad, data=mydata)
summary(fit) # show results
# Other useful functions
coefficients(fit) # model coefficients
confint(fit, level=0.95) # CIs for model parameters 
fitted(fit) # predicted values
residuals(fit) # residuals
anova(fit) # anova table 
vcov(fit) # covariance matrix for model parameters 
influence(fit) # regression diagnostics

