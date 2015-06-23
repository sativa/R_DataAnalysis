# -----------------------------------------------------------------------------
# Program: GoogleMapsPlot.R  
# Author: Baburao Kamble
# Date: 11/17/2014
# Purpose: Plotting csv on Google Maps
# -----------------------------------------------------------------------------

library(RgoogleMaps)


# read csv data 
setwd("R:/bkamble/V1.0/R/download/Week10/Data")
data <- read.csv("Stations.csv", header = TRUE, sep = ",")

# read corner latitude longitude 

lat = c(min(data$Lat),max(data$Lat));
lon = c(min(data$Lon),max(data$Lon));

# get google map box 
MyMap <- GetMap.bbox(latR =lat ,lonR = lon, maptype='satellite');

MyMap <- GetMap.bbox(latR =lat ,lonR = lon, maptype='roadmap');
# plot map
pic = PlotOnStaticMap(MyMap)

#plot the stations 
cord = LatLon2XY.centered(MyMap,data$Lat,data$Lon)
points(cord$newX,cord$newY,pch=22, col='grey', bg="red",lwd=2)

points(cord$newX,cord$newY,pch=20, col="steelblue", bg="red",lwd=2)

TextOnStaticMap(MyMap,lat=data$Lat,lon=data$Lon,labels=data$Location, offset=1,add=TRUE,cex=0.5, col = 'black')
#Too Close

TextOnStaticMap(MyMap,lat=data$Lat+0.5,lon=data$Lon+0.5,labels=data$Location, offset=1,add=TRUE,cex=0.5, col = 'black')

