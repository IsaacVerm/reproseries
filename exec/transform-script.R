#!/usr/bin/env Rscript
library(magrittr)
library(reproseries)
library(readr)
library(docopt)

'Usage:
transform-script.R <input_path> <output_path>

]' -> doc

arguments <- docopt(doc)

readr::read_csv(file = arguments$input_path) %>%
  reproseries::addCelsiusColumn() %>%
  reproseries::summariseAvgTemperatureByYear() %>%
  readr::write_csv(path = arguments$output_path)
