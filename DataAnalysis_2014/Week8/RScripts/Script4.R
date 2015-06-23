
# -----------------------------------------------------------------------------
# Program: Script4.R  
# Author: Baburao Kamble
# Date: 10/27/2014
# Purpose: Hypothesis testing and  comparison of means
# -----------------------------------------------------------------------------
# 1) Setting up a hypothesis test
# 2) Calculating test statistics and p-values
# 3) Comparing two means

data(sunspots)
sample.mean <- mean(sunspots)
sample.sd <- sd(sunspots)
n <- length(sunspots)
mu_0 <- 50

t.stat <- (sample.mean - mu_0)/(sample.sd/sqrt(n))
t.stat

#  Once you have a t-statistic, what do you do with it?  We want to know how 
#  unusual this value of the t-statistic would be if the null hypothesis is 
#  true, where "unusual" is defined by the alternative hypothesis.  We use the 
#  distribution function for our test statistic in order to calculate this 
#  probability.   Since this sample is so large, we can use the normal 
#  distribution to calculate probabilities:

#  H_A : mu not equal to 51.25

p.value <- pnorm(-t.stat, 0, 1) + 1 - pnorm(t.stat, 0, 1)
p.value

#  H_A : mu greater than 51.25

p.value <- 1 - pnorm(t.stat, 0, 1)
p.value

#  H_A:  mu less than 51.25

p.value <- pnorm(t.stat, 0, 1)
p.value

#  We can use the t.test function when we are testing a hypothesis about a continuous variable:

t.test(sunspots, mu=mu_0, alternative = "two.sided")
t.test(sunspots, mu=mu_0, alternative = "greater")
t.test(sunspots, mu=mu_0, alternative = "less")

#  For proportions, the approach is slightly different because you don't have 
#  to estimate the variance of the data; the variance is a function of the 
#  null hypothesis.

aa <- rbinom(100, 1, .6)

#  Let's test the hypothesis that pi = .5 against the alternative that pi is not
#  equal to 0.5:

z.stat <- (mean(aa) - 0.5)/sqrt(0.5*(1 - 0.5)/100)
z.stat
pnorm(-z.stat) + 1 - pnorm(z.stat)

#  Either way, we compare our p-value to the level that we set beforehand for
#  the test.  If p-value < alpha, then we reject the null hypothesis.  If 
#  p-value > alpha, we fail to reject the null.

#3) Comparing two means

Vec1 <- rnorm(10, mean = 4, sd = 5)
Vec2 <- rnorm(20, mean = 5, sd = 5)

#  Test the null hypothesis 
t.test(Vec1, Vec2, alternative = "two.sided", var.equal = TRUE)
#  We can also see what happens when we don't assume equal variances:
t.test(Vec1, Vec2, alternative = "two.sided", var.equal = FALSE)
#  Or, we could test a one-sided hypothesis:
t.test(Vec1, Vec2, alternative = "less", var.equal = TRUE)
t.test(Vec1, Vec2, alternative = "greater", var.equal = TRUE)
#  with the alternative that the difference is not equal to 1
t.test(Vec1, Vec2, mu = 1, alternative = "two.sided", var.equal = TRUE)