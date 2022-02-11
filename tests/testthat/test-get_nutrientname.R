test_that("Structure output is correct for nutrient name endpoint", {
  nutrientname <- get_nutrientname(apiKey = '664fbadd34e6c2ca75235709f9ede2bd')
  
  expect_equal(tibble::is_tibble(nutrientname), TRUE)
  expect_equal(nrow(nutrientname), 152)
  
  col_types <- c('integer', rep('character', 3), 'integer', 'character', rep('integer', 2), 'character', 'integer')
  expect_equal(col_types, as.vector(sapply(nutrientname, typeof)))} )
