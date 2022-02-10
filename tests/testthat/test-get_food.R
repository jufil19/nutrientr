test_that("Structure output is correct for food endpoint", {
  food <- get_food(apiKey = '664fbadd34e6c2ca75235709f9ede2bd', foodCode = 573)

  expect_equal(is_tibble(food), TRUE)
  expect_equal(nrow(food), 1)

  col_types <- c('integer', 'character')
  expect_equal(col_types, as.vector(sapply(food, typeof)))})
