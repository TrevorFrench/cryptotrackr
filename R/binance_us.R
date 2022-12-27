#-------------------------------------------------------------------------------
#------------------------------------ACTION LIST--------------------------------
#-------------------------------------------------------------------------------
# -

#-------------------------------------------------------------------------------
#-----------------------------BINANCE.US RECENT TRADES--------------------------
#-------------------------------------------------------------------------------
#' binance_us_recent_trades
#'
#' @param symbol the trading pair for which you wish to retrieve data.
#' @param limit the number of results to return. The maximum is 1,000.
#'
#' @return returns a dataframe containing the most recent trades executed for
#' the designated currency pair on Binance US
#' @export
#'
#' @examples
#' \dontrun{
#' symbol <- 'LTCBTC'
#' limit <- '1000'
#' recent_trades <- binance_us_recent_trades(symbol, limit)}

binance_us_recent_trades <- function(symbol, limit) {
  url <- paste('https://api.binance.us/api/v3/trades'
               , '?symbol=', symbol
               , '&limit=', limit
               , sep = '')
  res = httr::GET(url)
  data = jsonlite::fromJSON(rawToChar(res$content))
  return(data)
}

#-------------------------------------------------------------------------------
#------------------------BINANCE.US USER ACCOUNT INFORMATION--------------------
#-------------------------------------------------------------------------------
#' binance_us_account_info
#'
#' @param key your Binance.US API key
#' @param secret your Binance.US secret key
#'
#' @return returns a list containing information about your account
#' @export
#'
#' @examples
#' \dontrun{
#' key <- "..."
#' secret <- "..."
#' account_info <- binance_us_account_info(key, secret)}

binance_us_account_info <- function(key, secret) {
  time <- binance_us_time()
  data <- paste('timestamp=', time, sep = '')
  url <- 'https://api.binance.us/api/v3/account'
  data <- binance_us_api_call(url, key, data, secret)
  return(data)
}

#-------------------------------------------------------------------------------
#--------------------------------BINANCE.US API CALL----------------------------
#-------------------------------------------------------------------------------
#' binance_us_api_call
#'
#' @param url the base url and endpoint followed by '?' for your API call
#' @param key your Binance.US API key
#' @param data your URL encoded query parameters
#' @param secret your Binance.US secret key
#'
#' @return executes an authenticated API call
#' @export
#'
#' @examples
#' \dontrun{
#' key <- "..."
#' secret <- "..."
#' time <- binance_us_time()
#' data <- paste('timestamp=', time, sep = '')
#' url <- 'https://api.binance.us/api/v3/account'
#' data <- binance_us_api_call(url, key, data, secret)}

binance_us_api_call <- function(url, key, data, secret) {
  signature <- binance_us_signature(data, secret)
  res = httr::GET(paste(url, '?', data, '&signature=', signature,  sep = '')
                  , httr::add_headers('Content-Type' = 'application/json'
                                         , 'X-MBX-APIKEY' = key))
  data = jsonlite::fromJSON(rawToChar(res$content))
  return(data)
}

#-------------------------------------------------------------------------------
#--------------------------------BINANCE.US SIGNATURE---------------------------
#-------------------------------------------------------------------------------
#' binance_us_signature
#'
#' @param data your URL encoded query parameters
#' @param secret your Binance.US secret key
#'
#' @return returns your Binance.US signature for use in API calls
#' @export
#'
#' @examples
#' \dontrun{
#' time <- binance_us_time()
#' data <- paste('timestamp=', time, sep = '')
#' secret <- "..."
#' signature <- binance_us_signature(data, secret)}

binance_us_signature <- function(data, secret) {
  message <- stringi::stri_enc_toutf8(data)
  secret <- stringi::stri_enc_toutf8(secret)
  signature_hashed <- openssl::sha256(message, key = secret)
}

#-------------------------------------------------------------------------------
#----------------------------------BINANCE.US TIME------------------------------
#-------------------------------------------------------------------------------
#' binance_us_time
#'
#' @return returns a timestamp in the format that Binance.US expects
#' @export
#'
#' @examples
#' \dontrun{
#' time <- binance_us_time()}

binance_us_time <- function() {
  op <- options(digits.secs=3)
  tm <- as.POSIXlt(Sys.time(), "UTC")
  formatted_time <- round(as.numeric(as.POSIXct(tm)) * 1000)
  return(formatted_time)
}

#-------------------------------------------------------------------------------
#----------------------------------BINANCE.US PING------------------------------
#-------------------------------------------------------------------------------
#' binance_us_ping
#'
#' @return returns a response from the Binance.US API server
#' @export
#'
#' @examples
#' \dontrun{
#' ping <- binance_us_ping()}

binance_us_ping <- function() {
  url <- 'https://api.binance.us/api/v3/ping'
  res = httr::GET(url)
  data = jsonlite::fromJSON(rawToChar(res$content))
  return(data)
}

#-------------------------------------------------------------------------------
#-------------------------------BINANCE.US SERVER TIME--------------------------
#-------------------------------------------------------------------------------
#' binance_us_server_time
#'
#' @return returns the Binance.US server time
#' @export
#'
#' @examples
#' \dontrun{
#' server_time <- binance_us_server_time()}

binance_us_server_time <- function() {
  url <- 'https://api.binance.us/api/v3/time'
  res = httr::GET(url)
  data = jsonlite::fromJSON(rawToChar(res$content))
  return(data$serverTime)
}

#-------------------------------------------------------------------------------
#------------------------------BINANCE.US SYSTEM STATUS-------------------------
#-------------------------------------------------------------------------------
#' binance_us_system_status
#'
#' @param key your Binance.US API key
#' @param secret your Binance.US secret key
#'
#' @return returns the status of the Binance.US API. The response will either be
#' a "0" for normal or a "1" for system maintenance.
#' @export
#'
#' @examples
#' \dontrun{
#' key <- "..."
#' secret <- "..."
#' system_status <- binance_us_system_status(key, secret)}

binance_us_system_status <- function(key, secret) {
  time <- binance_us_time()
  data <- paste('timestamp=', time, sep = '')
  url <- 'https://api.binance.us/sapi/v1/system/status'
  data <- binance_us_api_call(url, key, data, secret)
  return(data$status)
}
