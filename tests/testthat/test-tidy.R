test_that("temperatureSeriesToDf() returns data.frame", {
  expect_is(nottem %>% temperatureSeriesToDf, "data.frame")
})

temperatures <- nottem %>% temperatureSeriesToDf

test_that("tidyTemperatures() returns data.frame", {
  expect_is(temperatures %>% tidyTemperatures, "data.frame")
})

test_that("tidyTemperatures() returns tidy data", {
  expect_named(temperatures %>% tidyTemperatures, c("month", "year", "value"))
})
