test_that('the "binance_us_server_time" function returns a double', {
  expect_type(binance_us_server_time(), 'double')
})

test_that('the "binance_us_ping" function returns a "200" status code', {
  expect_true(binance_us_ping()$status_code == 200)
})

test_that('the "binance_us_time" function returns a double', {
  expect_type(binance_us_server_time(), 'double')
})

test_that('the "binance_us_recent_trades" function returns a dataframe
          regardless of symbol casing', {
  expect_s3_class(binance_us_recent_trades('LTCBTC', 1000), 'data.frame')
  expect_s3_class(binance_us_recent_trades('LtCbTc', 1000), 'data.frame')
  expect_s3_class(binance_us_recent_trades('ltcbtc', 1000), 'data.frame')
})

test_that('the "binance_us_recent_trades" function does not return more rows
          than the specified limit', {
  expect_true(nrow(binance_us_recent_trades('LTCBTC', 10)) <= 10)
})
