#' solana_api_call
#'
#' @param url the RPC url for your API call
#' @param request_body the request body for your API call
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns data from your Solana API call
#' @export
#'
#' @examples
#' \donttest{
#' url <- "https://api.devnet.solana.com"
#' request_body <-
#'   solana_assemble_request_body('"2.0"', 'null', '"getBlockHeight"', NULL)
#' data <- solana_api_call(url, request_body)}

solana_api_call <- function(url, request_body, timeout_seconds = 60) {
  headers <- c("Content-Type" = "application/json")

  tryCatch({
    res <-
      httr::POST(url
                 , httr::add_headers(.headers = headers)
                 , body = request_body
                 , httr::timeout(timeout_seconds))

    if (res$status_code == 200) {
      data <- jsonlite::fromJSON(rawToChar(res$content))
      return(data)
    } else {
      stop(paste("API call failed with status code", res$status_code))
    }

  }, error = function(e) {
    message <- paste("Error during API call:", e$message)
    warning(message)
    return(NULL)
  })
}

#' solana_assemble_key_pair
#'
#' @param key the key for your key pair
#' @param pair the pair for your key pair
#'
#' @return Returns your key pair if it exists or a blank string if it doesn't
#' exist
#' @export
#'
#' @examples
#' limit <- NULL
#' limit <- solana_assemble_key_pair('limit', limit)

solana_assemble_key_pair <- function(key, pair) {
  if (is.null(pair)) {
    keypair <- ''
  } else {
    keypair <- paste('"', key, '":', pair, sep = '')
  }
  return(keypair)
}

#' solana_assemble_list
#'
#' @param character_vector the character vector used to create the config object
#' @return Returns your config object
#' @export
#'
#' @examples
#' limit <- solana_assemble_key_pair('limit', NULL)
#' character_vector <- c(limit)
#' config_object <- solana_assemble_list(character_vector)

solana_assemble_list <- function(character_vector) {
  character_vector <- character_vector[character_vector != '']
  character_vector <- paste(character_vector, collapse = ',')
  return(character_vector)
}

#' solana_assemble_request_body
#'
#' @param jsonrpc the jsonrpc for your request body
#' @param id the id for your request body
#' @param method the method for your request body
#' @param params the parameters for your request body
#'
#' @return Returns the request body for your solana API call
#' @export
#'
#' @examples
#' \donttest{
#' limit <- solana_assemble_key_pair('limit', NULL)
#' character_vector <- c(limit)
#' config_object <- solana_assemble_list(character_vector)
#' address <- "Vote111111111111111111111111111111111111111"
#' params <- paste('["', address, '", {', config_object, '}]', sep = '')
#' solana_assemble_request_body('"2.0"', 'null', '"getSignaturesForAddress"', params)}

solana_assemble_request_body <-
  function(jsonrpc, id, method, params) {
    jsonrpc <- solana_assemble_key_pair('jsonrpc', jsonrpc)
    id <- solana_assemble_key_pair('id', id)
    method <- solana_assemble_key_pair('method', method)
    params <- solana_assemble_key_pair('params', params)
    character_vector <- c(jsonrpc, id, method, params)
    body <- solana_assemble_list(character_vector)
    request_body <- paste('{', body, '}', sep = '')
    return(request_body)
  }

#' solana_get_signature_for_address
#'
#' @param url the RPC url for your API call
#' @param address the address for which you're retrieving signatures
#' @param limit maximum transaction signatures to return (between 1 and 1,000).
#' Default is 1,000.
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return Returns signatures for confirmed transactions that include the given
#' address in their accountKeys list. Returns signatures backwards in time from
#' the provided signature or most recent confirmed block
#' @export
#'
#' @examples
#' \donttest{
#' url <- "https://api.devnet.solana.com"
#' address <- "Vote111111111111111111111111111111111111111"
#' data <- solana_get_signature_for_address(url,address)}

solana_get_signature_for_address <-
  function(url, address, limit = NULL, timeout_seconds = 60) {
    limit <- solana_assemble_key_pair('limit', limit)
    character_vector <- c(limit)
    config_object <- solana_assemble_list(character_vector)
    params <- paste('["', address, '", {', config_object, '}]', sep = '')
    request_body <-
      solana_assemble_request_body('"2.0"', 'null', '"getSignaturesForAddress"', params)
    data <- solana_api_call(url, request_body, timeout_seconds)

    if (is.null(data)) {
      warning("Failed to retrieve data from Solana API.")
      return(NULL)
    }

    if (!is.null(data$result)) {
      return(data$result)
    } else {
      warning("The response does not contain 'result'.")
      return(NULL)
    }

  }

