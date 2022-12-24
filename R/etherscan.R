#-------------------------------------------------------------------------------
#------------------------------------ACTION LIST--------------------------------
#-------------------------------------------------------------------------------
# -

#-------------------------------------------------------------------------------
#--------------------------------ETHERSCAN API CALL-----------------------------
#-------------------------------------------------------------------------------
#' etherscan_api_call
#'
#' @param method "GET" or "POST"
#' @param query your query parameters
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

etherscan_api_call <- function(method, query){
  res <- httr::VERB(method
                    , 'https://api.etherscan.io/api'
                    , query = query
                    )
  data <- jsonlite::fromJSON(rawToChar(res$content))
  return(data)
}

#-------------------------------------------------------------------------------
#----------------------------ETHERSCAN ACCOUNT BALANCE--------------------------
#-------------------------------------------------------------------------------
#' etherscan_account_balance
#'
#' @param address the address you wish to retrieve the balance for
#' @param api_key your Etherscan API key
#' @param tag pre-defined block parameter, either earliest, pending or latest. Default is latest.
#'
#' @return returns the balance for the specified address
#' @export
#'
#' @examples
#' \dontrun{
#' address <- "0xde0b295669a9fd93d5f28d9ec85e40f4cb697bae"
#' api_key <- "..."
#' account_balance <- etherscan_account_balance(address, api_key)}

etherscan_account_balance <- function(address, api_key, tag = 'latest'){
  query_string <- list(
    module = 'account',
    action = 'balance',
    address = address,
    tag = tag,
    apikey = api_key
  )

  data <- etherscan_api_call('GET', query_string)
  return(data$result)
}
