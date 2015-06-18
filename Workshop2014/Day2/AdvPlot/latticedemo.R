
library(lattice)


setwd("R:/bkamble/V1.0/R/download/Week6")


#Read in the data
weatherdata<-read.table(file = "Data/mead_2013.txt", header=TRUE, sep = "")


head(weatherdata)
weatherdata$Date <- as.Date(as.character(weatherdata$Date),format="%m/%d/%Y")


#data is attached to the R .
attach(weatherdata)
#Covert Date from dataframe to the Date format 



xyplot(THigh~TLow,data=weatherdata)

xyplot(THigh~TLow |DroughtAnalysis, data=weatherdata, main="TLow vs THigh")

mystyle<-standard.theme("pdf") #Get basic theme 
mystyle$superpose.symbol$pch<-16
mystyle$strip.background$col<-c("grey95")

xyplot(THigh~TLow |SeasonAnalysis, data=weatherdata, main="TLow vs THigh",
       par.settings=mystyle)



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






