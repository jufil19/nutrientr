test_that("food endpoint is reachable", {
  resp <- query_api('food', '664fbadd34e6c2ca75235709f9ede2bd', id = 1)
  expect_equal(resp$response$status_code, 200)
})

test_that("nutrientamount endpoint is reachable", {
  resp <- query_api('nutrientamount', '664fbadd34e6c2ca75235709f9ede2bd', id=1)
  expect_equal(resp$response$status_code, 200)
})

test_that("nutrientgroup is reachable", {
  resp <- query_api('nutrientgroup', '664fbadd34e6c2ca75235709f9ede2bd', id = 1)
  expect_equal(resp$response$status_code, 200)
})

test_that("nutrientname endpoint is reachable", {
  resp <- query_api('nutrientname', '664fbadd34e6c2ca75235709f9ede2bd')
  expect_equal(resp$response$status_code, 200)
})

test_that("nutrientsource endpoint is reachable", {
  resp <- query_api('nutrientsource', '664fbadd34e6c2ca75235709f9ede2bd')
  expect_equal(resp$response$status_code, 200)
})

test_that("refuseamount endpoint is reachable", {
  resp <- query_api('refuseamount', '664fbadd34e6c2ca75235709f9ede2bd')
  expect_equal(resp$response$status_code, 200)
})

test_that("servingsize endpoint is reachable", {
  resp <- query_api('servingsize', '664fbadd34e6c2ca75235709f9ede2bd')
  expect_equal(resp$response$status_code, 200)
})

test_that("yieldamount endpoint is reachable", {
  resp <- query_api('yieldamount', '664fbadd34e6c2ca75235709f9ede2bd')
  expect_equal(resp$response$status_code, 200)
})

test_that("Invalid endpoint will yield an error", {
  resp <- query_api('yieldamout', '664fbadd34e6c2ca75235709f9ede2bd')
  expect_equal(resp$response$status_code, 200)
})

testthat::test_that("When incorrect key to the API is given, error is thrown", {
  incorrect_key <- "incorrect"
  expect_error(query_api(path = "food", apiKey = incorrect_key, id = 2314))
})

