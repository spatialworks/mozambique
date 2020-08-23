## code to prepare `rocessData` dataset goes here ##############################

## Libraries
library(rgdal)
library(rgeos)
library(raster)
library(sf)

## Objects for URL downloads
ppl <- "http://export.hotosm.org/downloads/b689022e-a9e7-4ab3-b605-655e9a33699a/hotosm_moz_populated_places_gpkg.zip"
adm <- "https://data.humdata.org/dataset/5e8d83a5-1210-49be-b7d9-cf286dbc15df/resource/5ae5fdcc-42d1-4258-966a-58e8a6d7e5a1/download/moz_adm_20190607_shp.zip"

## Download - borders
temp <- tempfile()
download.file(adm, destfile = temp)
unzip(temp, exdir = tempdir())

## Get borders
adm0 <- readOGR(dsn = tempdir(), layer = "moz_admbnda_adm0_ine_20190607")
adm0$ADM0_PT <- stringi::stri_enc_mark(adm0$ADM0_PT)


country <- adm0
usethis::use_data(country, overwrite = TRUE, compress = "xz")

adm1 <- readOGR(dsn = tempdir(), layer = "moz_admbnda_adm1_ine_20190607")
provincias <- adm1
usethis::use_data(provincias, overwrite = TRUE, ccompress = "xz")

adm2 <- readOGR(dsn = tempdir(), layer = "moz_admbnda_adm2_ine_20190607")
distritos <- adm2
usethis::use_data(distritos, overwrite = TRUE, compress = "xz")

adm3 <- readOGR(dsn = tempdir(), layer = "moz_admbnda_adm3_ine_20190607")
postos <- adm3
usethis::use_data(postos, overwrite = TRUE, compress = "xz")

## Download - populated places
temp <- tempfile()
download.file(ppl, destfile = temp)
unzip(temp, exdir = tempdir())

## Get populated places
ppl <- readOGR(dsn = paste(tempdir(), "hotosm_moz_populated_places.gpkg", sep = "/"),
               layer = "Populated Places", require_geomType = "wkbPoint")
villages <- ppl
usethis::use_data(villages, overwrite = TRUE, compress = "xz")
