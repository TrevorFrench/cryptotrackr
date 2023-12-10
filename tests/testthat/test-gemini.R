library(testthat)

context('Gemini Public Calls')

test_that('the "gemini_symbols" function returns a character vector', {
  expect_type(gemini_symbols(), 'character')
})

test_that('the "gemini_price_feed" function returns a dataframe', {
  expect_s3_class(gemini_price_feed(), 'data.frame')
})
