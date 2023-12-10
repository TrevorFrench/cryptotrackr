library(testthat)

context('Kucoin Public Calls')

test_that('the "kucoin_time" function returns a character', {
  expect_type(kucoin_time(), 'character')
})

test_that('the "kucoin_symbols_list" function returns a dataframe', {
  expect_s3_class(kucoin_symbols_list('btc'), 'data.frame')
})

# magic_eden_collection_stats,
# magic_eden_token_listings, magic_eden_token_metadata,
# magic_eden_tokens_owned, magic_eden_transactions,
# okcoin_trading_pairs, okcoin_time
# bittrex source, c source xt
