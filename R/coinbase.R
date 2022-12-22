#-------------------------------------------------------------------------------
#------------------------------------ACTION LIST--------------------------------
#-------------------------------------------------------------------------------
# -

#-------------------------------------------------------------------------------
#---------------------------COINBASE ALL KNOWN CURRENCIES-----------------------
#-------------------------------------------------------------------------------
#' coinbase_all_currencies
#'
#' @return returns a dataframe with information about all currencies known to Coinbase
#' @export
#'
#' @examples
#' \dontrun{
#' currencies <- coinbase_all_currencies()}

coinbase_all_currencies <- function() {
  res = httr::GET('https://api.exchange.coinbase.com/currencies',
                  httr::add_headers('Content-Type' = 'application/octet-stream'
                                    , 'accept' = 'application/json'
                  ))
  data = jsonlite::fromJSON(rawToChar(res$content))
  return(data)
}

#-------------------------------------------------------------------------------
#------------------------------COINBASE SINGLE CURRENCY-------------------------
#-------------------------------------------------------------------------------
#' coinbase_single_currency
#'
#' @param currency the currency id for the relevant asset
#'
#' @return returns a list with details related to the specified currency
#' @export
#'
#' @examples
#' \dontrun{
#' currency <- 'btc'
#' currency_data <- coinbase_single_currency(currency)}

coinbase_single_currency <- function(currency) {
  res = httr::GET(paste('https://api.exchange.coinbase.com/currencies/', toupper(currency), sep = ''),
                  httr::add_headers('Content-Type' = 'application/octet-stream'
                                    , 'accept' = 'application/json'
                  ))
  data = jsonlite::fromJSON(rawToChar(res$content))
  return(data)
}

#-------------------------------------------------------------------------------
#------------------------------------COINBASE TIME------------------------------
#-------------------------------------------------------------------------------
#' coinbase_time
#'
#' @return returns a timestamp for use in your Coinbase API calls
#' @export
#'
#' @examples
#' \dontrun{
#' coinbase_time <- coinbase_time()}

coinbase_time <- function() {
  op <- options(digits.secs=0)
  tm <- as.POSIXlt(Sys.time(), "UTC")
  formatted_time <- round(as.numeric(as.POSIXct(tm)))
  return(formatted_time)
}

#-------------------------------------------------------------------------------
#---------------------------------COINBASE SIGNATURE----------------------------
#-------------------------------------------------------------------------------
#' coinbase_signature
#'
#' @param api_secret your Coinbase API secret
#' @param coinbase_time a timestamp in the correct format according to Coinbase
#' @param method "GET" or "POST"
#' @param path the path of your API call
#' @param body the body of your API call
#'
#' @return returns a signature for use in your Coinbase API calls
#' @export
#'
#' @examples
#' \dontrun{
#' api_secret <- "..."
#' coinbase_time <- coinbase_time()
#' method <- "GET"
#' path <- "/api/v3/brokerage/accounts"
#' body <- ""
#' coinbase_signature <- coinbase_signature(api_secret, coinbase_time, method, path, body)}

coinbase_signature <- function(api_secret, coinbase_time, method, path, body) {
  api_secret <- stringi::stri_enc_toutf8(api_secret)
  message <- paste(coinbase_time, method, path, body, sep = '')
  sig <- openssl::sha256(message, key = api_secret)
  return(sig)
}

#-------------------------------------------------------------------------------
#---------------------------------COINBASE API CALL-----------------------------
#-------------------------------------------------------------------------------
#' coinbase_api_call
#'
#' @param api_key your Coinbase API key
#' @param api_secret your Coinbase API secret
#' @param method "GET" or "POST"
#' @param path the path of your API call
#' @param body the body of your API call
#'
#' @return returns the response from your Coinbase API call
#' @export
#'
#' @examples
#' \dontrun{
#' path <- "/api/v3/brokerage/accounts"
#' method <- "GET"
#' api_key <- "..."
#' api_secret <- "..."
#' body <- ""
#' data <- coinbase_api_call(api_key, api_secret, method, path, body)}

coinbase_api_call <- function(api_key, api_secret, method, path, body) {
  coinbase_time <- coinbase_time()
  sig <- coinbase_signature(api_secret, coinbase_time, method, path, body)
  url <- paste('https://api.coinbase.com', path, sep = '')
  res = httr::GET(url
                  , body = body
                  , httr::add_headers('CB-ACCESS-KEY' = api_key
                                      , 'CB-ACCESS-SIGN' = sig
                                      , 'CB-ACCESS-TIMESTAMP' = coinbase_time
                  ))
  data = jsonlite::fromJSON(rawToChar(res$content))
  return(data)
}

#-------------------------------------------------------------------------------
#---------------------------------COINBASE ACCOUNTS-----------------------------
#-------------------------------------------------------------------------------
#' coinbase_accounts
#'
#' @param api_key your Coinbase API key
#' @param api_secret your Coinbase API secret
#'
#' @return returns a dataframe with information about your Coinbase accounts
#' @export
#'
#' @examples
#' \dontrun{
#' api_key <- "..."
#' api_secret <- "..."
#' accounts <- coinbase_accounts(api_key, api_secret)}

coinbase_accounts <- function(api_key, api_secret) {
  path <- '/api/v3/brokerage/accounts'
  method <- 'GET'
  body <- ''
  data <- coinbase_api_call(api_key, api_secret, method, path, body)
  return(data$accounts)
}
