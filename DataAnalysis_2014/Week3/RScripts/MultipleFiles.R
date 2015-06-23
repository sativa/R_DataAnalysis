# -----------------------------------------------------------------------------
# Program: MultipleFiles.R  
# Author: Baburao Kamble
# Date: 09/15/2014
# Purpose: Multiple Data files and subsetting Dataframe in R 
# -----------------------------------------------------------------------------



setwd("E:/Teaching/R/Lectures/week3/Census/")
dir()
# Largest Cities in Nebraska by Population
#Read City ID and names
Cities<- read.csv("Cities.csv", sep=",", stringsAsFactors=TRUE)
names(Cities) <- c("CityID", "CityName")
head(Cities)
#Read Census Data by ID
Census2010 <- read.csv("Census2010.csv", sep=",", stringsAsFactors=TRUE)
names(Census2010) <- c("CityID", "Population2013", "Population2010")
head(Census2010)

CensusDataByCities <- merge(Cities, Census2010,c( "CityID"))
head(CensusDataByCities)
summary(CensusDataByCities)
#calculate % change in population from 2010 to 2013 
Change<- ((CensusDataByCities$Population2013-CensusDataByCities$Population2010)/CensusDataByCities$Population2010*100)
#add %chnage to census data frame
CensusDataByCities[, "%Change"] <- Change
#Write data as csv

write.csv(CensusDataByCities, file = "OutoutCensusDataByCities2.csv",row.names=TRUE)





#Read City ID and names
Cities<- read.csv("SubsetCities.csv", sep=",", stringsAsFactors=TRUE)
names(Cities) <- c("CityID", "CityName")

head(Cities)
CensusDataByCities <- merge(Cities, Census2010,c( "CityID"))
CensusDataByCities
