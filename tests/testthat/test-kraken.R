library(testthat)

context('Kraken Public Calls')

test_that('the "kraken_server_time" function returns unixtime as an integer and
          rfc1123 as a character', {
  expect_type(kraken_server_time()$unixtime, 'integer')
  expect_type(kraken_server_time()$rfc1123, 'character')
})

test_that('the "kraken_server_time" function returns status as a character and
          timestamp as a character', {
  expect_type(kraken_server_status()$status, 'character')
  expect_type(kraken_server_status()$timestamp, 'character')
})

#' all_asset_info <- kraken_asset_info()
#' eth_btc_info <- kraken_asset_info("ETH,BTC")
#' currency_info <- kraken_asset_info(aclass = "currency")

# kraken_asset_info, kraken_asset_pairs,
# kraken_ticker_info, kucoin_time, kucoin_symbols_list,
# magic_eden_collection_stats,
# magic_eden_token_listings, magic_eden_token_metadata,
# magic_eden_tokens_owned, magic_eden_transactions,
# okcoin_trading_pairs, okcoin_time
# bittrex source, c source xt
