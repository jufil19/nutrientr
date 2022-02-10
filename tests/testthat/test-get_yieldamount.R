test_that("Structure output is correct for yield amount endpoint", {
  yieldamount <- get_yieldamount(apiKey = '664fbadd34e6c2ca75235709f9ede2bd', foodCode = 57)
  
  expect_equal(is_tibble(yieldamount), TRUE)
  expect_equal(nrow(yieldamount), 2)
  
  col_types <- c('double', 'integer', 'character', 'character')
  expect_equal(col_types, as.vector(sapply(yieldamount, typeof)))})