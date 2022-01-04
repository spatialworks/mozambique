################################################################################
#
#'
#' Mozambique settlements locations
#'
#' @format A `sf` object containing settlements locations of Mozambique
#'
#' | **Variables** | **Description** |
#' | *OBJECTID* | Object identifier |
#' | *FID_1* | Feature identifier |
#' | *Sett_Name* | Settlement name |
#' | *F_CLASS* | Feature class |
#' | *F_DESIG* | Feature designation |
#' | *ADM1_Old* | Administrative level 1 name - old |
#' | *ADM2_Old* | Administrative level 2 name - old |
#' | *Country* | Country name |
#' | *ISO3* | Tree letter code for country |
#' | *ADM1_Name* | Administrative level 1 name - current |
#' | *ADM1_Code* | Administrative level 1 code - current |
#' | *ADM1_ID* | Administrative level 1 identifier - current |
#' | *ADM2_Name* | Administrative level 2 name - current |
#' | *ADM2_Code* | Administrative level 2 code - current |
#' | *ADM2_ID* | Administrative level 2 identifier - current |
#' | *ADM3_Name* | Administrative level 3 name - current |
#' | *ADM3_Code* | Administrative level 3 code - current |
#' | *ADM3_ID* | Administrative level 3 identifier - current |
#' | *ADM3_Type* | Administrative level 3 type - current |
#' | *ADM3_TypeE* | Administrative level 3 type in English - current |
#' | *Latitude* | Latitude coordinate |
#' | *Longitude* | Longitude coordinate |
#' | *SHAPE_Leng* | Shape length |
#'
#' @examples
#' settlements
#'
#' @source https://data.humdata.org/dataset/mozambique-settlement-shapefiles
#'
#
################################################################################
"settlements"



################################################################################
#
#'
#' Mozambique populated places locations
#'
#' @format A `sf` object containing populated places locations of Mozambique
#'
#' | **Variables** | **Description** |
#' | *osm_id* | OpenStreetMap identifier |
#' | *name* | Name of populated place |
#' | *source* | Source of data for populated place |
#' | *population* | Population size |
#' | *is_in* | Populated place is in? |
#' | *place* | Type of place |
#'
#' @examples
#' ppl
#'
#' @source https://data.humdata.org/dataset/hotosm_moz_populated_places
#'
#
################################################################################
"ppl"
