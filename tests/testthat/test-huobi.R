library(testthat)

context('Huobi Public Calls')

test_that('the "huobi_candles" function returns a dataframe', {
  expect_s3_class(huobi_candles('1day', '200', 'btcusdt'), 'data.frame')
})
