# -----------------------------------------------------------------------------
# Program: Time Series Demo1.R  
# Author: Baburao Kamble
# Date: 11/10/2014
# Purpose:Time Series Data Conversion, visulization
# -----------------------------------------------------------------------------


library(ggplot2)
data<-read.csv("Mead_19902010.csv", header=TRUE, sep = ",")
head(data)
data$date<-as.Date(ISOdate(data$year, data$month, data$day))
attach(data)

#A default plot in ggplot2
g<-ggplot(data, aes(date, THigh))+geom_point(color="firebrick")+ggtitle('Temperature')
g
g+theme(plot.title = element_text(size=20, face="bold", vjust=2))
g+labs(x="Date", y=expression(paste("Temperature ( ", degree ~ C, " )")), title="Temperature")

g<-ggplot(nmmaps, aes(date, temp, color=factor(season)))+geom_point()
g

#Subset data by date range 
myfunc <- function(x,y){data[data$date >= x & data$date <= y,]}

data_20012004 <- myfunc(as.Date("2001-01-01"),as.Date("2005-12-31"))   
detach(data)
attach(data_20012004)

g <- ggplot(data, aes(x=date, y=SolarRad))+geom_line(color="grey")+geom_point(color="red")

season<- ifelse(month>10|month<3,"Winter", 
                        (ifelse(month>2&month<6,"Spring", "Fall")))

ggplot(data_20012004, aes(date, THigh, color=factor(season)))+
  geom_point() + scale_color_manual(values=c("dodgerblue4", "darkolivegreen4",
                              "darkorchid3", "goldenrod1"))

library(RColorBrewer)

#Categorical variables: try a built-in palette (based on colorbrewer2.org) (scale_color_brewer()):
ggplot(data_20012004, aes(date, THigh, color=factor(season)))+
  geom_point() + scale_color_brewer(palette="Set1")

#Tableau colors 
library(ggthemes)
ggplot(data_20012004, aes(date, THigh, color=factor(season)))+
  geom_point() + 
  scale_colour_tableau()

g<-ggplot(data_20012004, aes(x=season, y=THigh))
g+geom_boxplot(fill="darkseagreen4")

g+geom_jitter(alpha=0.5, aes(color=season),position = position_jitter(width = .2))




data_20012004$minTh<-data_20012004$THigh-sd(data_20012004$THigh, na.rm=T)
data_20012004$maxTh<-data_20012004$THigh+sd(data_20012004$THigh, na.rm=T)

g2 <-ggplot(data_20012004, aes(date, THigh))+geom_ribbon(aes(ymin=minTh, ymax=maxTh), fill="steelblue2", color="steelblue2")+
  geom_line(color="steelblue4", lwd=1)
g2
ggsave("ggplot1.pdf")




#An example is a data set of the number of births per month in New York city, 
#from January 1946 to December 1959 (originally collected by Newton).


#Time Series Plot 
births <- scan("http://robjhyndman.com/tsdldata/data/nybirths.dat")
summary(births)
#Store data as a time series object
birthstimeseries <- ts(births, frequency=12, start=c(1946,1))
plot.ts(birthstimeseries)



library(zoo)
data<-read.csv("Mead_19902010.csv", header = TRUE, sep = ",")
head(data)
data$Date<-as.Date(ISOdate(data$year, data$month, data$day))
library(xts)

# time series data frame for high tempearture
Temp <- as.xts(data$THigh,order.by=as.Date(data$Date))

#Convert daily data to weekly, monthly, quarterly and annual 
weekly    <-apply.weekly(Temp,mean)
monthly   <-apply.monthly(Temp,max)
quarterly <-apply.quarterly(Temp,min)
yearly    <-apply.yearly(Temp, sum)

plot.xts(Temp, main="Default plot.xts Chart") 










