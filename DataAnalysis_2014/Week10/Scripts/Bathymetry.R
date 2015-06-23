# -----------------------------------------------------------------------------
# Program: SpatialData.R  
# Author: Baburao Kamble
# Date: 09/15/2014
# Purpose: Bathymetry Data in R 
# -----------------------------------------------------------------------------


library(ggplot2)
library(raster)


# Raster Plotting on hillshed 
setwd("R:/bkamble/V1.0/R/download/Week10/Data")
getwd()
# Sample Data 


#ASCII hillShade data 
HillShade <-  raster("raster/GHA_HS.asc")
#ASCII Elevation data 
Elevation <- raster("raster/GHA_DEM.asc")


#Plot with base graphics to show desired output
plot(HillShade,col=grey(1:100/100),legend=F)
plot(Elevation,col=rainbow(100),alpha=0.4,add=T,legend=F)


# Convert rasters TO dataframes for plotting with ggplot
HillShade_df <- rasterToPoints(HillShade); HillShade_df <- data.frame(HillShade_df)
colnames(HillShade_df) <- c("X","Y","Hill")
ddf <- rasterToPoints(Elevation); ddf <- data.frame(ddf)
colnames(ddf) <- c("X","Y","Elevation")


#Create vectors for colour breaks
b.HillShade <- seq(min(HillShade_df$Hill),max(HillShade_df$Hill),length.out=100)
b.Elevation <- seq(min(ddf$Elevation),max(ddf$Elevation),length.out=100)

# Use ggplot2 for better quality overlay 
ggplot(NULL, aes(X, Y)) + 
  geom_raster(data = ddf, aes(fill = Elevation)) + 
  geom_raster(data = HillShade_df, aes(alpha = Hill)) +
  scale_fill_gradientn(name="Altitude",colours = rainbow(20))+
  guides(fill = guide_colorbar()) +
  scale_alpha(range = c(0, 0.5), guide = "none") +
  scale_x_continuous(name=expression(paste("Longitude (",degree,")")), limits=c(-4,2),expand=c(0,0)) +
  scale_y_continuous(name=expression(paste("Latitude (",degree,")")), limits=c(4,12),expand=c(0,0)) +
  coord_equal()

