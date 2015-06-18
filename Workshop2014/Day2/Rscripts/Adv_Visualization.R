# -----------------------------------------------------------------------------
# Program: Adv_Visulization.R  
# Author: Baburao Kamble
# Date: 01/22/2015
# Purpose: Lattice and ggplot demo 
# -----------------------------------------------------------------------------
# run this command once
install.packages("lattice")
#call the package 
library(lattice)
#set working directory 
setwd("R:/bkamble/V1.0/R/download/Week6/Data/")


#Read in the data
weatherdata<-read.table(file = "mead_2013.txt", header=TRUE, sep = "")
head(weatherdata)
#Covert Date from dataframe to the Date format 
weatherdata$Date <- as.Date(as.character(weatherdata$Date),format="%m/%d/%Y")


#data is attached to the R .
attach(weatherdata)

# Convert months into season using the ifelse conditions 
SeasonAnalysis<- ifelse(month>10|month<3,"Winter", 
                (ifelse(month>2&month<6,"Spring", "Fall")))


# Simple xyplot 
xyplot(THigh~TLow,data=weatherdata)
#Add season componet 
xyplot(THigh~TLow |SeasonAnalysis, data=weatherdata, main="TLow vs THigh")



xyplot(THigh~TLow, weatherdata,
       grid = TRUE,
       scales = list(x = list(log = 10, equispaced.log = FALSE)),
       group = SeasonAnalysis, auto.key = TRUE)

xyplot(THigh~TLow, weatherdata,
       grid = TRUE,
       scales = list(x = list(log = 10,equispaced.log = FALSE)),
       group = SeasonAnalysis, auto.key = list(columns = 3),
       col = c("red", "blue","green"),
       type = c("p", "smooth"), lwd = 2, cex=2)
auto.key =list(space = "right", points = 5, lines = TRUE, cex=0.25))





# Change color theme 
trellis.device(color = FALSE)
ltheme <- canonical.theme(color = FALSE) ## in-built B&W theme 
ltheme$strip.background$col <- "transparent" ## change strip bg 
lattice.options(default.theme = ltheme) ## set as default 

# Plot again 

xyplot(THigh~TLow |SeasonAnalysis, data=weatherdata, main="TLow vs THigh")


###############################################################################################
# ggplot demo 
###############################################################################################


install.packages("ggplot2")
library(ggplot2)


setwd("R:/bkamble/V1.0/R/download/Week6/Data/")

#Read in the data
weatherdata<-read.table(file = "mead_2013.txt", header=TRUE, sep = "")



head(weatherdata)
weatherdata$Date <- as.Date(as.character(weatherdata$Date),format="%m/%d/%Y")


#data is attached to the R .
attach(weatherdata)

#Simple plot in ggplot
qplot(THigh, TLow, data = weatherdata)


season<- ifelse(TLow<40,"Winter", 
                (ifelse(TLow>40&TLow<60,"Spring", "Fall/Summer")))

qplot(THigh, TLow, data = weatherdata, color = season)


#Trend Plot
ggplot(data=weatherdata, aes(x=as.Date(Date), y=ET))+ geom_line()+geom_point() +
  xlab("Time")+ylab("ET")





q1<-qplot(as.Date(Date), TLow, data = weatherdata)
q1

#Add a smoother.
q1+  stat_smooth(span = 0.99) + geom_point()

# Smooth Line 
qplot(THigh, TLow, data=weatherdata, geom=c("smooth", "point"))


q2 <-ggplot(data=weatherdata, aes(x=as.Date(Date), y=THigh))+ geom_point() 
q2 
#Install scale package 
library(scales)
# Adjust scale
q2+ scale_x_date(labels = date_format("%W"))
q2+ scale_x_date(labels = date_format("%m/%d"))
q2+scale_x_date(breaks = date_breaks("months"),labels = date_format("%b"))
q2+ scale_x_date(breaks = "1 month", minor_breaks = "1 week")
q2+stat_smooth(span = 0.1) + geom_point()+ xlab("Time")
q2+theme(axis.text=element_text(size=15, angle= 20, hjust=2),
        axis.title=element_text(size=14,face="bold", angle = 0))

