test_that('the "gemini_symbols" function returns a character vector', {
  skip_on_cran()
  expect_type(gemini_symbols(), 'character')
})

test_that('the "gemini_price_feed" function returns a dataframe', {
  skip_on_cran()
  expect_s3_class(gemini_price_feed(), 'data.frame')
})
