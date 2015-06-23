ELEV48.SHP
Elevation Data for the Conterminous United States

ESRI Schools and Libraries Program
Redlands, CA 
k12-lib@esri.com
www.esri.com/k-12
(c) 2000
------------------------------------

Overview: 

The elevation data herein has been derived from the North America data on 
the ESRI ArcView Spatial Analyst Extension CD. This file was constructed from a grid
on the CD. The source grid had a 1 km cell size, with elevation information
for each cell. The data were reclassified into the following classes and
"gridcode" assignments:

Source:

See discussion below.

Projection:

The source data is stored in Lambert Equal Area Azimuthal projection. The
shapefile data are stored in geographic coordinates (decimal degree format).

Field Name/Description:

Meters     Gridcode
-80 - 0         0
0 - 50          1
50 - 100        2
100 - 200       3
200 - 400       4
400 - 800       5
800 - 1200      6
1200 - 2000     7
2000 - 4400     8


To Map the Data with ArcView:

The accompanying file "elev48.avl" is a preset legend ready to be used
with ArcView GIS version 3.0. To use this legend, 

1. Add elev48.shp to an ArcView view.
2. Open the legend editor.
3. Click the "load" button in the legend editor.
4. In the next window, select elev48.avl and click OK.
5. In the next window, select "gridcode" and click OK.
6. In the legend editor, click "apply" and close the window.

The "gridcode" assignments shown above should also be sufficient
for building a legend for use with ArcExplorer.

Detailed Source Information:

The Spatial Analyst CD includes this information describing the source data:

=====
The elevation data and its derivatives included on this CD are a result of the global 
30arc-second elevation data project being carried out by the staff of the USGS' 
EROS Data Center (EDC) in Sioux Falls, South Dakota and the colocated United 
Nations Environment Program / Global Resource Information Database office.  
EDC is home to the Earth Resources Observation Systems (EROS) Data Center 
Distributed Active Archive Center (EDC DAAC), established as part of NASA's 
Earth Observing System Data and Information System (EOSDIS) initiative to 
promote the interdisciplinary study and understanding of the integrated Earth 
system. The broad goal of this project is the completion of global 1 km elevation 
data for the land surface and the systematic extraction of derivative information to 
assemble a global data base of topographic elevation, slope, aspect, hydrologic 
flow paths, and watersheds.  The primary collaborators and data contributors to 
date are the USGS, NASA, UNEP/GRID,USAID, DMA, the Instituto Nacional de 
Estadistica Geografica e Informatica (INEGI) of Mexico, the Geographical Survey 
Institute of Japan, Manaaki Whenua Landcare Research, New Zealand, and the 
Scientific Commitee on Antarctic Research.

Source Data:
These elevation data were developed using multiple data sources.  The two primary 
data sources were generalizations of 3 arc-second resolution raster data (DMA 
Digital Terrain Elevation Data)and grids made from the DMA Digital Chart of the 
World (DCW)1:1,000,000 vector product.  The generalized 3 arc-second data was 
used where ever the data were available, with the gridded DCW product used to fill 
in "holes" in the 3 arc-second coverage.  For more information on the techniques 
used to develop these data sets, visit the EROS Data Center's Global Topographic 
Data Set home page at http://edcwww.cr.usgs.gov/landdaac/30asdcwdem/
30asdcwdem.html
=====

ESRI Schools & Libraries
e: k12-lib@esri.com
http://www.esri.com/k-12
