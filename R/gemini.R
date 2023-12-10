#' gemini_api_call
#'
#' @param key your API key for Gemini
#' @param secret your secret key for Gemini
#' @param path your API endpoint
#' @param method "GET" or "POST"
#'
#' @return returns data from your Gemini API call
#' @export
#'
#' @examples
#' \dontrun{
#' key <- "..."
#' secret <- "..."
#' path <- "/v1/mytrades"
#' method <- "POST"
#' data <- gemini_api_call(key, secret, path, method)}

gemini_api_call <- function(key, secret, path, method) {
  url <- paste('https://api.gemini.com', path, sep = '')
  secret <- stringi::stri_enc_toutf8(secret)
  nonce <- as.numeric(as.POSIXct(Sys.time()))
  payload <- paste('{"request":"'
                   , path
                   , '", "nonce":'
                   , nonce
                   , '}'
                   , sep = '')
  payload <- stringi::stri_enc_toutf8(payload)
  payload <- jsonlite::base64_enc(payload)
  signature <- openssl::sha384(payload, key = secret)
  res <- httr::VERB(method
                   , url
                   , httr::add_headers('Content-Type' = 'text/plain'
                                     , 'Content-Length' = '0'
                                     , 'X-GEMINI-SIGNATURE' = signature
                                     , 'X-GEMINI-APIKEY' = key
                                     , 'X-GEMINI-PAYLOAD' = payload
                                     , 'Cache-Control' = 'no-cache'
                   ))
  data <- jsonlite::fromJSON(rawToChar(res$content))
  return(data)
}

#' gemini_trades
#'
#' @param key your API key for Gemini
#' @param secret your secret key for Gemini
#'
#' @return returns a dataframe containing all of your historical trades.
#' @export
#'
#' @examples
#' \dontrun{
#' key <- "..."
#' secret <- "..."
#' df <- gemini_trades(key, secret)}

gemini_trades <- function(key, secret) {
  path <- "/v1/mytrades"
  method <- "POST"
  data <- gemini_api_call(key, secret, path, method)
  return(data)
}

#' gemini_symbols
#'
#' @return returns a vector containing all symbols available on Gemini
#' @export
#'
#' @examples
#' gemini_symbols()

gemini_symbols <- function() {
  res <- httr::GET("https://api.gemini.com/v1/symbols")
  data <- jsonlite::fromJSON(rawToChar(res$content))
  return(data)
}

#' gemini_price_feed
#'
#' @return returns a dataframe containing pairs, their current price, and their
#' 24 hour change in price
#' @export
#'
#' @examples
#' gemini_price_feed()

gemini_price_feed <- function() {
  res <- httr::GET("https://api.gemini.com/v1/pricefeed")
  data <- jsonlite::fromJSON(rawToChar(res$content))
  return(data)
}
