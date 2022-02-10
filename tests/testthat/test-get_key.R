testthat::test_that("Key to the API is given", {
  skip_if_no_key()
  expect_type(get_key(), "character")
})

