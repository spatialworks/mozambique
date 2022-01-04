################################################################################
#
#'
#' Download Mozambique shapefiles
#'
#' @param .unzip Logical. Should zip file be unzipped and extracted? Default to
#'   TRUE
#'
#' @return If `.unzip`, list of shapefiles within the downloaded zip file else
#'   path to downloaded zip file. Mozambique subnational administrative
#'   boundaries zip file downloaded to specified folder.
#'
#' @examples
#' download_shapefiles()
#'
#' @export
#'
#
################################################################################

download_shapefiles <- function(.unzip = TRUE) {
  folder <- tempdir()
  filename <- tempfile() %>%
    stringr::str_remove(pattern = paste0(folder, "\\/"))

  path <- rhdx::pull_dataset(
    identifier = "mozambique-administrative-levels-0-3"
  ) %>%
    rhdx::get_resource(index = 2) %>%
    rhdx::download_resource(folder = folder, filename = filename)

  ## Unzip file?
  if (.unzip) {
    shp_files <- utils::unzip(zipfile = path, list = TRUE, exdir = folder)
    utils::unzip(zipfile = path, exdir = folder)
  } else {
    shp_files <- path
  }

  ## Return
  shp_files
}


################################################################################
#
#'
#' Get layer name
#'
#' @param files List of shapefiles within a downloaded zip file
#' @param adm Integer. Administrative level required. Either `0` for country,
#'   `1` for provincias, `2` for distritos, or `3` for postos
#'
#' @return Layer name for specified administrative level boundary
#'
#' @examples
#' get_layer_name(adm = 0)
#'
#' @export
#'
#
################################################################################

get_layer_name <- function(files = download_shapefiles(), adm = NULL) {
  ## Get layer name
  x <- files[["Name"]] %>%
    stringr::str_detect(pattern = paste0("adm", adm))

  layer_names <- files[["Name"]][x] %>%
    stringr::str_split(pattern = "\\.", simplify = TRUE)

  layer_name <- layer_names[[1]]

  ## Return
  layer_name
}


################################################################################
#
#'
#' Retrieve Mozambique country boundaries
#'
#' @param layer Name of layer for country boundaries
#'
#' @return An sf object for the country borders of Mozambique
#'
#' @examples
#' get_country()
#'
#' @export
#'
#
################################################################################

get_country <- function(layer = get_layer_name(adm = 0)) {
  ## Read country shapefile
  country <- sf::st_read(dsn = tempdir(), layer = layer)

  ## Return
  country
}


################################################################################
#
#'
#' Retrieve Mozambique provinces boundaries
#'
#' @param layer Name of layer for provinces boundaries
#'
#' @return An sf object for the provinces borders of Mozambique
#'
#' @examples
#' get_provinces()
#'
#' @export
#'
#
################################################################################

get_provinces <- function(layer = get_layer_name(adm = 1)) {
  ## Read provinces shapefile
  provinces <- sf::st_read(dsn = tempdir(), layer = layer)

  ## Return
  provinces
}


################################################################################
#
#'
#' Retrieve Mozambique districts boundaries
#'
#' @param layer Name of layer for districts boundaries
#'
#' @return An sf object for the districts borders of Mozambique
#'
#' @examples
#' get_districts()
#'
#' @export
#'
#
################################################################################

get_districts <- function(layer = get_layer_name(adm = 2)) {
  ## Read districts shapefile
  districts <- sf::st_read(dsn = tempdir(), layer = layer)

  ## Return
  districts
}


################################################################################
#
#'
#' Retrieve Mozambique posts boundaries
#'
#' @param layer Name of layer for posts boundaries
#'
#' @return An sf object for the posts borders of Mozambique
#'
#' @examples
#' get_posts()
#'
#' @export
#'
#
################################################################################

get_posts <- function(layer = get_layer_name(adm = 3)) {
  ## Read posts shapefile
  posts <- sf::st_read(dsn = tempdir(), layer = layer)

  ## Return
  posts
}
