# -----------------------------------------------------------------------------
# Program: Demo Stock Market.R  
# Author: Baburao Kamble
# Date: 11/10/2014
# Purpose:Time Series Stock market Analysis and Visulization 
# -----------------------------------------------------------------------------



stock <- "IBM"
start.date <- "2011-01-01"
end.date <- Sys.Date()
quote <- paste("http://ichart.finance.yahoo.com/table.csv?s=",
               stock, "&a=", substr(start.date,6,7), "&b=", substr(start.date, 9, 10),
               "&c=", substr(start.date, 1,4), "&d=", substr(end.date,6,7),
               "&e=", substr(end.date, 9, 10), "&f=", substr(end.date, 1,4),
               "&g=d&ignore=.csv", sep="")    
stock.data <- read.csv(quote, as.is=TRUE)
head(stock.data)

stock.data <- transform(stock.data,
                        week = as.POSIXlt(Date)$yday %/% 7 + 1,
                        wday = as.POSIXlt(Date)$wday,
                        year = as.POSIXlt(Date)$year + 1900)

head(stock.data)


library(ggplot2)
ggplot(stock.data, aes(week, wday, fill = Adj.Close)) + 
  geom_tile(colour = "white") + 
  scale_fill_gradientn(colours = c("#D61818","#FFAE63","#FFFFBD","#B5E384")) + 
  facet_wrap(~ year, ncol = 1)






