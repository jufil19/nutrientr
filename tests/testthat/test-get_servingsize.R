test_that("Structure output is correct for serving size endpoint endpoint", {
  servingsize <- get_servingsize(apiKey = '664fbadd34e6c2ca75235709f9ede2bd', foodCode = 45)
 
  expect_equal(tibble::is_tibble(servingsize), TRUE)
  expect_equal(nrow(servingsize), 5)
  
  col_types <- c('double', 'integer', 'character', 'character')
  expect_equal(col_types, as.vector(sapply(servingsize, typeof)))})