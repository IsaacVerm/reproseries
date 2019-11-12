#' Plot of average temperatures by year
#'
#' \code{plotAvgTemperaturesByYear} plots the average temperature by year in a line graph.
#'
#' This function plots the average temperature by year.
#' It also automatically updates the title so there's no need to specify the title yourself.
#'
#' @param avg_temperatures Data.frame. Has years and their corresponding average temperature.
#' @param place String. It's assumed this function is called with the nottem built-in dataset.
#' This dataset records the temperatures in Nottingham. Nottingham is the default argument.
#' You can override this argument if the need arises.
#' @return ggplot object
#' @examples
#' avg_temperatures <- data.frame(year = c(1920, 1921, 1922, 1923),
#'                                avgTemperature = c(5, 10, 8, 9))
#' plotAvgTemperaturesByYear(avg_temperatures)
#' @export
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
