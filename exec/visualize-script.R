#!/usr/bin/env Rscript
library(magrittr)
library(reproseries)
library(readr)
library(ggplot2)
library(docopt)

'Usage:
transform-script.R <input_path> <output_folder>

]' -> doc

arguments <- docopt(doc)

readr::read_csv(file = arguments$input_path) %>%
  reproseries::plotAvgTemperaturesByYear()

ggplot2::ggsave(filename = paste0(arguments$output_folder, "average-temperatures-by-year.png"))
