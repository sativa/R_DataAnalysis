# -----------------------------------------------------------------------------
# Program: Analysis.R  
# Author: Baburao Kamble
# Date: 01/22/2015
# Purpose: Students T-test and ANOVA
# -----------------------------------------------------------------------------


# Students T-test 

# independent 2-group t-test
t.test(y~x) # where y is numeric and x is a binary factor
# independent 2-group t-test
t.test(y1,y2) # where y1 and y2 are numeric
# paired t-test
t.test(y1,y2,paired=TRUE) # where y1 & y2 are numeric
# one sample t-test
t.test(y,mu=3) # Ho: mu=3




# ANOVA

#1. Fit a Model
# One Way Anova (Completely Randomized Design)
fit <- aov(y ~ A, data=mydataframe)
# Randomized Block Design (B is the blocking factor) 
fit <- aov(y ~ A + B, data=mydataframe)
# Two Way Factorial Design 
fit <- aov(y ~ A + B + A:B, data=mydataframe)
fit <- aov(y ~ A*B, data=mydataframe) # same thing
# Analysis of Covariance 
fit <- aov(y ~ A + x, data=mydataframe)

#2. Look at Diagnostic Plots
layout(matrix(c(1,2,3,4),2,2)) # optional layout 
plot(fit) # diagnostic plots

#3. Evaluate Model Effects
summary(fit) # display Type I ANOVA table
drop1(fit,~.,test="F") # type III SS and F Tests