#' solana_get_account_info
#'
#' @param url the RPC url for your API call
#' @param pubkey the pubkey for which you're retrieving account info
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return Returns all information associated with the account of provided Pubkey
#' @export
#'
#' @examples
#' \donttest{
#' url <- "https://api.devnet.solana.com"
#' pubkey <- "vines1vzrYbzLMRdu58ou5XTby4qAqVRLmqo36NKPTg"
#' data <- solana_get_account_info(url, pubkey)}

solana_get_account_info <- function(url, pubkey, timeout_seconds = 60) {
  params <- paste('["', pubkey, '"]', sep = '')
  request_body <-
    solana_assemble_request_body('"2.0"', 'null', '"getAccountInfo"', params)
  data <- solana_api_call(url, request_body, timeout_seconds)

  if (is.null(data)) {
    warning("Failed to retrieve data from Solana API.")
    return(NULL)
  }

  if (!is.null(data$result$value)) {
    return(data$result$value)
  } else {
    warning("The response does not contain 'result$value'.")
    return(NULL)
  }

}

#' solana_get_block_height
#'
#' @param url the RPC url for your API call
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return Returns the current block height of the node
#' @export
#'
#' @examples
#' \donttest{
#' url <- "https://api.devnet.solana.com"
#' data <- solana_get_block_height(url)}

solana_get_block_height <- function(url, timeout_seconds = 60) {
  request_body <-
    solana_assemble_request_body('"2.0"', 'null', '"getBlockHeight"', NULL)
  data <- solana_api_call(url, request_body, timeout_seconds)

  if (is.null(data)) {
    warning("Failed to retrieve data from Solana API.")
    return(NULL)
  }

  if (!is.null(data$result)) {
    return(data$result)
  } else {
    warning("The response does not contain 'result'.")
    return(NULL)
  }

}

#' solana_get_health
#'
#' @param url the RPC url for your API call
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return Returns the current health of the node.
#' @export
#'
#' @examples
#' \donttest{
#' url <- "https://api.devnet.solana.com"
#' data <- solana_get_health(url)}

solana_get_health <- function(url, timeout_seconds = 60) {
  request_body <-
    solana_assemble_request_body('"2.0"', 'null', '"getHealth"', NULL)
  data <- solana_api_call(url, request_body, timeout_seconds)

  if (is.null(data)) {
    warning("Failed to retrieve data from Solana API.")
    return(NULL)
  }

  if (!is.null(data$result)) {
    return(data$result)
  } else {
    warning("The response does not contain 'result'.")
    return(NULL)
  }
}

#' solana_get_version
#'
#' @param url the RPC url for your API call
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return Returns the current Solana version running on the node
#' @export
#'
#' @examples
#' \donttest{
#' url <- "https://api.devnet.solana.com"
#' data <- solana_get_version(url)}

solana_get_version <- function(url, timeout_seconds = 60) {
  request_body <-
    solana_assemble_request_body('"2.0"', 'null', '"getVersion"', NULL)
  data <- solana_api_call(url, request_body, timeout_seconds)

  if (is.null(data)) {
    warning("Failed to retrieve data from Solana API.")
    return(NULL)
  }

  if (!is.null(data$result)) {
    return(data$result)
  } else {
    warning("The response does not contain 'result'.")
    return(NULL)
  }

}

#' solana_get_supply
#'
#' @param url the RPC url for your API call
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return Returns information about the current supply.
#' @export
#'
#' @examples
#' \donttest{
#' url <- "https://api.devnet.solana.com"
#' data <- solana_get_supply(url)}

solana_get_supply <- function(url, timeout_seconds = 60) {
  request_body <-
    solana_assemble_request_body('"2.0"', 'null', '"getSupply"', NULL)
  data <- solana_api_call(url, request_body, timeout_seconds)

  if (is.null(data)) {
    warning("Failed to retrieve data from Solana API.")
    return(NULL)
  }

  if (!is.null(data$result$value)) {
    return(data$result$value)
  } else {
    warning("The response does not contain 'result$value'.")
    return(NULL)
  }

}

#' solana_get_identity
#'
#' @param url the RPC url for your API call
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return Returns the identity pubkey for the current node
#' @export
#'
#' @examples
#' \donttest{
#' url <- "https://api.devnet.solana.com"
#' data <- solana_get_identity(url)}

