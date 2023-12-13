test_that('the "solana_get_signature_for_address" function returns a list', {
  url <- "https://api.devnet.solana.com"
  address <- "72tXz6jhGVPFE8ZfAQocJPJU3HgxsdrRqKZoUdWUhs7o"
  data <- solana_get_signature_for_address(url, address)
  expect_type(data, 'list')
})
