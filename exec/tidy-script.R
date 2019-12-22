#!/usr/bin/env Rscript
library(magrittr)
library(reproseries)
library(readr)
library(docopt)

'Usage:
tidy-script.R <output_path>

]' -> doc

arguments <- docopt(doc)

nottem %>%
  reproseries::temperatureSeriesToDf() %>%
  reproseries::tidyTemperatures() %>%
  readr::write_csv(path = arguments$output_path)

