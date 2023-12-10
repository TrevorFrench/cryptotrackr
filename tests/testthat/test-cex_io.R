test_that('the "cex_io_ticker" function returns a list regardless of casing', {
  expect_type(cex_io_ticker('BTC', 'usd'), 'list')
})

test_that('the "cex_io_ticker" function does not return an error regardless of
          casing', {
  expect_true(is.null(cex_io_ticker('BTC', 'usd')$error))
})

test_that('the "cex_io_currency_limits" function returns a dataframe', {
  expect_s3_class(cex_io_currency_limits(), 'data.frame')
})

test_that('the "cex_io_last_price" function does not return an error regardless
          of the symbol casing', {
  expect_true(is.null(cex_io_last_price('btc', 'usd')$error))
  expect_true(is.null(cex_io_last_price('BTC', 'USD')$error))
  expect_true(is.null(cex_io_last_price('BtC', 'uSd')$error))
})

test_that('the "cex_io_converter" function does not return a null value
          regardless of the symbol casing', {
  expect_true(!is.null(cex_io_converter('btc', 'usd', 2.5)))
  expect_true(!is.null(cex_io_converter('BTC', 'USD', 2.5)))
  expect_true(!is.null(cex_io_converter('BtC', 'uSd', 2.5)))
})

test_that('the "cex_io_ohlcv" function does not return a null value regardless
          of the symbol casing', {
  expect_type(cex_io_ohlcv('20220927', 'btc', 'usd'), 'list')
  expect_type(cex_io_ohlcv('20220927', 'BTC', 'USD'), 'list')
  expect_type(cex_io_ohlcv('20220927', 'BtC', 'uSd'), 'list')
})

test_that('the "cex_io_nonce" function returns a double', {
  expect_type(cex_io_nonce(), 'double')
})
