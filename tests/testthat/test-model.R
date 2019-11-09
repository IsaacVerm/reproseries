test_that("calculateAutoCorrelation() gives number between 0 and 1", {
  correlation <- nottem %>%
    tidyNottem %>%
    addCelsiusColumn %>%
    summariseAvgTemperatureByYear %>%
    calculateAutoCorrelation

  expect_gte(correlation, 0)
  expect_lte(correlation, 1)
})
