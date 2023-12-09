library(testthat)

context('Binance.US Public Calls')

test_that('the "binance_us_server_time" function returns a double', {
  expect_type(binance_us_server_time(), 'double')
})

test_that('the "binance_us_ping" function returns a "200" status code', {
  expect_true(binance_us_ping()$status_code == 200)
})

test_that('the "binance_us_time" function returns a double', {
  expect_type(binance_us_server_time(), 'double')
})

test_that('the "binance_us_recent_trades" function returns a dataframe
          regardless of symbol casing', {
  expect_s3_class(binance_us_recent_trades('LTCBTC', 1000), 'data.frame')
  expect_s3_class(binance_us_recent_trades('LtCbTc', 1000), 'data.frame')
  expect_s3_class(binance_us_recent_trades('ltcbtc', 1000), 'data.frame')
})

test_that('the "binance_us_recent_trades" function does not return more rows
          than the specified limit', {
  expect_true(nrow(binance_us_recent_trades('LTCBTC', 10)) <= 10)
})

# blockchain_dot_com_symbol,
# blockchain_dot_com_symbols,
# blockchain_dot_com_ticker_symbol,
# blockchain_dot_com_tickers,
# blockchain_dot_com_l3_order_book,
# blockchain_dot_com_l2_order_book, cex_io_ticker,
# cex_io_currency_limits, cex_io_last_price,
# cex_io_converter, cex_io_ohlcv, cex_io_nonce,
# coinbase_all_currencies, coinbase_single_currency,
# coinbase_time, coingecko_ping,
# coingecko_vs_currencies, coingecko_coins,
# coingecko_price, coingecko_categories,
# coingecko_price_history, coingecko_global_data,
# coinlist_symbols, coinlist_time,
# crypto_dot_com_instruments, crypto_dot_com_get_book,
# crypto_dot_com_get_candlestick,
# crypto_dot_com_get_ticker, crypto_dot_com_get_trades,
# gemini_symbols, gemini_price_feed, huobi_candles,
# kraken_server_time, kraken_server_status,
# kraken_asset_info, kraken_asset_pairs,
# kraken_ticker_info, kucoin_time, kucoin_symbols_list,
# magic_eden_collection_stats,
# magic_eden_token_listings, magic_eden_token_metadata,
# magic_eden_tokens_owned, magic_eden_transactions,
# okcoin_trading_pairs, okcoin_time