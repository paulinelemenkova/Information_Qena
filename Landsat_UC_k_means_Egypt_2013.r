library(rgdal)
library(raster)
library(terra)
library(RColorBrewer)
library(pals)
library(colorspace)
library(RStoolbox)
library(graphics)
library(Hmisc)
#
# Set up working directory
setwd("/Users/polinalemenkova/Documents/R/52_Image_Processing/K-means")
# Importing data
Landsat_2013 <- list.files("/Users/polinalemenkova/Documents/R/52_Image_Processing/K-means")
# Printing the list
list.files()
#
# creating SpatRaster object
landsat <- rast(Landsat_2013)
# check properties
landsat
#landsatRGB <- landsat[[c(4,3,2)]]
landsatRGB <- landsat[[c(5,4,3)]]
#landsatRGB <- landsat[[c(2,5,7)]]
plotRGB(landsatRGB, r=1, g=2, b=3, axes=FALSE, stretch="lin")
#
# Running the classification
set.seed(99)
unC <- unsuperClass(landsatRGB, nSamples = 100, nClasses = 10, nStarts = 5)
unC
#
# Creating color palette
colors <- jet(10)
# plotting a map
plot(unC$map, main = "K-means Clustering for Landsat-8 OLI/TIRS C1 image: \n Qena Bend, Nile River, Upper Egypt (2013)", font.main=1, cex.main = 0.85, col = colors, axes = FALSE, box = FALSE, legend = FALSE)
legend("bottomright", inset = c(0.15, 0.0), legend=c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10"), fill = jet(10), title = "Classes", horiz = FALSE, bty = "n", text.font=1, ncol=1, y.intersp = 0.7, box.col="black")
