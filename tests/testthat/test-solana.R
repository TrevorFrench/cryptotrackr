test_that('the "solana_get_signature_for_address" function returns a list', {
  skip_on_cran()
  url <- "https://api.devnet.solana.com"
  address <- "Vote111111111111111111111111111111111111111"
  data <- tryCatch(
    solana_get_signature_for_address(url, address),
    error = function(c) geterrmessage()
    )
  if (data[1] == "Request failed with status code: 429") {skip("Rate Limit")}
  expect_type(data, 'list')
})

test_that('the "solana_get_account_info" function returns a list', {
  skip_on_cran()
  url <- "https://api.devnet.solana.com"
  pubkey <- "vines1vzrYbzLMRdu58ou5XTby4qAqVRLmqo36NKPTg"
  data <- tryCatch(
    solana_get_account_info(url, pubkey),
    error = function(c) geterrmessage()
    )
  if (data[1] == "Request failed with status code: 429") {skip("Rate Limit")}
  expect_type(data, 'list')
})

test_that('the "solana_get_account_info" function returns a list', {
  skip_on_cran()
  url <- "https://api.devnet.solana.com"
  data <- tryCatch(
    solana_get_block_height(url),
    error = function(c) geterrmessage()
  )
  if (data[1] == "Request failed with status code: 429") {skip("Rate Limit")}
  expect_type(data, 'integer')
})

test_that('the "solana_get_health" function returns a character', {
  skip_on_cran()
  url <- "https://api.devnet.solana.com"
  data <- tryCatch(
    solana_get_health(url),
    error = function(c) geterrmessage()
  )
  if (data[1] == "Request failed with status code: 429") {skip("Rate Limit")}
  expect_type(data, 'character')
})

test_that('the "solana_get_version" function returns a list', {
  skip_on_cran()
  url <- "https://api.devnet.solana.com"
  data <- tryCatch(
    solana_get_version(url),
    error = function(c) geterrmessage()
  )
  if (data[1] == "Request failed with status code: 429") {skip("Rate Limit")}
  expect_type(data, 'list')
})

test_that('the "solana_get_supply" function returns a list', {
  skip_on_cran()
  url <- "https://api.devnet.solana.com"
  data <- tryCatch(
    solana_get_supply(url),
    error = function(c) geterrmessage()
  )
  if (data[1] == "Request failed with status code: 429") {skip("Rate Limit")}
  expect_type(data, 'list')
})

test_that('the "solana_get_identity" function returns a character', {
  skip_on_cran()
  url <- "https://api.devnet.solana.com"
  data <- tryCatch(
    solana_get_identity(url),
    error = function(c) geterrmessage()
  )
  if (data[1] == "Request failed with status code: 429") {skip("Rate Limit")}
  expect_type(data, 'character')
})

test_that('the "solana_get_inflation_rate" function returns a list', {
  skip_on_cran()
  url <- "https://api.devnet.solana.com"
  data <- tryCatch(
    solana_get_inflation_rate(url),
    error = function(c) geterrmessage()
  )
  if (data[1] == "Request failed with status code: 429") {skip("Rate Limit")}
  expect_type(data, 'list')
})

test_that('the "solana_get_genesis_hash" function returns a character', {
  skip_on_cran()
  url <- "https://api.devnet.solana.com"
  data <- tryCatch(
    solana_get_genesis_hash(url),
    error = function(c) geterrmessage()
  )
  if (data[1] == "Request failed with status code: 429") {skip("Rate Limit")}
  expect_type(data, 'character')
})

test_that('the "solana_get_slot" function returns an integer and the
          "solana_get_block" function returns a list', {
            skip_on_cran()
  url <- "https://api.devnet.solana.com"
  slot <- tryCatch(
    solana_get_slot(url),
    error = function(c) geterrmessage()
  )
  if (slot[1] == "Request failed with status code: 429") {skip("Rate Limit")}
  data <- tryCatch(
    solana_get_block(url, slot),
    error = function(c) geterrmessage()
  )
  if (data[1] == "Request failed with status code: 429") {skip("Rate Limit")}
  expect_type(slot, 'integer')
  expect_type(data, 'list')
})

test_that('the "solana_get_recent_prioritization_fees" function returns a list', {
  skip_on_cran()
  url <- "https://api.devnet.solana.com"
  data <- tryCatch(
    solana_get_recent_prioritization_fees(url),
    error = function(c) geterrmessage()
  )
  if (data[1] == "Request failed with status code: 429") {skip("Rate Limit")}
  expect_type(data, 'list')
})
