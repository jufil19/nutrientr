test_that("Structure output is correct for refuse amount endpoint endpoint", {
  refuseamount <- get_refuseamount(apiKey = '664fbadd34e6c2ca75235709f9ede2bd', foodCode = 44)
  
  expect_equal(tibble::is_tibble(refuseamount), TRUE)
  expect_equal(nrow(refuseamount), 1)
  
  col_types <- c('double', 'integer', 'character', 'character')
  expect_equal(col_types, as.vector(sapply(refuseamount, typeof)))} )