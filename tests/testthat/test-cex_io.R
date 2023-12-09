library(testthat)

context('CEX.io Public Calls')

test_that('the "cex_io_ticker" function returns a list regardless of casing', {
  expect_type(cex_io_ticker('BTC', 'usd'), 'list')
})

test_that('the "cex_io_ticker" function does not return an error regardless of
          casing', {
  expect_true(is.null(cex_io_ticker('BTC', 'usd')$error))
})

test_that('the "cex_io_currency_limits" function returns a dataframe', {
  expect_s3_class(cex_io_currency_limits(), 'data.frame')
})

test_that('the "cex_io_last_price" function does not return an error regardless
          of the symbol casing', {
  expect_true(is.null(cex_io_last_price('btc', 'usd')$error))
  expect_true(is.null(cex_io_last_price('BTC', 'USD')$error))
  expect_true(is.null(cex_io_last_price('BtC', 'uSd')$error))
})

test_that('the "cex_io_converter" function does not return a null value
          regardless of the symbol casing', {
  expect_true(!is.null(cex_io_converter('btc', 'usd', 2.5)))
  expect_true(!is.null(cex_io_converter('BTC', 'USD', 2.5)))
  expect_true(!is.null(cex_io_converter('BtC', 'uSd', 2.5)))
})

test_that('the "cex_io_ohlcv" function does not return a null value regardless
          of the symbol casing', {
  expect_type(cex_io_ohlcv('20220927', 'btc', 'usd'), 'list')
  expect_type(cex_io_ohlcv('20220927', 'BTC', 'USD'), 'list')
  expect_type(cex_io_ohlcv('20220927', 'BtC', 'uSd'), 'list')
})

test_that('the "cex_io_nonce" function returns a double', {
  expect_type(cex_io_nonce(), 'double')
})

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
# bittrex source, c source xt
