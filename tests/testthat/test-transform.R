library(dplyr)

tidy_temperatures <- nottem %>%
  temperatureSeriesToDf %>%
  tidyTemperatures

test_that("addCelsiusColumn() returns data.frame", {
  tidy_temperatures %>%
    addCelsiusColumn %>%
    expect_is("data.frame")

})

test_that("addCelsiusColumn() creates fahrenheit and celcius columns", {
  columns <- tidy_temperatures %>%
    addCelsiusColumn %>%
    colnames

  c("fahrenheit", "celsius") %in%
    columns %>%
    all %>%
    expect_true
})

test_that("summariseAvgTemperatureByYear() throws error if there's no celsius column", {
  expect_error(tidy_temperatures %>%
                 summariseAvgTemperatureByYear)
})

test_that("summariseAvgTemperatureByYear() returns data.frame", {
  tidy_temperatures %>%
    addCelsiusColumn %>%
    summariseAvgTemperatureByYear %>%
    expect_is("data.frame")

})

test_that("summariseAvgTemperatureByYear() groups by year", {
  years <- unique(nottem %>%
                    temperatureSeriesToDf %>%
                    tidyTemperatures %>%
                    dplyr::pull(year))

  tidy_temperatures %>%
    addCelsiusColumn %>%
    summariseAvgTemperatureByYear %>%
    dplyr::pull(year) %>%
    sort %>%
    expect_equal(years)
})

test_that("summariseAvgTemperatureByYear() has year and avgTemperature columns", {
  tidy_temperatures %>%
    addCelsiusColumn %>%
    summariseAvgTemperatureByYear %>%
    colnames %>%
    expect_equal(c("year", "avgTemperature"))
})
