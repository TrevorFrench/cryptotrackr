library(testthat)

context('Blockchain.com Public Calls')

test_that('the "blockchain_dot_com_symbols" function returns a list', {
  expect_type(blockchain_dot_com_symbols(), 'list')
})

test_that('the "blockchain_dot_com_symbol" function returns a list when blank or
          with different casing', {
  expect_type(blockchain_dot_com_symbol('BTC-USD'), 'list')
  expect_type(blockchain_dot_com_symbol('btc-usd'), 'list')
  expect_type(blockchain_dot_com_symbol('BtC-uSd'), 'list')
  expect_type(blockchain_dot_com_symbol(''), 'list')
})

test_that('the "blockchain_dot_com_ticker_symbol" function returns a list no
          matter the casing', {
  expect_type(blockchain_dot_com_ticker_symbol('BTC-USD'), 'list')
  expect_type(blockchain_dot_com_ticker_symbol('btc-usd'), 'list')
  expect_type(blockchain_dot_com_ticker_symbol('BtC-uSD'), 'list')
})

test_that('the "blockchain_dot_com_ticker_symbol" function returns a data.frame
          when no symbol is provided', {
  expect_s3_class(blockchain_dot_com_ticker_symbol(''), 'data.frame')
})

test_that('the "blockchain_dot_com_tickers" function returns a data.frame', {
  expect_s3_class(blockchain_dot_com_tickers(), 'data.frame')
})

test_that('the "blockchain_dot_com_l2_order_book" function returns a list
          containing a bids and an asks data.frame', {
  symbol <- 'BTC-USD'
  l2_order_book <- blockchain_dot_com_l2_order_book(symbol)
  expect_s3_class(l2_order_book$bids, 'data.frame')
  expect_s3_class(l2_order_book$asks, 'data.frame')
})

test_that('the "blockchain_dot_com_l2_order_book" function returns a list
          containing a bids and an asks data.frame regardless of casing', {
  symbol <- 'btc-UsD'
  l2_order_book <- blockchain_dot_com_l2_order_book(symbol)
  expect_s3_class(l2_order_book$bids, 'data.frame')
  expect_s3_class(l2_order_book$asks, 'data.frame')
})

test_that('the "blockchain_dot_com_l3_order_book" function returns a list
          containing a bids and an asks data.frame', {
            symbol <- 'BTC-USD'
            l3_order_book <- blockchain_dot_com_l3_order_book(symbol)
            expect_s3_class(l3_order_book$bids, 'data.frame')
            expect_s3_class(l3_order_book$asks, 'data.frame')
          })

test_that('the "blockchain_dot_com_l3_order_book" function returns a list
          containing a bids and an asks data.frame regardless of casing', {
  symbol <- 'btc-UsD'
  l3_order_book <- blockchain_dot_com_l3_order_book(symbol)
  expect_s3_class(l3_order_book$bids, 'data.frame')
  expect_s3_class(l3_order_book$asks, 'data.frame')
})

# cex_io_ticker,
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
