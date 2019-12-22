#!/usr/bin/env Rscript
library(magrittr)
library(reproseries)
library(readr)
library(docopt)

'Usage:
tidy-script.R [-p <path>]

Options:
-p Path to write to

]' -> doc

opts <- docopt(doc)

nottem %>%
  reproseries::temperatureSeriesToDf() %>%
  reproseries::tidyTemperatures() %>%
  readr::write_csv(path = opts$p)

