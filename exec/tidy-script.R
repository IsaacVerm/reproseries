#!/usr/bin/env Rscript
library(magrittr)
library(reproseries)
library(readr)

nottem %>%
  reproseries::temperatureSeriesToDf() %>%
  reproseries::tidyTemperatures() %>%
  readr::write_csv(path = "tidy-temperatures.csv")

