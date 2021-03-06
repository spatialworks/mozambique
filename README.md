
<!-- README.md is generated from README.Rmd. Please edit that file -->

# mozambique: Datasets for Designing Surveys in Mozambique <img src="https://www.cia.gov/library/publications/resources/the-world-factbook/attachments/flags/MZ-flag.jpg" align="right" width="200px" />

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![R-CMD-check](https://github.com/spatialworks/mozambique/workflows/R-CMD-check/badge.svg)](https://github.com/spatialworks/mozambique/actions?query=workflow%3AR-CMD-check)
[![CodeFactor](https://www.codefactor.io/repository/github/spatialworks/mozambique/badge)](https://www.codefactor.io/repository/github/spatialworks/mozambique)
<!-- badges: end -->

Designing surveys require relevant datasets to be used as basis for
sample size calculations, sampling design, survey planning/logistics and
survey implementation. These include datasets on population, lists of
sampling clusters, map datasets for spatial sampling, and previous
survey datasets that can be used for estimating indicator variance and
design effects. This package contains relevant datasets for use in
designing surveys in Mozambique.

## Installation

You can install the development version from
[GitHub](https://github.com/spatialworks/mozambique) with:

``` r
if(!require(remotes)) install.packages("remotes")
remotes::install_github("spatialworks/mozambique")
#>      checking for file ‘/private/var/folders/fk/s0yv8hhn2cs_nfsmzhm4dmhc0000gn/T/RtmpaOgf9q/remotes5fe51a461c3b/spatialworks-mozambique-407a61e/DESCRIPTION’ ...  ✓  checking for file ‘/private/var/folders/fk/s0yv8hhn2cs_nfsmzhm4dmhc0000gn/T/RtmpaOgf9q/remotes5fe51a461c3b/spatialworks-mozambique-407a61e/DESCRIPTION’ (395ms)
#>   ─  preparing ‘mozambique’: (894ms)
#>      checking DESCRIPTION meta-information ...  ✓  checking DESCRIPTION meta-information
#>   ─  checking for LF line-endings in source and make files and shell scripts
#>   ─  checking for empty or unneeded directories
#>   ─  building ‘mozambique_0.1.0.tar.gz’
#>      
#> 
```

## Usage

### Country borders

``` r
library(mozambique)
library(sp)

plot(country)
```

<img src="man/figures/README-adm0-1.png" width="100%" style="display: block; margin: auto;" />

### Provincias borders

``` r
plot(provincias)
```

<img src="man/figures/README-adm1-1.png" width="100%" style="display: block; margin: auto;" />

### Distritos borders

``` r
plot(distritos)
```

<img src="man/figures/README-adm2-1.png" width="100%" style="display: block; margin: auto;" />

### Postos borders

``` r
plot(postos)
```

<img src="man/figures/README-adm3-1.png" width="100%" style="display: block; margin: auto;" />

### Settlements

``` r
plot(provincias)
plot(settlements, pch = 16, cex = 0.2, col = "blue", add = TRUE)
```

<img src="man/figures/README-settlements-1.png" width="100%" style="display: block; margin: auto;" />
