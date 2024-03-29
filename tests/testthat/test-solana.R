test_that('the "solana_get_signature_for_address" function returns a list', {
  url <- "https://api.devnet.solana.com"
  address <- "Vote111111111111111111111111111111111111111"
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

test_that('the "solana_get_health" function returns a character', {
  url <- "https://api.devnet.solana.com"
  data <- solana_get_health(url)
  expect_type(data, 'character')
})

test_that('the "solana_get_version" function returns a list', {
  url <- "https://api.devnet.solana.com"
  data <- solana_get_version(url)
  expect_type(data, 'list')
})

test_that('the "solana_get_supply" function returns a list', {
  url <- "https://api.devnet.solana.com"
  data <- solana_get_supply(url)
  expect_type(data, 'list')
})

test_that('the "solana_get_identity" function returns a character', {
  url <- "https://api.devnet.solana.com"
  data <- solana_get_identity(url)
  expect_type(data, 'character')
})

test_that('the "solana_get_inflation_rate" function returns a list', {
  url <- "https://api.devnet.solana.com"
  data <- solana_get_inflation_rate(url)
  expect_type(data, 'list')
})

test_that('the "solana_get_genesis_hash" function returns a character', {
  url <- "https://api.devnet.solana.com"
  data <- solana_get_genesis_hash(url)
  expect_type(data, 'character')
})

test_that('the "solana_get_slot" function returns an integer and the
          "solana_get_block" function returns a list', {
  url <- "https://api.devnet.solana.com"
  slot <- solana_get_slot(url)
  data <- solana_get_block(url, slot)
  expect_type(slot, 'integer')
  expect_type(data, 'list')
})

test_that('the "solana_get_recent_prioritization_fees" function returns a list', {
  url <- "https://api.devnet.solana.com"
  data <- solana_get_recent_prioritization_fees(url)
  expect_type(data, 'list')
})
