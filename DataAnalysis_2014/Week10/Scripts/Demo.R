# -----------------------------------------------------------------------------
# Program: Spatial Demo.R  
# Author: Baburao Kamble
# Date: 11/17/2014
# Purpose:Geospatial Analysis and Visulization 
# -----------------------------------------------------------------------------


library(ggplot2)

crimes <- data.frame(state = tolower(rownames(USArrests)), USArrests)

library(reshape2) # for melt
crimesm <- melt(crimes, id = 1)
if (require(maps)) {
  states_map <- map_data("state")
  ggplot(crimes, aes(map_id = state)) + geom_map(aes(fill = Murder), map = states_map) + expand_limits(x = states_map$long, y = states_map$lat)
  last_plot() + coord_map()
  ggplot(crimesm, aes(map_id = state)) + geom_map(aes(fill = value), map = states_map) + expand_limits(x = states_map$long, y = states_map$lat) + facet_wrap( ~ variable)
}





# Simple Earth Visulization 

world <- map_data("world")
worldmap <- ggplot(world, aes(x=long, y=lat, group=group)) +
  geom_path() +
  scale_y_continuous(breaks=(-2:2) * 30) +
  scale_x_continuous(breaks=(-4:4) * 45)

# Orthographic projection with default orientation (looking down at North pole)
worldmap + coord_map("ortho")
# Looking up up at South Pole
worldmap + coord_map("ortho", orientation=c(-90, 0, 0))
# Centered on New York (currently has issues with closing polygons)
worldmap + coord_map("ortho", orientation=c(41, -74, 0))
}
