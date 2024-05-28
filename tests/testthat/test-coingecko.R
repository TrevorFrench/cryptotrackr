test_that('the "coingecko_ping" function returns a list', {
  skip_on_cran()
  expect_type(coingecko_ping(), 'list')
})
