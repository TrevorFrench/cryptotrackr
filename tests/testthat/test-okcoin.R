library(testthat)

context('Okcoin Public Calls')

test_that('the "okcocin_trading_pairs" function returns a dataframe', {
  expect_s3_class(okcoin_trading_pairs(), 'data.frame')
})




# magic_eden_token_listings, magic_eden_token_metadata,
# okcoin_trading_pairs, okcoin_time
# bittrex source, c source xt
