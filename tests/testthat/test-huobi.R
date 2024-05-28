test_that('the "huobi_candles" function returns a dataframe', {
  skip_on_cran()
  expect_s3_class(huobi_candles('1day', '200', 'btcusdt'), 'data.frame')
})
