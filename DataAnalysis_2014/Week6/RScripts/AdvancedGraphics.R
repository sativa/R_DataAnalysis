# -----------------------------------------------------------------------------
# Program: AdvancedGraphics.R  
# Author: Baburao Kamble
# Date: 10/06/2014
# Purpose: ggplot2 Demo
# -----------------------------------------------------------------------------

setwd("R:/bkamble/V1.0/R/download/Week6")
library(ggplot2)

#Read in the data
weatherdata<-read.table(file = "Data/mead_2013.txt", header=TRUE, sep = "")


head(weatherdata)
weatherdata$Date <- as.Date(as.character(weatherdata$Date),format="%m/%d/%Y")


#data is attached to the R .
attach(weatherdata)
#Covert Date from dataframe to the Date format 



Tmean<-(THigh+TLow)/2
#ifelse(test, yes, no)
DroughtAnalysis<- ifelse(Tmean>80,"Drought", "Normal")

DroughtAnalysis

#Create Seasons catageories based on ifelse
SeasonAnalysis<- ifelse(as.Date(Date)<"2012-5-1","Winter", 
                 (ifelse(as.Date(Date)<"2012-9-1","Fall", "Spring")))

#add data into data-frame 
weatherdata$DroughtAnalysis<-DroughtAnalysis
weatherdata$SeasonAnalysis<-SeasonAnalysis



#Plot data seperated by two catageroies 
qplot(Tmean,ET,data=weatherdata, 
      facets=~DroughtAnalysis, geom=c("point"),main="TLow vs THigh")

#
q1<-qplot(Tmean,ET,data=weatherdata, 
      facets=~SeasonAnalysis, geom=c("point"),main="Tmean vs ET",color=SeasonAnalysis)

q1

q1+   
  theme(legend.position="bottom") + # Move legend 
  labs(linetype='custom title') 
  theme(legend.title=element_blank()) ## Remove title for all legends





ggplot(weatherdata, aes (x=Tmean, y=ET)) + geom_point()

#We can add group to the color of the points, by adding specifying aesthetics for that particular geom


ggplot(weatherdata, aes (x=Tmean, y=ET)) + geom_point(aes(color=DroughtAnalysis))


#Create basic layer 
q1<-ggplot(weatherdata, aes (x=Tmean, y=ET,color=DroughtAnalysis))+ geom_point(shape=2) + scale_colour_hue(l=50)  

q1

# Add regression lines 
ggplot(weatherdata, aes(x=Tmean, y=ET)) + geom_point(shape=1) + scale_colour_hue(l=50) + geom_smooth(method = lm, se=TRUE) 



ggplot(weatherdata, aes(x=Tmean, y=ET,color=DroughtAnalysis)) + 
    geom_point(shape=1) + scale_colour_hue(l=50) + 
    geom_smooth(method = lm, se=TRUE) 


#Histogram 
ggplot(weatherdata, aes(x=Tmean)) + 
  geom_histogram(binwidth=10, colour="red", fill="white")


#Histogram adding the mean
ggplot(weatherdata, aes(x=Tmean)) + 
  geom_histogram(binwidth=10, colour="black", fill="white") +
  geom_vline(aes(xintercept=mean(Tmean, na.rm=T)),color="red", linetype="dashed", size=1)

#adjust binwidth to adjust wider bins 
ggplot(weatherdata, aes(x=Tmean)) + 
  geom_histogram(binwidth=5, colour="black", fill="white") +
  geom_vline(aes(xintercept=mean(THigh, na.rm=T)),color="red", linetype="dashed", size=1)



#Box Plot 
#When comparing the distributions of groups of data, 
#boxplots are a great approach instead of bar charts

ggplot(weatherdata, aes(x=SeasonAnalysis, y=ET)) + geom_boxplot()

#Adding color to box plot
ggplot(weatherdata, aes(x=SeasonAnalysis, y=Tmean, fill=SeasonAnalysis)) + 
  geom_boxplot() +xlab("Season")+ylab("Tmean")





#set theme to black & white, increase font
#theme_set(theme_bw(16))   


#  bar graphs
# No outline
ggplot(data=weatherdata, aes(x=Tmean, fill=SeasonAnalysis)) + geom_bar()

# Add outline, but slashes appear in legend
ggplot(data=weatherdata, aes(x=Tmean, fill=SeasonAnalysis)) + geom_bar(colour="black")

# then graph the bars again with outline, but with a blank legend.
ggplot(data=weatherdata, aes(x=Tmean, fill=SeasonAnalysis)) + geom_bar() + geom_bar(colour="black", show_guide=FALSE)







