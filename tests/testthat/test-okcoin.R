test_that('the "okcocin_trading_pairs" function returns a dataframe', {
  skip_on_cran()
  expect_s3_class(okcoin_trading_pairs(), 'data.frame')
})

test_that('the "okcocin_time" function returns a character', {
  expect_type(okcoin_time(), 'character')
})
