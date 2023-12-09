library(testthat)

context('CoinGecko Public Calls')

test_that('the "coingecko_ping" function returns a list', {
  expect_type(coingecko_ping(), 'list')
  Sys.sleep(2)
})

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
