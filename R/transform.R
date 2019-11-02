addCelsiusColumn <- function(temperatures) {
  temperatures %>%
    dplyr::mutate(celsius = (value - 32) * 5/9) %>%
    dplyr::rename(fahrenheit = value)
}

summariseAvgTemperatureByYear <- function(temperatures) {
  temperatures %>%
    dplyr::group_by(year) %>%
    dplyr::summarise(avgTemperature = mean(celsius))
}
