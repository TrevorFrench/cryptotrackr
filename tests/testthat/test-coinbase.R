test_that('the "coinbase_all_currencies" function returns a dataframe', {
  expect_s3_class(coinbase_all_currencies(), 'data.frame')
})

test_that('the "coinbase_single_currency" function returns a list whether a
          currency is supplied and regardless of symbol casing', {
  expect_type(coinbase_single_currency(''), 'list')
  expect_type(coinbase_single_currency('btc'), 'list')
  expect_type(coinbase_single_currency('bTc'), 'list')
  expect_type(coinbase_single_currency('BTC'), 'list')
})

test_that('the "coinbase_single_currency" function will return a "NotFound"
          message when applicable', {
  expect_true(coinbase_single_currency('MADEUPASSET')$message == "NotFound")
})

test_that('the "coinbase_time" function returns a double', {
  expect_type(coinbase_time(), 'double')
})
