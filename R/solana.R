#' solana_api_call
#'
#' @param url the RPC url for your API call
#' @param request_body the request body for your API call
#'
#' @return returns data from your solana API call
#' @export
#'
#' @examples
#' \dontrun{
#' url <- "https://api.devnet.solana.com"
#' data <- solana_api_call(url)}

solana_api_call <- function(url, request_body) {
  headers <- c("Content-Type" = "application/json")
  response <- httr::POST(url, httr::add_headers(.headers = headers), body = request_body)

  if (httr::status_code(response) == 200) {
    return(httr::content(response))
  } else {
    print(httr::content(response, as = "text"))
    stop("Request failed with status code: ", httr::status_code(response))
  }
}

#' assemble_key_pair
#'
#' @param key the key for your key pair
#' @param pair the pair for your key pair
#'
#' @return Returns your key pair if it exists or a blank string if it doesn't
#' exist
#' @export
#'
#' @examples
#' \dontrun{
#' limit <- NULL
#' limit <- assemble_key_pair('limit', limit)}

assemble_key_pair <- function(key, pair) {
  if(is.null(pair)){
    keypair = ''
  } else {
    keypair = paste('"',key,'":',pair, sep = '')
  }
  return(keypair)
}

#' assemble_config_object
#'
#' @param character_vector the character vector used to create the config object
#' @return Returns your config object
#' @export
#'
#' @examples
#' \dontrun{
#' limit <- NULL
#' limit <- assemble_key_pair('limit', limit)}

assemble_list <- function(character_vector) {
  character_vector <- character_vector[character_vector != '']
  character_vector <- paste(character_vector, collapse = ',')
  return(character_vector)
}

#' assemble_request_body
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
#' \dontrun{
#' limit <- assemble_key_pair('limit', limit)
#' params <- paste('["',address,'", {',limit,'}]', sep = '')
#' request_body <- assemble_request_body('2.0', 'null', 'getSignaturesForAddress', params)}

assemble_request_body <- function(jsonrpc, id, method, params) {
  jsonrpc <- assemble_key_pair('jsonrpc', jsonrpc)
  id <- assemble_key_pair('id', id)
  method <- assemble_key_pair('method', method)
  params <- assemble_key_pair('params', params)
  character_vector <- c(jsonrpc, id, method, params)
  body <- assemble_list(character_vector)
  request_body <- paste('{',body,'}', sep = '')
  return(request_body)
}

#' get_signature_for_address
#'
#' @param url the RPC url for your API call
#' @param address the address for which you're retrieving signatures
#' @param limit maximum transaction signatures to return (between 1 and 1,000).
#' Default is 1,000.
#'
#' @return Returns signatures for confirmed transactions that include the given
#' address in their accountKeys list. Returns signatures backwards in time from
#' the provided signature or most recent confirmed block
#' @export
#'
#' @examples
#' \dontrun{
#' url <- "https://api.devnet.solana.com"
#' data <- get_signature_for_address(url)}

get_signature_for_address <- function(url, address, limit = NULL) {
  limit <- assemble_key_pair('limit', limit)
  character_vector <- c(limit)
  config_object <- assemble_list(character_vector)
  params <- paste('["',address,'", {',config_object,'}]', sep = '')
  request_body <- assemble_request_body('"2.0"', 'null', '"getSignaturesForAddress"', params)
  solana_api_call(url, request_body)
}

#' get_account_info
#'
#' @param url the RPC url for your API call
#' @param address the address for which you're retrieving account info
#'
#' @return Returns all information associated with the account of provided Pubkey
#' @export
#'
#' @examples
#' \dontrun{
#' url <- "https://api.devnet.solana.com"
#' address <- "72tXz6jhGVPFE8ZfAQocJPJU3HgxsdrRqKZoUdWUhs7o"
#' data <- get_account_info(url, address)}

get_account_info <- function(url, address) {
  params <- paste('["',address,'"]', sep = '')
  request_body <- assemble_request_body('"2.0"', 'null', '"getAccountInfo"', params)
  solana_api_call(url, request_body)
}

#' get_block_height
#'
#' @param url the RPC url for your API call
#'
#' @return Returns the current block height of the node
#' @export
#'
#' @examples
#' \dontrun{
#' url <- "https://api.devnet.solana.com"
#' data <- get_block_height(url)}

get_block_height <- function(url, address) {
  request_body <- assemble_request_body('"2.0"', 'null', '"getBlockHeight"', NULL)
  solana_api_call(url, request_body)
}

#' get_health
#'
#' @param url the RPC url for your API call
#'
#' @return Returns the current health of the node.
#' @export
#'
#' @examples
#' \dontrun{
#' url <- "https://api.devnet.solana.com"
#' data <- get_health(url)}

get_health <- function(url, address) {
  request_body <- assemble_request_body('"2.0"', 'null', '"getHealth"', NULL)
  solana_api_call(url, request_body)
}

#' get_version
#'
#' @param url the RPC url for your API call
#'
#' @return Returns the current Solana version running on the node
#' @export
#'
#' @examples
#' \dontrun{
#' url <- "https://api.devnet.solana.com"
#' data <- get_version(url)}

get_version <- function(url, address) {
  request_body <- assemble_request_body('"2.0"', 'null', '"getVersion"', NULL)
  solana_api_call(url, request_body)
}

#' get_supply
#'
#' @param url the RPC url for your API call
#'
#' @return Returns information about the current supply.
#' @export
#'
#' @examples
#' \dontrun{
#' url <- "https://api.devnet.solana.com"
#' data <- get_supply(url)}

get_supply <- function(url, address) {
  request_body <- assemble_request_body('"2.0"', 'null', '"getSupply"', NULL)
  solana_api_call(url, request_body)
}

#' get_identity
#'
#' @param url the RPC url for your API call
#'
#' @return Returns the identity pubkey for the current node
#' @export
#'
#' @examples
#' \dontrun{
#' url <- "https://api.devnet.solana.com"
#' data <- get_identity(url)}

get_identity <- function(url, address) {
  request_body <- assemble_request_body('"2.0"', 'null', '"getIdentity"', NULL)
  solana_api_call(url, request_body)
}

#' get_inflation_rate
#'
#' @param url the RPC url for your API call
#'
#' @return Returns the specific inflation values for the current epoch
#' @export
#'
#' @examples
#' \dontrun{
#' url <- "https://api.devnet.solana.com"
#' data <- get_inflation_rate(url)}

get_inflation_rate <- function(url, address) {
  request_body <- assemble_request_body('"2.0"', 'null', '"getInflationRate"', NULL)
  solana_api_call(url, request_body)
}

#' get_genesis_hash
#'
#' @param url the RPC url for your API call
#'
#' @return Returns the genesis hash
#' @export
#'
#' @examples
#' \dontrun{
#' url <- "https://api.devnet.solana.com"
#' data <- get_genesis_hash(url)}

get_genesis_hash <- function(url, address) {
  request_body <- assemble_request_body('"2.0"', 'null', '"getGenesisHash"', NULL)
  solana_api_call(url, request_body)
}
