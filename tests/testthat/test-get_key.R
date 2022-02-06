context("get_key")

testthat::test_that("API key is retreived", { skip_if_no_key()
  expect_type(get_key(), "character")
})
