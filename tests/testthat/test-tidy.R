test_that("tidyNottem() returns data.frame", {
  expect_is(nottem %>% tidyNottem, "data.frame")
})

test_that("tidyNottem() returns tidy data", {
  expect_named(nottem %>% tidyNottem, c("month", "year", "value"))
})
