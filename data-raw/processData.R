## code to prepare `rocessData` dataset goes here ##############################

## Libraries
library(rgdal)
library(rgeos)
library(raster)
library(sf)

## Objects for URL downloads
ppl <- "http://export.hotosm.org/downloads/b689022e-a9e7-4ab3-b605-655e9a33699a/hotosm_moz_populated_places_gpkg.zip"
adm <- "https://data.humdata.org/dataset/5e8d83a5-1210-49be-b7d9-cf286dbc15df/resource/5ae5fdcc-42d1-4258-966a-58e8a6d7e5a1/download/moz_adm_20190607_shp.zip"

## Downloads
temp <- tempfile()
download.file(adm, destfile = temp)
unzip(temp, exdir = tempdir())

dsn <- paste(tempdir(), )
adm0 <- readOGR(dsn = )
