test_that('the "kraken_server_time" function returns unixtime as an integer and
          rfc1123 as a character', {
            skip_on_cran()
  expect_type(kraken_server_time()$unixtime, 'integer')
  expect_type(kraken_server_time()$rfc1123, 'character')
})

test_that('the "kraken_server_time" function returns status as a character and
          timestamp as a character', {
            skip_on_cran()
  expect_type(kraken_server_status()$status, 'character')
  expect_type(kraken_server_status()$timestamp, 'character')
})

test_that('the "kraken_asset_info" function returns a list', {
  skip_on_cran()
  expect_type(kraken_asset_info(), 'list')
  expect_type(kraken_asset_info("ETH,BTC"), 'list')
  expect_type(kraken_asset_info(aclass = "currency"), 'list')
})

test_that('the "kraken_asset_pairs" function returns a list', {
  skip_on_cran()
  expect_type(kraken_asset_pairs(), 'list')
})

test_that('the "kraken_ticker_info" function returns a list', {
  skip_on_cran()
  expect_type(kraken_ticker_info("ETHUSD"), 'list')
})
