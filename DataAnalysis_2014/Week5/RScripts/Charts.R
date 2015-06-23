# -----------------------------------------------------------------------------
# Program: Charts.R  
# Author: Baburao Kamble
# Date: 09/29/2014
# Purpose: CHART/PLOTS in R(Week4)
#         Producing simple graphs (Line Charts,Bar Chart, Histograms,Pie Charts) with the R  
# -----------------------------------------------------------------------------



# Set working directory 
setwd("R:/bkamble/V1.0/R/download/Week5")
# Read data from your file 
Mydata <- read.table("AgronomyData.csv", header=T, sep=",")
# Check summary 
summary(Mydata)
#Check variable names using head
head(Mydata)
#Chart of Trial1 vector with all default options
plot(Mydata$Trial1)


#Adding Scatter plot of two variable 

)


# Graph of Trial1 using blue points overlayed by a line 
plot(Mydata$Trial1, type="o", col="blue")


#Graph with Options

plot(Mydata$Trial1, 
     xlab="Var-Id", ylab="Trial1", main = "Chart Title",
  col = "red", pch = 1, cex = 1.0, panel.first=grid(col = "gray", lty = "dotted"))


# Graph cars using a y axis that ranges from 0 to 12
plot(Mydata$Trial2, type="o", col="blue", ylim=c(0,16))

# Graph trucks with red dashed line and square points
lines(Mydata$Trial3, type="o", pch=22, lty=2, col="Green")

# Create a title with a red, bold/italic font
title(main="Chart Title", col.main="red", font.main=4)


plot(Mydata$Trial1, type="o", col="blue",  ylim=c(0,16), 
     axes=FALSE, ann=FALSE)
lines(Mydata$Trial2, type="o", pch=22, lty=2, col="red")
lines(Mydata$Trial3, type="o", pch=22, lty=2, col="green")

grid(NA, 7, lty=0, lwd = 1) # grid only in y-direction


# create X axis lables
ReadingDays<-c("Mon","Tue","Wed","Thu","Fri","Sat","Sun")
axis(1, at=1:7, lab=ReadingDays,cex=1)

# Calculate range from 0 to max value of Trial1 and Trial2 to apply to Y axix 
data_range <- range(0, Mydata$Trial1, Mydata$Trial2,Mydata$Trial3)
# Apply range to Y axis
axis(2, las=1, at=2*0:data_range[2], cex=1)

# create box around plot 
box()
#exactly on axis 
grid (NULL,NULL, lty = 6, col = "cornsilk2") 
# Legands
legend(1,16, c("Trial1","Trial2", 'Trial3'), cex=1, 
       col=c("blue","red","green"), pch=21:22, lty=1:2)

# Automated max range 
legend(1,data_range[2], c("Trial1","Trial2", 'Trial3'), cex=0.8, 
       col=c("blue","red","green"), pch=21:22, lty=1:2)





#More Automatic color control  
# Define color palatte
plot_colors <- c("blue","red","green")

plot(Mydata$Trial1, type="o", col=plot_colors[1],  ylim=c(0,16), 
     axes=FALSE, ann=FALSE)
lines(Mydata$Trial2, type="o", pch=22, lty=2, col=plot_colors[2])
lines(Mydata$Trial3, type="o", pch=22, lty=2, col=plot_colors[3])

# create X axis lables
axis(1, at=1:7, lab=c("Mon","Tue","Wed","Thu","Fri","Sat","Sun"))

# Calculate range from 0 to max value of Trial1 and Trial2 to apply to Y axix 
data_range <- range(0, Mydata$Trial1, Mydata$Trial2,Mydata$Trial3)
# Apply range to Y axis
axis(2, las=1, at=4*0:data_range[2])

# create box around plot 
box()


# Automatic Legands with no border 
legend("topleft", names(Mydata), cex=0.8, col=plot_colors, 
       lty=1:3, lwd=2, bty="n");





# Bar Charts 

barplot(Mydata$Trial2)



#Graph cars with specified labels for axes.  Use blue  borders and diagnal lines in bars.
barplot(Mydata$Trial2, main="Agronomy Experiment", xlab="Days",  
        ylab="Qty(mm/day)", names.arg=ReadingDays, border="blue")

#Change pattern inside the bars
barplot(Mydata$Trial2, main="Agronomy Experiment", xlab="Days",  
        ylab="Qty(mm/day)", names.arg=ReadingDays, density=c(10,20,30,40,50,60,70), border="blue")







#Now let's graph the total number of Qty per day using some color and show a legend:

barplot(as.matrix(Mydata), main="Agronomy Experiment", ylab= "Total",
       beside=TRUE, col=rainbow(7))

# Place the legend at the top-left corner with no frame  
# using rainbow colors
legend("topleft", ReadingDays, cex=0.6, bty="n", fill=rainbow(7));
box()







#Histograms

# Histogram of particular variable 
hist(Mydata$Trial2)
# Histogram of all data 
#Concatenate all vectors
AgData<- c(Mydata$Trial1, Mydata$Trial2, Mydata$Trial3)
#Histograms
hist(AgData, col="lightblue", ylim=c(0,8))

#Create color breaks 
colorbreak <- c(0,3,4,5,6,10,16)
#Histograms
hist(AgData, col=colorbreak, ylim=c(0,8))



# pie Chart

pie(Mydata$Trial2)


pie(Mydata$Trial2, main="Title", col=rainbow(length(Mydata$Trial2)),labels=ReadingDays)



# dot chart
dotchart(t(Mydata),color=c("red","blue","darkgreen"))







# Output as png/jpeg/pdf 

library(Cairo)
Cairo(600, 600, file="plot.png", type="png", bg="white")

# Plot something meaningful

AgData<- c(Mydata$Trial1, Mydata$Trial2, Mydata$Trial3)
#Histograms
hist(AgData, col="lightblue", ylim=c(0,8))


dev.off() # creates a file "plot.png" with the above plot


