#!/usr/bin/env Rscript
library(magrittr)
library(reproseries)
library(readr)
library(ggplot2)
library(docopt)

'Usage:
model-script.R <input_path> <output_folder>

]' -> doc

arguments <- docopt(doc)

readr::read_csv(file = arguments$input_path) %>%
  reproseries::calculateAutoCorrelation() %>%
  readr::write_lines(path = paste0(arguments$output_folder, "auto-correlation-coefficient.txt"))

