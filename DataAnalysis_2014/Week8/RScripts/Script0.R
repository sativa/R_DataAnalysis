# -----------------------------------------------------------------------------
# Program: Script0.R  
# Author: Baburao Kamble
# Date: 10/27/2014
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
