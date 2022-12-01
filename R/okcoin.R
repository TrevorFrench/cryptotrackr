# okcoin_api_call is only 'GET' right now
# instrument_id <- 'BTC-USDT'
# state <- '2'
# NEED PAGINATION
# Maybe change api call to authenticated api call
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'
#   Document Functions:        'devtools::document()'

#-------------------------------------------------------------------------------
#-----------------------------------OKCOIN TRADES-------------------------------
#-------------------------------------------------------------------------------
#' okcoin_trading_pairs
#'
#' @return returns a dataframe containing information about all trading pairs on Okcoin
#' @export
#'
#' @examples
#' \dontrun{
#' trading_pairs <- okcoin_trading_pairs()}

okcoin_trading_pairs <- function() {
  res = httr::GET("https://www.okcoin.com/api/spot/v3/instruments")
  data = jsonlite::fromJSON(rawToChar(res$content))
  return(data)
}

#-------------------------------------------------------------------------------
#-----------------------------------OKCOIN ORDERS-------------------------------
#-------------------------------------------------------------------------------
#' okcoin_orders
#'
#' @param secret your secret key for Okcoin
#' @param key your API key for Okcoin
#' @param passphrase the passphrase which you created when generating your Okcoin API key
#' @param instrument_id the trading pair symbol
#' @param state Order Status: -1: Canceled, 0: Open, 1: Partially Filled, 2: Fully Filled, 3: Submitting, 4: Canceling, 6: Incomplete (open + partially filled), 7: Complete (canceled + fully filled)
#'
#' @return returns a dataframe containing your orders from the most recent 3 months
#' @export
#'
#' @examples
#' \dontrun{
#' secret <- "..."
#' key <- "..."
#' passphrase <- "..."
#' instrument_id <- "BTC-USDT"
#' state <- '2'
#' orders <- okcoin_orders(secret, key, passphrase, instrument_id, state)}

okcoin_orders <- function(secret, key, passphrase, instrument_id, state) {
  path <- paste('/api/spot/v3/orders?instrument_id=', instrument_id, '&state=', state, sep = '')
  url <- paste('https://www.okcoin.com', path, sep = '')
  formatted_time <- okcoin_time()
  signature <- okcoin_signature(path, secret, formatted_time, 'GET')
  data <- okcoin_api_call(url, key, signature, formatted_time, passphrase)
  return(data)
}

#-------------------------------------------------------------------------------
#-----------------------------OKCOIN SPOT ACCOUNT INFO--------------------------
#-------------------------------------------------------------------------------
#' okcoin_spot_account_info
#'
#' @param secret your secret key for Okcoin
#' @param key your API key for Okcoin
#' @param passphrase the passphrase which you created when generating your Okcoin API key
#'
#' @return returns a dataframe containing your spot account balances
#' @export
#'
#' @examples
#' \dontrun{
#' secret <- "..."
#' key <- "..."
#' passphrase <- "..."
#' balances <- okcoin_spot_account_info(secret, key, passphrase)}

okcoin_spot_account_info <- function(secret, key, passphrase) {
  path <- paste('/api/spot/v3/accounts', sep = '')
  url <- paste('https://www.okcoin.com', path, sep = '')
  formatted_time <- okcoin_time()
  signature <- okcoin_signature(path, secret, formatted_time, 'GET')
  data <- okcoin_api_call(url, key, signature, formatted_time, passphrase)
  return(data)
}

#-------------------------------------------------------------------------------
#------------------------------------OKCOIN TIME--------------------------------
#-------------------------------------------------------------------------------
#' okcoin_time
#'
#' @return returns a string with the current timestamp in ISO 8601 format
#' @export
#'
#' @examples
#' \dontrun{
#' formatted_time <- okcoin_time()}

okcoin_time <- function() {
  op <- options(digits.secs=3)
  tm <- as.POSIXlt(Sys.time(), "UTC")
  formatted_time <- strftime(tm , "%Y-%m-%dT%H:%M:%OSZ")
  return(formatted_time)
}

#-------------------------------------------------------------------------------
#----------------------------------OKCOIN SIGNATURE-----------------------------
#-------------------------------------------------------------------------------
#' okcoin_signature
#'
#' @param path the API endpoint
#' @param secret your Okcoin secret key
#' @param formatted_time a string containing the currrent timestamp in ISO 8601 format
#' @param method 'POST' or 'GET'
#'
#' @return returns a base64 encoded SHA256 signature for signing Okcoin API calls
#' @export
#'
#' @examples
#' \dontrun{
#' signature <- okcoin_signature()}

okcoin_signature <- function(path, secret, formatted_time, method) {
  signature <- paste(formatted_time, method, path, sep = '')
  sig <- charToRaw(signature)
  signature_hashed <- openssl::sha256(sig, key = secret)
  signature_encoded <- jsonlite::base64_enc(signature_hashed)
  return(signature_encoded)
}

#-------------------------------------------------------------------------------
#----------------------------------OKCOIN API CALL------------------------------
#-------------------------------------------------------------------------------
#' okcoin_api_call
#'
#' @param url the full URL for the API call
#' @param key your API key for Okcoin
#' @param signature your hashed and encoded signature for Okcoin API calls
#' @param formatted_time a string containing the currrent timestamp in ISO 8601 format
#' @param passphrase the passphrase which you created when generating your Okcoin API key
#'
#' @return returns a dataframe containing the results of your API call
#' @export
#'
#' @examples
#' \dontrun{
#' data <- okcoin_api_call()}

okcoin_api_call <- function(url, key, signature, formatted_time, passphrase) {
  res = httr::GET(url,
              httr::add_headers('Content-Type' = 'application/json'
                          , 'OK-ACCESS-KEY' = key
                          , 'OK-ACCESS-SIGN' = signature
                          , 'OK-ACCESS-TIMESTAMP' = formatted_time
                          , 'OK-ACCESS-PASSPHRASE' = passphrase
              ))
  data = jsonlite::fromJSON(rawToChar(res$content))
  return(data)
}
