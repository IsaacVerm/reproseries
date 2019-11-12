test_that("plotAvgTemperaturesByYear returns plot", {
  avg_temperatures_by_year <- nottem %>%
    temperatureSeriesToDf %>%
    tidyTemperatures %>%
    addCelsiusColumn %>%
    summariseAvgTemperatureByYear

  expect_is(avg_temperatures_by_year %>% plotAvgTemperaturesByYear,
            "ggplot")
})
