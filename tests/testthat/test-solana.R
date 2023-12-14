test_that('the "solana_get_signature_for_address" function returns a list', {
  url <- "https://api.devnet.solana.com"
  address <- "72tXz6jhGVPFE8ZfAQocJPJU3HgxsdrRqKZoUdWUhs7o"
  data <- solana_get_signature_for_address(url, address)
  expect_type(data, 'list')
})

test_that('the "solana_get_account_info" function returns a list', {
  url <- "https://api.devnet.solana.com"
  pubkey <- "vines1vzrYbzLMRdu58ou5XTby4qAqVRLmqo36NKPTg"
  data <- solana_get_account_info(url, pubkey)
  expect_type(data, 'list')
})

test_that('the "solana_get_account_info" function returns a list', {
  url <- "https://api.devnet.solana.com"
  data <- solana_get_block_height(url)
  expect_type(data, 'integer')
})

