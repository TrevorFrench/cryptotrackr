library(testthat)

context('Magic Eden Public Calls')

test_that('the "magic_eden_tokens_owned" function returns a dataframe', {
  wallet <- "72tXz6jhGVPFE8ZfAQocJPJU3HgxsdrRqKZoUdWUhs7o"
  resp <- magic_eden_tokens_owned(wallet)
  expect_s3_class(resp, 'data.frame')
})




# magic_eden_token_listings, magic_eden_token_metadata,
# okcoin_trading_pairs, okcoin_time
# bittrex source, c source xt
