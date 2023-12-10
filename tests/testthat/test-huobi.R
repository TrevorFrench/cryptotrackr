library(testthat)

context('Gemini Public Calls')

test_that('the "gemini_symbols" function returns a character vector', {
  expect_type(gemini_symbols(), 'character')
})

test_that('the "gemini_price_feed" function returns a dataframe', {
  expect_s3_class(gemini_price_feed(), 'data.frame')
})


# huobi_candles,
# kraken_server_time, kraken_server_status,
# kraken_asset_info, kraken_asset_pairs,
# kraken_ticker_info, kucoin_time, kucoin_symbols_list,
# magic_eden_collection_stats,
# magic_eden_token_listings, magic_eden_token_metadata,
# magic_eden_tokens_owned, magic_eden_transactions,
# okcoin_trading_pairs, okcoin_time
# bittrex source, c source xt
