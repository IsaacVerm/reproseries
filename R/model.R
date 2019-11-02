calculateAutoCorrelation <- function(avg_temperatures) {
  acf(avg_temperatures$avgTemperature, lag.max = 1, plot = FALSE)$acf[2]
}
