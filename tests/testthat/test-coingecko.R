test_that('the "coingecko_ping" function returns a list', {
  expect_type(coingecko_ping(), 'list')
  Sys.sleep(5)
})

test_that('the "coingecko_vs_currencies" function returns a character vector', {
  expect_type(coingecko_vs_currencies(), 'character')
  Sys.sleep(5)
})

test_that('the "coingecko_coins" function returns a dataframe', {
  expect_s3_class(coingecko_coins(), 'data.frame')
  Sys.sleep(5)
})

test_that('the "coingecko_price" function returns a list', {
  expect_type(coingecko_price(id = 'bitcoin', vs_currency = 'usd'), 'list')
  Sys.sleep(5)
})

test_that('the "coingecko_categories" function returns a dataframe', {
  expect_s3_class(coingecko_categories(), 'data.frame')
  Sys.sleep(5)
})

test_that('the "coingecko_price_history" function returns a list without an error', {
  expect_type(coingecko_price_history("bitcoin", "30-12-2017"), 'list')
  expect_true(is.null(coingecko_price_history("bitcoin", "30-12-2017")$error))
  Sys.sleep(5)
})

test_that('the "coingecko_global_data" function returns a list', {
  expect_type(coingecko_global_data(), 'list')
  # Sys.sleep(5)
})
