# -----------------------------------------------------------------------------
# Program: Raster_Clip.R  
# Author: Baburao Kamble
# Date: 11/17/2014
# Purpose:Clipping raster using vector data 
# -----------------------------------------------------------------------------

library(raster)
# use state bounds from gadm website:
# us = shapefile("USA_adm1.shp")
us <- getData("GADM", country="USA", level=1)
# extract states (need to uppercase everything)
HighPlainstates <- c("Nebraska", "Iowa", "Kansas", "South Dakota",
                "North Dakota", "Colorado", "Wyoming")

HighPlain = us[match(toupper(HighPlainstates),toupper(us$NAME_1)),]


# create a random raster over the given space:        
rast = raster(xmn=-114,xmx=-88,ymn=36,ymx=50,nrow=100,ncol=100)
rast[]=runif(100*100)


# plot it with the boundaries we want to clip against:
plot(rast)
plot(HighPlain,add=TRUE)

# now use the mask function
rr <- mask(rast,HighPlain)

# plot, and overlay:
plot(rr);
plot(HighPlain,add=TRUE)





