## Tests for download_shapefiles()

download_shapefiles(.unzip = FALSE)

test_that("download_shapefile works", {
  expect_equal(
    list.files(tempdir(), pattern = "moz_adm_20190607b_shp.zip"),
    "moz_adm_20190607b_shp.zip"
  )
})

download_shapefiles()

test_that("unzip works", {
  expect_equal(
    list.files(tempdir(), pattern = "moz_admbnda_adm0_ine_20190607.shp")[1],
    "moz_admbnda_adm0_ine_20190607.shp"
  )
})


## Tests for get_layer_name()

layer_name <- get_layer_name(adm = 0)

test_that("correct layer name is extracted", {
  expect_equal(layer_name, "moz_admbnda_adm0_ine_20190607")
})


layer_name <- get_layer_name(adm = 1)

test_that("correct layer name is extracted", {
  expect_equal(layer_name, "moz_admbnda_adm1_ine_20190607")
})


layer_name <- get_layer_name(adm = 2)

test_that("correct layer name is extracted", {
  expect_equal(layer_name, "moz_admbnda_adm2_ine_20190607")
})

layer_name <- get_layer_name(adm = 3)

test_that("correct layer name is extracted", {
  expect_equal(layer_name, "moz_admbnda_adm3_ine_20190607")
})


## Test sf objects
country <- get_country()

test_that("country is an sf object", {
  expect_s3_class(country, "sf")
})

province <- get_provinces()

test_that("province is an sf object", {
  expect_s3_class(province, "sf")
})

district <- get_districts()

test_that("district is an sf object", {
  expect_s3_class(district, "sf")
})

post <- get_posts()

test_that("posts is an sf object", {
  expect_s3_class(post, "sf")
})

