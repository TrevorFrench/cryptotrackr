test_that('the "coingecko_ping" function returns a list', {
  expect_type(coingecko_ping(), 'list')
})
