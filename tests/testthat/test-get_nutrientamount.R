test_that("Structure output is correct for nutrient amount endpoint", {
  nutrientamount <- get_nutrientamount(apiKey = '664fbadd34e6c2ca75235709f9ede2bd', foodCode = 4)
  
  expect_equal(tibble::is_tibble(nutrientamount), TRUE)
  expect_equal(nrow(nutrientamount), 97)
  
  col_types <- c('integer', 'double', rep('integer', 3), 'character', 'integer')
  expect_equal(col_types, as.vector(sapply(nutrientamount, typeof)))})