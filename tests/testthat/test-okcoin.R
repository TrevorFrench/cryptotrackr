library(testthat)

context('Okcoin Public Calls')

test_that('the "okcocin_trading_pairs" function returns a dataframe', {
  expect_s3_class(okcoin_trading_pairs(), 'data.frame')
})

test_that('the "okcocin_time" function returns a character', {
  expect_type(okcoin_time(), 'character')
})
