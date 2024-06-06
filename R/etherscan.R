#' etherscan_api_call
#'
#' @param method "GET" or "POST"
#' @param query your query parameters
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns data from your Etherscan API call
#' @export
#'
#' @examples
#' \dontrun{
#' address <- "0xde0b295669a9fd93d5f28d9ec85e40f4cb697bae"
#' api_key <- "..."
#' tag <- "latest"
#' query_string <- list(
#'    module = 'account',
#'    action = 'balance',
#'    address = address,
#'    tag = tag,
#'    apikey = api_key
#' )
#'
#' data <- etherscan_api_call('GET', query_string)}

etherscan_api_call <- function(method, query, timeout_seconds = 60){
  tryCatch({
    res <- httr::VERB(method
                      , 'https://api.etherscan.io/api'
                      , query = query
                      , httr::timeout(timeout_seconds)
    )

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

#' etherscan_account_balance
#'
#' @param address the address for which you wish to retrieve the balance.
#' @param api_key your Etherscan API key
#' @param tag pre-defined block parameter, either earliest, pending or latest.
#' Default is latest.
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns the balance for the specified address
#' @export
#'
#' @examples
#' \dontrun{
#' address <- "0xde0b295669a9fd93d5f28d9ec85e40f4cb697bae"
#' api_key <- "..."
#' account_balance <- etherscan_account_balance(address, api_key)}

etherscan_account_balance <- function(address, api_key, tag = 'latest', timeout_seconds = 60){
  query_string <- list(
    module = 'account',
    action = 'balance',
    address = address,
    tag = tag,
    apikey = api_key
  )

  data <- etherscan_api_call('GET', query_string, timeout_seconds)

  if (is.null(data)) {
    warning("Failed to retrieve data from Etherscan API.")
    return(NULL)
  }

  if (!is.null(data$result)) {
    return(data$result)
  } else {
    warning("The response does not contain 'result'.")
    return(NULL)
  }

}

#' etherscan_contract_abi
#'
#' @param address the contract address for which you wish to retrieve the ABI.
#' @param api_key your Etherscan API key
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns the contract ABI for the specified address
#' @export
#'
#' @examples
#' \dontrun{
#' address <- "0xfb6916095ca1df60bb79ce92ce3ea74c37c5d359"
#' api_key <- "..."
#' abi <- etherscan_contract_abi(address, api_key)}

etherscan_contract_abi <- function(address, api_key, timeout_seconds = 60){
  query_string <- list(
    module = 'contract',
    action = 'getabi',
    address = address,
    apikey = api_key
  )

  data <- etherscan_api_call('GET', query_string, timeout_seconds)

  if (is.null(data)) {
    warning("Failed to retrieve data from Etherscan API.")
    return(NULL)
  }

  if (!is.null(data$result)) {
    return(data$result)
  } else {
    warning("The response does not contain 'result'.")
    return(NULL)
  }

}

#' etherscan_block_reward
#'
#' @param block the numeric block number
#' @param api_key your Etherscan API key
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns the block and uncle reward for the specified block number as
#' a list.
#' @export
#'
#' @examples
#' \dontrun{
#' block <- 12697906
#' api_key <- "..."
#' block_reward <- etherscan_block_reward(block, api_key)}

etherscan_block_reward <- function(block, api_key, timeout_seconds = 60){
  query_string <- list(
    module = 'block',
    action = 'getblockreward',
    blockno = block,
    apikey = api_key
  )

  data <- etherscan_api_call('GET', query_string, timeout_seconds)

  if (is.null(data)) {
    warning("Failed to retrieve data from Etherscan API.")
    return(NULL)
  }

  if (!is.null(data$result)) {
    return(data$result)
  } else {
    warning("The response does not contain 'result'.")
    return(NULL)
  }

}

#' etherscan_gas_oracle
#'
#' @param api_key your Etherscan API key
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns current safe, proposed and fast gas prices as determined by
#' Etherscan.
#' @export
#'
#' @examples
#' \dontrun{
#' api_key <- "..."
#' gas_oracle <- etherscan_gas_oracle(api_key)}

etherscan_gas_oracle <- function(api_key, timeout_seconds = 60){
  query_string <- list(
    module = 'gastracker',
    action = 'gasoracle',
    apikey = api_key
  )

  data <- etherscan_api_call('GET', query_string, timeout_seconds)

  if (is.null(data)) {
    warning("Failed to retrieve data from Etherscan API.")
    return(NULL)
  }

  if (!is.null(data$result)) {
    return(data$result)
  } else {
    warning("The response does not contain 'result'.")
    return(NULL)
  }

}
