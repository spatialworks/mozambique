## code to prepare `processData` dataset goes here #############################

## Libraries
library(rgdal)
library(rgeos)
library(raster)
library(sf)
library(magrittr)
library(stringr)
library(tripack)
library(geosphere)

## Objects for URL downloads
ppl <- "https://export.hotosm.org/downloads/02be3f24-6cc6-41c9-af6f-d62de57bee26/hotosm_moz_populated_places_gpkg.zip"
settle <- "https://data.humdata.org/dataset/41fad0bd-9724-4d78-9ef9-d5404811401d/resource/a41486aa-bf63-4a7c-86f1-91c1c8ae45bc/download/moz_settlements.zip"
adm <- "https://data.humdata.org/dataset/5e8d83a5-1210-49be-b7d9-cf286dbc15df/resource/5ae5fdcc-42d1-4258-966a-58e8a6d7e5a1/download/moz_adm_20190607b_shp.zip"

## Download - borders
temp <- tempfile()
download.file(adm, destfile = temp)
unzip(temp, exdir = tempdir())

## Get borders
#country <- readOGR(dsn = tempdir(), layer = "moz_admbnda_adm0_ine_20190607")
country <- st_read(dsn = tempdir(), layer = "moz_admbnda_adm0_ine_20190607")
country$ADM0_PT <- "Mocambique"
#usethis::use_data(country, overwrite = TRUE, compress = "xz")

#provincias <- readOGR(dsn = tempdir(), layer = "moz_admbnda_adm1_ine_20190607")
provincias <- st_read(dsn = tempdir(), layer = "moz_admbnda_adm1_ine_20190607")
provincias$ADM0_PT <- "Mocambique"
#usethis::use_data(provincias, overwrite = TRUE, compress = "xz")

#distritos <- readOGR(dsn = tempdir(), layer = "moz_admbnda_adm2_ine_20190607")
distritos <- st_read(dsn = tempdir(), layer = "moz_admbnda_adm2_ine_20190607")
distritos$ADM0_PT <- "Mocambique"
distritos$ADM2_PT <- distritos$ADM2_PT %>%
  stringr::str_replace_all(pattern = "ç", replacement = "c") %>%
  stringr::str_replace_all(pattern = "ú", replacement = "u")
#usethis::use_data(distritos, overwrite = TRUE, compress = "xz")

#postos <- readOGR(dsn = tempdir(), layer = "moz_admbnda_adm3_ine_20190607")
postos <- st_read(dsn = tempdir(), layer = "moz_admbnda_adm3_ine_20190607")
postos$ADM0_PT <- "Mocambique"
postos$ADM1_PT <- postos$ADM1_PT %>%
  stringr::str_replace_all(pattern = "ç", replacement = "c") %>%
  stringr::str_replace_all(pattern = "ú", replacement = "u")
postos$ADM2_PT <- postos$ADM2_PT %>%
  stringr::str_replace_all(pattern = "ç", replacement = "c") %>%
  stringr::str_replace_all(pattern = "ú", replacement = "u")
postos$ADM3_PT <- postos$ADM3_PT %>%
  stringr::str_replace_all(pattern = "ç", replacement = "c") %>%
  stringr::str_replace_all(pattern = "ú", replacement = "u")
#usethis::use_data(postos, overwrite = TRUE, compress = "xz")

## Download - settlements
temp <- tempfile()
download.file(settle, destfile = temp)
unzip(temp, exdir = tempdir())

## Get settlements
#settlements <- readOGR(dsn = tempdir(), layer = "MOZ_Settlements")
settlements <- st_read(dsn = tempdir(), layer = "MOZ_Settlements")
settlements$Sett_Name <- settlements$Sett_Name %>%
  stringr::str_replace_all(pattern = "¾vÒ", replacement = "i")
settlements$ADM2_Name <- settlements$ADM2_Name %>%
  stringr::str_replace_all(pattern = "ç", replacement = "c")
usethis::use_data(settlements, overwrite = TRUE, compress = "xz")

## Download - populated places
temp <- tempfile()
download.file(ppl, destfile = temp)
unzip(temp, exdir = tempdir())

## Get populated places
#ppl <- readOGR(dsn = paste(tempdir(), "hotosm_moz_populated_places.gpkg", sep = "/"),
#               layer = "Populated Places", require_geomType = "wkbPoint")
ppl <- st_read(dsn = paste(tempdir(), "hotosm_moz_populated_places.gpkg", sep = "/"),
               layer = "Populated Places")

ppl$name <- ppl$name %>%
  stringr::str_replace_all(pattern = "¾vÒ", replacement = "i") %>%
  stringr::str_replace_all(pattern = "ç", replacement = "c") %>%
  stringr::str_replace_all(pattern = "ú", replacement = "u")

ppl$is_in <- ppl$is_in %>%
  stringr::str_replace_all(pattern = "ç", replacement = "c")

usethis::use_data(ppl, overwrite = TRUE, compress = "xz")


towns <- subset(ppl, place %in% c("town", "city"))
cities <- subset(ppl, place == "city")

townTri <- rgeos::gDelaunayTriangulation(spgeom = towns, onlyEdges = FALSE)
#townTri <- raster::intersect(townTri, country)
cityTri <- rgeos::gDelaunayTriangulation(spgeom = cities, onlyEdges = FALSE)


##
triTowns <- tripack::tri.mesh(x = towns@coords[ , 1], y = towns@coords[ , 2])
nb <- tripack::neighbours(triTowns)

##
distTowns <- geosphere::distm(towns)

listDist <- NULL

for(i in seq_len(length(nb))) {
  xx <- NULL
  for(j in nb[[i]]) {
    yy <- c(xx, distTowns[i, j])
  }
  listDist <- c(listDist, yy)
}

listDist <- listDist / 1000

mDist <- median(listDist)

plot(provincias)
plot(townTri, border = "blue", add = TRUE)
plot(towns, pch = 16, cex = 0.5, col = "red", add = TRUE)

plot(provincias)
plot(cityTri, border = "blue", add = TRUE)
plot(cities, pch = 16, cex = 0.5, col = "red", add = TRUE)


##

