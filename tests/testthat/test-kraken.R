library(testthat)

context('Kraken Public Calls')

test_that('the "huobi_candles" function returns a dataframe', {
  expect_s3_class(huobi_candles('1day', '200', 'btcusdt'), 'data.frame')
})

# kraken_server_time, kraken_server_status,
# kraken_asset_info, kraken_asset_pairs,
# kraken_ticker_info, kucoin_time, kucoin_symbols_list,
# magic_eden_collection_stats,
# magic_eden_token_listings, magic_eden_token_metadata,
# magic_eden_tokens_owned, magic_eden_transactions,
# okcoin_trading_pairs, okcoin_time
# bittrex source, c source xt
