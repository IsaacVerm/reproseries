library(dplyr)

tidy_nottem <- nottem %>%
  tidyNottem

test_that("addCelsiusColumn() returns data.frame", {
  tidy_nottem %>%
    addCelsiusColumn %>%
    expect_is("data.frame")

})

test_that("addCelsiusColumn() creates fahrenheit and celcius columns", {
  columns <- tidy_nottem %>%
    addCelsiusColumn %>%
    colnames

  c("fahrenheit", "celsius") %in%
    columns %>%
    all %>%
    expect_true
})

test_that("summariseAvgTemperatureByYear() throws error if there's no celsius column", {
  expect_error(tidy_nottem %>%
                 summariseAvgTemperatureByYear)
})

test_that("summariseAvgTemperatureByYear() returns data.frame", {
  tidy_nottem %>%
    addCelsiusColumn %>%
    summariseAvgTemperatureByYear %>%
    expect_is("data.frame")

})

test_that("summariseAvgTemperatureByYear() groups by year", {
  years <- unique(nottem %>% tidyNottem %>% dplyr::pull(year))

  tidy_nottem %>%
    addCelsiusColumn %>%
    summariseAvgTemperatureByYear %>%
    dplyr::pull(year) %>%
    sort %>%
    expect_equal(years)
})

test_that("summariseAvgTemperatureByYear() has year and avgTemperature columns", {
  tidy_nottem %>%
    addCelsiusColumn %>%
    summariseAvgTemperatureByYear %>%
    colnames %>%
    expect_equal(c("year", "avgTemperature"))
})