solana_get_identity <- function(url, timeout_seconds = 60) {
  request_body <-
    solana_assemble_request_body('"2.0"', 'null', '"getIdentity"', NULL)
  data <- solana_api_call(url, request_body, timeout_seconds)

  if (is.null(data)) {
    warning("Failed to retrieve data from Solana API.")
    return(NULL)
  }

  if (!is.null(data$result$identity)) {
    return(data$result$identity)
  } else {
    warning("The response does not contain 'result$identity'.")
    return(NULL)
  }

}

#' solana_get_inflation_rate
#'
#' @param url the RPC url for your API call
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return Returns the specific inflation values for the current epoch
#' @export
#'
#' @examples
#' \donttest{
#' url <- "https://api.devnet.solana.com"
#' data <- solana_get_inflation_rate(url)}

solana_get_inflation_rate <- function(url, timeout_seconds = 60) {
  request_body <-
    solana_assemble_request_body('"2.0"', 'null', '"getInflationRate"', NULL)
  data <- solana_api_call(url, request_body, timeout_seconds)

  if (is.null(data)) {
    warning("Failed to retrieve data from Solana API.")
    return(NULL)
  }

  if (!is.null(data$result)) {
    return(data$result)
  } else {
    warning("The response does not contain 'result'.")
    return(NULL)
  }

}

#' solana_get_genesis_hash
#'
#' @param url the RPC url for your API call
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return Returns the genesis hash
#' @export
#'
#' @examples
#' \donttest{
#' url <- "https://api.devnet.solana.com"
#' data <- solana_get_genesis_hash(url)}

solana_get_genesis_hash <- function(url, timeout_seconds = 60) {
  request_body <-
    solana_assemble_request_body('"2.0"', 'null', '"getGenesisHash"', NULL)
  data <- solana_api_call(url, request_body, timeout_seconds)

  if (is.null(data)) {
    warning("Failed to retrieve data from Solana API.")
    return(NULL)
  }

  if (!is.null(data$result)) {
    return(data$result)
  } else {
    warning("The response does not contain 'result'.")
    return(NULL)
  }

}

#' solana_get_recent_prioritization_fees
#'
#' @param url the RPC url for your API call
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return Returns a list of prioritization fees from recent blocks.
#' @export
#'
#' @examples
#' \donttest{
#' url <- "https://api.devnet.solana.com"
#' data <- solana_get_recent_prioritization_fees(url)}

solana_get_recent_prioritization_fees <- function(url, timeout_seconds = 60) {
  request_body <-
    solana_assemble_request_body('"2.0"', '1', '"getRecentPrioritizationFees"', NULL)
  data <- solana_api_call(url, request_body, timeout_seconds)

  if (is.null(data)) {
    warning("Failed to retrieve data from Solana API.")
    return(NULL)
  }

  if (!is.null(data$result)) {
    return(data$result)
  } else {
    warning("The response does not contain 'result'.")
    return(NULL)
  }

}

#' solana_get_slot
#'
#' @param url the RPC url for your API call
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return Returns the slot that has reached the given or default commitment
#' level.
#' @export
#'
#' @examples
#' \donttest{
#' url <- "https://api.devnet.solana.com"
#' data <- solana_get_slot(url)}

solana_get_slot <- function(url, timeout_seconds = 60) {
  request_body <-
    solana_assemble_request_body('"2.0"', '1', '"getSlot"', NULL)
  data <- solana_api_call(url, request_body, timeout_seconds)

  if (is.null(data)) {
    warning("Failed to retrieve data from Solana API.")
    return(NULL)
  }

  if (!is.null(data$result)) {
    return(data$result)
  } else {
    warning("The response does not contain 'result'.")
    return(NULL)
  }

}

#' solana_get_block
#'
#' @param url the RPC url for your API call
#' @param slot slot number, as u64 integer
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return Returns identity and transaction information about a confirmed block
#' in the ledger.
#' @export
#'
#' @examples
#' \donttest{
#' url <- "https://api.devnet.solana.com"
#' slot <- solana_get_slot(url)
#' data <- solana_get_block(url, slot)}

solana_get_block <- function(url, slot, timeout_seconds = 60) {
  params <- paste('[', slot, ',
      {
        "encoding": "json",
        "maxSupportedTransactionVersion":0,
        "transactionDetails":"full",
        "rewards":false
      }]', sep = '')
  request_body <-
    solana_assemble_request_body('"2.0"', '1', '"getBlock"', params)
  data <- solana_api_call(url, request_body, timeout_seconds)

  if (is.null(data)) {
    warning("Failed to retrieve data from Solana API.")
    return(NULL)
  }

  if (!is.null(data$result)) {
    return(data$result)
  } else {
    warning("The response does not contain 'result'.")
    return(NULL)
  }

}
