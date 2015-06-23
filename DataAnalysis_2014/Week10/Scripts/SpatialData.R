# -----------------------------------------------------------------------------
# Program: SpatialData.R  
# Author: Baburao Kamble
# Date: 09/15/2014
# Purpose: Read, manipulation and  Write Spatial Data in R 
# -----------------------------------------------------------------------------



# reading shapefile 

setwd("R:/bkamble/V1.0/R/download/Week10/Data")
dir()


#install rgdal package (bindings for the Geospatial Data Abstraction Library)
install.packages("rgdal", dependencies=TRUE) 

library(rgdal)
#read shapefile for conus USA
USA.conus<-readOGR("shapefile/conus","US_Conus")
#projection information 
proj4string(USA.conus)
#read other shapefile for conus USA

# Read different data layers 
USA.cities<-readOGR("shapefile/cities","cities")
USA.Rivers<-readOGR("shapefile/rivers","rivers")
USA.hydroln<-readOGR("shapefile/hydroln","hydroln")
USA.huc250k<-readOGR("shapefile/huc250k","huc250k")

# report shapefile details
ogrInfo("shapefile/cities","cities")
#projection info
proj4string(USA.huc250k)

# tranform projection 
USA.cities<-spTransform(USA.cities, CRS=CRS("+proj=longlat +ellps=GRS80"))

#overlay data for plot 
plot(USA.conus, axes=TRUE, border="gray")
points(USA.cities, pch=20, col="red", cex=0.5)
lines(USA.Rivers, col="blue", lwd=1.0)

plot(USA.huc250k2,  lwd=0.5)
points(USA.cities, pch=20, col="red", cex=0.5)
lines(USA.Rivers, col="blue", lwd=2.0)

#write shaepfile 

writeOGR(USA.cities, "raster", "USA_cities", driver="ESRI Shapefile")



## add new attribute data (just the numbers 1 to the number of objects)
USA.cities$new.att <- 1:nrow(USA.cities)

## write out to a new shapefile
writeOGR(USA.cities, "Output", "NewFile",  driver="ESRI Shapefile")  



#Raster data

install.packages("raster", dependencies=TRUE) 
library(raster)

setwd("E:/Teaching/R/Lectures/week3/raster/")

MyDEM= raster("raster/DEM.tif")



plot(MyDEM, col=(terrain.colors(1000)))

plot(MyDEM, col=(topo.colors(1000)))
#topo.colors
plot(MyDEM)

#Psychometric constant from DEM 
psy <- (0.0673645 * ((293 - 0.0065 * MyDEM)/293)^5.26)

plot(psy, col=(topo.colors(1000)))

outputraster <- writeRaster(psy, filename="psychrometric.tif", overwrite=TRUE)






