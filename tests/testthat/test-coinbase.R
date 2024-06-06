test_that('the "coinbase_all_currencies" function returns a dataframe', {
  skip_on_cran()
  expect_s3_class(coinbase_all_currencies(), 'data.frame')
})

test_that('the "coinbase_single_currency" function returns a list whether a
          currency is supplied and regardless of symbol casing', {
            skip_on_cran()
  expect_type(coinbase_single_currency(''), 'list')
  expect_type(coinbase_single_currency('btc'), 'list')
  expect_type(coinbase_single_currency('bTc'), 'list')
  expect_type(coinbase_single_currency('BTC'), 'list')
})

test_that('the "coinbase_single_currency" function will return a "NotFound"
          message when applicable', {
            skip_on_cran()
  expect_true(is.null(coinbase_single_currency('MADEUPASSET')))
})

test_that('the "coinbase_time" function returns a double', {
  skip_on_cran()
  expect_type(coinbase_time(), 'double')
})
