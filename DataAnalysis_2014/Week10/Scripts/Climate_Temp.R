# -----------------------------------------------------------------------------
# Program: Climate_Temp.R  
# Author: Baburao Kamble
# Date: 09/15/2014
# Purpose:Analysing Spatial Data 
# -----------------------------------------------------------------------------


library(rgdal)
library(raster)
library(rasterVis)


# read csv data 
setwd("R:/bkamble/V1.0/R/download/Week10/Data")
data <- read.csv("Stations.csv", header = TRUE, sep = ",")

locs <- subset(data, select=c("Location", "Lat", "Lon"))
coordinates(locs) <- c("Lon", "Lat")    # set spatial coordinates
#Simple Plot location 
plot(locs, pch=20, cex=2, col="steelblue")



# online geospatial data from http://biogeo.ucdavis.edu

tmin <- getData("worldclim", var="tmin", res=10) 

plot(tmin)


# read your own raster 
tmin1 <- raster("raster/Conus_raster2.tif")   # Tmin for January
fromDisk(tmin1)  # values are stored on disk instead of memory! (useful forlarge rasters)

plot(tmin1)

newext <- drawExtent()

tmin1.NV <- crop(tmin1, newext)
plot(tmin1.NV)


#Spatial Autocorrelation (Global Moran's I) (Spatial Statistics)
Moran(tmin1.NV)

tmin1.Moran <- MoranLocal(tmin1.NV)
plot(tmin1.Moran)


# Different stat and plot 
histogram(tmin1.NV)
persp(tmin1.NV)
contour(tmin1.NV)
contourplot(tmin1.NV)
levelplot(tmin1.NV)
plot3D(tmin1.NV)
densityplot(tmin1.NV)

