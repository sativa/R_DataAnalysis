setwd("R:/bkamble/V1.0/R/download/Week6")
library(ggplot2)

#Read in the data
weatherdata<-read.table(file = "Data/mead_2013.txt", header=TRUE, sep = "")


head(weatherdata)
weatherdata$Date <- as.Date(as.character(weatherdata$Date),format="%m/%d/%Y")


#data is attached to the R .
attach(weatherdata)
#Covert Date from dataframe to the Date format 


#Trend Plot
ggplot(data=weatherdata, aes(x=as.Date(Date), y=ET))+ geom_line()+geom_point() +
  xlab("Time")+ylab("ET")





q1<-qplot(as.Date(Date), TLow, data = weatherdata)
q1

#edit x lables to month and year 
q1+scale_x_date(labels = Dat("%m/%d"))
#Add a smoother.
q1+  stat_smooth(span = 0.99) + geom_point()

  
qplot(THigh, TLow, data=weatherdata, geom=c("smooth", "point"))



q2<-ggplot(weatherdata, aes(Date, THigh), +geom_point())


library(scales)

q2+ scale_x_date(labels = date_format("%W"))
q2+ scale_x_date(labels = date_format("%m/%d"))
q2+scale_x_date(breaks = date_breaks("months"),labels = date_format("%b"))
q2+ scale_x_date(breaks = "1 month", minor_breaks = "1 week")
q2+stat_smooth(span = 0.1) + geom_point()
