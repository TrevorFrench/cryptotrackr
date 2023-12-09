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
