## code to prepare `rocessData` dataset goes here ##############################

## Libraries
library(rgdal)
library(rgeos)
library(raster)
library(sf)

## Objects for URL downloads
ppl <- "http://export.hotosm.org/downloads/b689022e-a9e7-4ab3-b605-655e9a33699a/hotosm_moz_populated_places_gpkg.zip"
settlements <- "https://data.humdata.org/dataset/41fad0bd-9724-4d78-9ef9-d5404811401d/resource/a41486aa-bf63-4a7c-86f1-91c1c8ae45bc/download/moz_settlements.zip"
adm <- "https://data.humdata.org/dataset/5e8d83a5-1210-49be-b7d9-cf286dbc15df/resource/5ae5fdcc-42d1-4258-966a-58e8a6d7e5a1/download/moz_adm_20190607_shp.zip"

## Download - borders
temp <- tempfile()
download.file(adm, destfile = temp)
unzip(temp, exdir = tempdir())

## Get borders
country <- readOGR(dsn = tempdir(), layer = "moz_admbnda_adm0_ine_20190607")
usethis::use_data(country, overwrite = TRUE, compress = "xz")

provincias <- readOGR(dsn = tempdir(), layer = "moz_admbnda_adm1_ine_20190607")
usethis::use_data(provincias, overwrite = TRUE, compress = "xz")

distritos <- readOGR(dsn = tempdir(), layer = "moz_admbnda_adm2_ine_20190607")
usethis::use_data(distritos, overwrite = TRUE, compress = "xz")

postos <- readOGR(dsn = tempdir(), layer = "moz_admbnda_adm3_ine_20190607")
usethis::use_data(postos, overwrite = TRUE, compress = "xz")

## Download - settlements
temp <- tempfile()
download.file(settlements, destfile = temp)
unzip(temp, exdir = tempdir())

## Get settlements
settlements <- readOGR(dsn = tempdir(), layer = "MOZ_Settlements")
usethis::use_data(settlements, overwrite = TRUE, compress = "xz")

## Download - populated places
temp <- tempfile()
download.file(ppl, destfile = temp)
unzip(temp, exdir = tempdir())

## Get populated places
villages <- readOGR(dsn = paste(tempdir(), "hotosm_moz_populated_places.gpkg", sep = "/"),
                    layer = "Populated Places", require_geomType = "wkbPoint")
usethis::use_data(villages, overwrite = TRUE, compress = "xz")
