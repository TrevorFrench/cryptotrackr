library(testthat)

context('Magic Eden Public Calls')

test_that('the "magic_eden_collection_stats" function returns a list with a
          "symbol" element that matches the provided symbol', {
  symbol <- "gothic_degens"
  resp <- magic_eden_collection_stats(symbol)
  expect_type(resp, 'list')
  expect_true(resp$symbol == symbol)
})

test_that('the "magic_eden_tokens_owned" function returns a dataframe', {
  wallet <- "72tXz6jhGVPFE8ZfAQocJPJU3HgxsdrRqKZoUdWUhs7o"
  resp <- magic_eden_tokens_owned(wallet)
  expect_s3_class(resp, 'data.frame')
})

test_that('the "magic_eden_transactions" function returns a dataframe', {
  wallet <- "72tXz6jhGVPFE8ZfAQocJPJU3HgxsdrRqKZoUdWUhs7o"
  resp <- magic_eden_transactions(wallet)
  expect_s3_class(resp, 'data.frame')
})
