test_that("Structure output is correct for nutrient group endpoint", {
  nutrientgroup <- get_nutrientgroup(apiKey = '664fbadd34e6c2ca75235709f9ede2bd')
  
  expect_equal(tibble::is_tibble(nutrientgroup), TRUE)
  expect_equal(nrow(nutrientgroup), 7)
  
  col_types <- c('integer', 'character', 'integer')
  expect_equal(col_types, as.vector(sapply(nutrientgroup, typeof)))} )