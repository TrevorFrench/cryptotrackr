test_that('the "crypto_dot_com_instruments" function returns a dataframe', {
  expect_s3_class(crypto_dot_com_instruments(), 'data.frame')
})

test_that('the "crypto_dot_com_get_book" function returns a list with
          depth/instrument as specified and a dataframe', {
  pair <- "BTC_USDT"
  resp <- crypto_dot_com_get_book(pair)
  expect_type(resp, 'list')
  expect_s3_class(resp$data, 'data.frame')
  expect_true(resp$depth == 50)
  expect_true(resp$instrument_name == pair)
})

test_that('the "crypto_dot_com_get_candlestick" function returns a list with
          interval/instrument as specified and a dataframe', {
  pair <- "BTC_USDT"
  resp <- crypto_dot_com_get_candlestick(pair)
  expect_type(resp, 'list')
  expect_s3_class(resp$data, 'data.frame')
  expect_true(resp$interval == '5m')
  expect_true(resp$instrument_name == pair)
})

test_that('the "crypto_dot_com_get_ticker" function returns a dataframe wih
          information about the specified instrument', {
  pair <- "BTC_USDT"
  resp <- crypto_dot_com_get_ticker(pair)
  expect_s3_class(resp, 'data.frame')
  expect_true(resp$i == pair)
})

test_that('the "crypto_dot_com_get_trades" function returns a dataframe wih
          information about the specified instrument', {
  pair <- "BTC_USDT"
  resp <- crypto_dot_com_get_trades(pair)
  expect_s3_class(resp, 'data.frame')
  expect_true(resp$i[1] == pair)
})
