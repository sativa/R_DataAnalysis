# -----------------------------------------------------------------------------
# Program: Script2.R  
# Author: Baburao Kamble
# Date: 10/27/2014
# Purpose: Demontstaion of Probability  distributions
# -----------------------------------------------------------------------------



#The Normal Distribtion
pnorm(27.4, mean=50, sd=20)
pnorm(27.4, 50, 20)

qnorm(0.95, mean=100, sd=15)

#The Binomial Distribtion
dbinom(27, size=100, prob=0.25)



## Display the Student's t distributions with various degrees of freedom and compare to the normal distribution

x <- seq(-4, 4, length=100)
hx <- dnorm(x)

degf <- c(1, 3, 8, 30)
colors <- c("red", "blue", "darkgreen", "gold", "black")
labels <- c("df=1", "df=3", "df=8", "df=30", "normal")

plot(x, hx, type="l", lty=2, xlab="x value",
     ylab="Density", main="Comparison of t Distributions")

for (i in 1:4){
  lines(x, dt(x,degf[i]), lwd=2, col=colors[i])
}

legend("topright", inset=.05, title="Distributions",labels, lwd=2, lty=c(1, 1, 1, 1, 2), col=colors)


x <- seq(from=0, to=6, length.out=100)   
par(mfrow=c(2,2))                                   # Create a 2x2 plotting area

plot(x, dunif(x,min=2,max=4), main="Uniform",       # Plot a uniform density
     type='l', ylim=c(0, 0.6))
plot(x, dnorm(x,mean=3,sd=1), main="Normal",        # Plot a Normal density
     type='l', ylim=c(0, 0.6))
plot(x, dexp(x,rate=1/2), main="Exponential",       # Plot an exponential density
     type='l', ylim=c(0, 0.6))
plot(x, dgamma(x,shape=2,rate=1), main="Gamma",     # Plot a gamma density
     type='l', ylim=c(0, 0.6))



#A raw density plot is rarely useful or interesting by itself, and we usually shade a region of interest.





#summer temparture at any location 
mean=80
sd=10
lb=60
ub=100

data <- seq(-4,4,length=100)*sd + mean


hx <- dnorm(data,mean,sd)

plot(data, hx, type="n", xlab="Temperature Values", ylab="",
     main="Normal Distribution", axes=FALSE)

i <- data>= lb & data <= ub
lines(data, hx)
polygon(c(lb,data[i],ub), c(0,hx[i],0), col="red") 

area <- pnorm(ub, mean, sd) - pnorm(lb, mean, sd)
result <- paste("P(",lb,"< Temp <",ub,") =",
                signif(area, digits=3))
mtext(result,3)
axis(1, at=seq(40, 160, 20), pos=0)


# Another Example 


x <- seq(from=-3, to=+3, length.out=100)
y <- dnorm(x)
plot(x, y, main="Standard Normal Distribution", type='l',
     ylab="Density", xlab="Quantile")
abline(h=0)
# The body of the polygon follows the density curve where 1 <= z <= 2
region.x <- x[1 <= x & x <= 2]
region.y <- y[1 <= x & x <= 2]

# We add initial and final segments, which drop down to the Y axis
region.x <- c(region.x[1], region.x, tail(region.x,1))
region.y <- c(0, region.y, 0)
#call Polygon to plot the boundary of the region and fill it
polygon(region.x, region.y, density=10)








