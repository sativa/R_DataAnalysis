# -----------------------------------------------------------------------------
# Program: Script4.R  
# Author: Baburao Kamble
# Date: 10/27/2014
# Purpose: Hypothesis testing Prelim
# -----------------------------------------------------------------------------


library(prob)

# Toss coin experiment 
#Consider the random experiment of tossing a coin. The outcomes are H and T.
tosscoin(1) #We could toss it more times 
tosscoin(3)

# Role dice experimenet 
rolldie(1)
#The rolldie function defaults to a 6-sided die, but we can specify others with the nsidesargument.
rolldie(3, nsides = 6)

head(cards())


outcomes <- rolldie(1)
We will start with the experiment of rolling a die, so that n = 6.

p <- rep(1/6, times = 6)
#Forms a probability space from a set of outcomes and (optional) vector of probabilities.

probspace(outcomes, probs = p)




#Mean, Variance, and Standard Deviation
#Mean:arithmetic average of the values in the set
#Variance:arithmetic average of the squared differences between the values and the mean
#Standard deviation: square root of the variance
x<-c(1,2,3,4,5,6)
mean (x)     # mu
var (x)      # sigma 
sd(x)


#Weighted mean, variance and standard deviation calculations
library(SDMTools)
wt<-c(0.5,0.4,0.3,0.2,0,0.1)
wt.mean(x, wt)
wt.var(x, wt)
wt.sd(x, wt)





