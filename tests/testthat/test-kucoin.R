test_that('the "kucoin_time" function returns a character', {
  expect_type(kucoin_time(), 'character')
})

test_that('the "kucoin_symbols_list" function returns a dataframe', {
  expect_s3_class(kucoin_symbols_list('btc'), 'data.frame')
})
