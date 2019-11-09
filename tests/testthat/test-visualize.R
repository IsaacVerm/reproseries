test_that("plotAvgTemperaturesByYear returns plot", {
  avg_temperatures_by_year <- nottem %>%
    tidyNottem %>%
    addCelsiusColumn %>%
    summariseAvgTemperatureByYear

  expect_is(avg_temperatures_by_year %>% plotAvgTemperaturesByYear,
            "ggplot")
})
