plotAvgTemperaturesByYear <- function(avg_temperatures) {
  ggplot2::ggplot(data = avg_temperatures,
                  ggplot2::aes(x = year, y = avgTemperature)) +
    ggplot2::geom_line(group = 1) +
    ggplot2::labs(title = "average temperature by year in Nottingham (1920-1939)",
                  y = "average temperature")
}
