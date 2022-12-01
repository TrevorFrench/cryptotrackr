# NEED PAGINATION
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
#-----------------------------------GEMINI TRADES-------------------------------
#-------------------------------------------------------------------------------
#' gemini_trades
#'
#' @param secret your secret key for Gemini
#' @param key your API key for Gemini
#'
#' @return returns a dataframe containing all of your historical trades.
#' @export
#'
#' @examples
#' \dontrun{
#' secret <- "..."
#' key <- "..."
#' df <- gemini_trades(secret, key)}

gemini_trades <- function(secret, key) {
  url <- "https://api.gemini.com/v1/mytrades"
  gemini_api_key <- key
  gemini_api_secret <- stringi::stri_enc_toutf8(secret)
  payload_nonce <- as.numeric(as.POSIXct(Sys.time()))
  payload <- paste('{"request":"/v1/mytrades", "nonce":', payload_nonce, '}'
                   , sep = '')
  encoded_payload <- stringi::stri_enc_toutf8(payload)
  b64 <- jsonlite::base64_enc(encoded_payload)
  signature <- openssl::sha384(b64, key = gemini_api_secret)
  #just reference url var
  res = httr::POST("https://api.gemini.com/v1/mytrades",
             httr::add_headers('Content-Type' = 'text/plain'
               , 'Content-Length' = '0'
               , 'X-GEMINI-SIGNATURE' = signature
               , 'X-GEMINI-APIKEY' = gemini_api_key
               , 'X-GEMINI-PAYLOAD' = b64
               , 'Cache-Control' = 'no-cache'
             ))
  data = jsonlite::fromJSON(rawToChar(res$content))
  return(data)
}

#-------------------------------------------------------------------------------
#-----------------------------------GEMINI SYMBOLS-------------------------------
#-------------------------------------------------------------------------------
#' gemini_symbols
#'
#' @return returns a vector containing all symbols available on Gemini
#' @export
#'
#' @examples
#' \dontrun{
#' symbols <- gemini_symbols()}

gemini_symbols <- function() {
  res = httr::GET("https://api.gemini.com/v1/symbols")
  data = jsonlite::fromJSON(rawToChar(res$content))
  return(data)
}

#-------------------------------------------------------------------------------
#---------------------------------GEMINI PRICE FEED-----------------------------
#-------------------------------------------------------------------------------
#' gemini_price_feed
#'
#' @return returns a dataframe containing pairs, their current price, and their
#' 24 hour change in price
#' @export
#'
#' @examples
#' \dontrun{
#' prices <- gemini_price_feed()}

gemini_price_feed <- function() {
  res = httr::GET("https://api.gemini.com/v1/pricefeed")
  data = jsonlite::fromJSON(rawToChar(res$content))
  return(data)
}
