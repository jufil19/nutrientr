test_that("Structure output is correct for nutrient source endpoint", {
  nutrientsource <- get_nutrientsource(apiKey = '664fbadd34e6c2ca75235709f9ede2bd')
  
  expect_equal(is_tibble(nutrientsource), TRUE)
  expect_equal(nrow(nutrientsource), 20)
  
  col_types <- c('integer', 'character', 'integer')
  expect_equal(col_types, as.vector(sapply(nutrientsource, typeof)))} )