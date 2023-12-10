test_that('the "coinlist_symbols" function returns a dataframe', {
  expect_s3_class(coinlist_symbols(), 'data.frame')
})

test_that('the "coinlist_time" function returns a double', {
  expect_type(coinlist_time(), 'double')
})
