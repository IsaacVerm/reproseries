#' Plot of average temperatures by year
#'
#' \code{plotAvgTemperaturesByYear} plots the average temperature by year in a line graph
plotAvgTemperaturesByYear <- function(avg_temperatures,
                                      place = "Nottingham") {

  createTitle <- function(avg_temperatures, place) {
    firstYear <- function(avg_temperatures) {
      min(avg_temperatures$year)
    }

    lastYear <- function(avg_temperatures) {
      max(avg_temperatures$year)
    }

    paste0(
      "average temperature by year in ",
      place,
      " (",
      firstYear(avg_temperatures),
      "-",
      lastYear(avg_temperatures),
      ")"
    )
  }

  ggplot2::ggplot(data = avg_temperatures,
                  ggplot2::aes(x = year, y = avgTemperature)) +
    ggplot2::geom_line(group = 1) +
    ggplot2::labs(title = createTitle(avg_temperatures, place),
                  y = "average temperature")
}
