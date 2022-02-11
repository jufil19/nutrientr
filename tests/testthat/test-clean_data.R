# Checking structure of output (if clean)
# The output should be a tibble, output the correct number of rows and correct types of columns
# Also, if the id is incorrect, the query will have no results and output an error

# Food endpoint

test_that("Structure output is correct for food endpoint", {
  resp_food <- query_api('food', '664fbadd34e6c2ca75235709f9ede2bd', id = 573)
  clean_food <- clean_data(resp_food)

  expect_equal(tibble::is_tibble(clean_food), TRUE)
  expect_equal(nrow(clean_food), 1)

  col_types <- c('integer', 'character')
  expect_equal(col_types, as.vector(sapply(clean_food, typeof)))})


# Nutrient amount endpoint
test_that("Structure output is correct for nutrient amount endpoint", {
  resp_nutrientamount <- query_api('nutrientamount', '664fbadd34e6c2ca75235709f9ede2bd', id = 4)
  clean_nutrientamount <- clean_data(resp_nutrientamount)

  expect_equal(tibble::is_tibble(clean_nutrientamount), TRUE)
  expect_equal(nrow(clean_nutrientamount), 97)

  col_types <- c('integer', 'double', rep('integer', 3), 'character', 'integer')
  expect_equal(col_types, as.vector(sapply(clean_nutrientamount, typeof)))} )

# Nutrient group endpoint

test_that("Structure output is correct for nutrient group endpoint", {
  resp_nutrientgroup <- query_api('nutrientgroup', '664fbadd34e6c2ca75235709f9ede2bd')
  clean_nutrientgroup <- clean_data(resp_nutrientgroup)

  expect_equal(tibble::is_tibble(clean_nutrientgroup), TRUE)
  expect_equal(nrow(clean_nutrientgroup), 7)

  col_types <- c('integer', 'character', 'integer')
  expect_equal(col_types, as.vector(sapply(clean_nutrientgroup, typeof)))} )


# Nutrient name endpoint

test_that("Structure output is correct for nutrient name endpoint", {
  resp_nutrientname <- query_api('nutrientname', '664fbadd34e6c2ca75235709f9ede2bd')
  clean_nutrientname <- clean_data(resp_nutrientname)

  expect_equal(tibble::is_tibble(clean_nutrientname), TRUE)
  expect_equal(nrow(clean_nutrientname), 152)

  col_types <- c('integer', rep('character', 3), 'integer', 'character', rep('integer', 2), 'character', 'integer')
  expect_equal(col_types, as.vector(sapply(clean_nutrientname, typeof)))} )


# Nutrient source endpoint

test_that("Structure output is correct for nutrient source endpoint", {
  resp_nutrientsource <- query_api('nutrientsource', '664fbadd34e6c2ca75235709f9ede2bd')
  clean_nutrientsource <- clean_data(resp_nutrientsource)

  expect_equal(tibble::is_tibble(clean_nutrientsource), TRUE)
  expect_equal(nrow(clean_nutrientsource), 20)

  col_types <- c('integer', 'character', 'integer')
  expect_equal(col_types, as.vector(sapply(clean_nutrientsource, typeof)))} )


# Refuse amount endpoint

test_that("Structure output is correct for refuse amount endpoint endpoint", {
  resp_refuseamount <- query_api('refuseamount', '664fbadd34e6c2ca75235709f9ede2bd', id = 44)
  clean_refuseamount <- clean_data(resp_refuseamount)

  expect_equal(tibble::is_tibble(clean_refuseamount), TRUE)
  expect_equal(nrow(clean_refuseamount), 1)

  col_types <- c('double', 'integer', 'character', 'character')
  expect_equal(col_types, as.vector(sapply(clean_refuseamount, typeof)))} )

# Serving size endpoint

test_that("Structure output is correct for serving size endpoint endpoint", {
  resp_servingsize <- query_api('servingsize', '664fbadd34e6c2ca75235709f9ede2bd', id = 45)
  clean_servingsize <- clean_data(resp_servingsize)

  expect_equal(tibble::is_tibble(clean_servingsize), TRUE)
  expect_equal(nrow(clean_servingsize), 5)

  col_types <- c('double', 'integer', 'character', 'character')
  expect_equal(col_types, as.vector(sapply(clean_servingsize, typeof)))})


# Yield amount endpoint

test_that("Structure output is correct for yield amount endpoint", {
  resp_yieldamount <- query_api('yieldamount', '664fbadd34e6c2ca75235709f9ede2bd', id =57)
  clean_yieldamount <- clean_data(resp_yieldamount)

  expect_equal(tibble::is_tibble(clean_yieldamount), TRUE)
  expect_equal(nrow(clean_yieldamount), 2)

  col_types <- c('double', 'integer', 'character', 'character')
  expect_equal(col_types, as.vector(sapply(clean_yieldamount, typeof)))})







