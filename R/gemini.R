#' gemini_api_call
#'
#' @param key your API key for Gemini
#' @param secret your secret key for Gemini
#' @param path your API endpoint
#' @param method "GET" or "POST"
#' @param timeout_seconds seconds until the query times out. Default is 60.
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

gemini_api_call <- function(key, secret, path, method, timeout_seconds = 60) {
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

  tryCatch({
    res <- httr::VERB(method
                      , url
                      , httr::add_headers('Content-Type' = 'text/plain'
                                          , 'Content-Length' = '0'
                                          , 'X-GEMINI-SIGNATURE' = signature
                                          , 'X-GEMINI-APIKEY' = key
                                          , 'X-GEMINI-PAYLOAD' = payload
                                          , 'Cache-Control' = 'no-cache'
                      )
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

#' gemini_trades
#'
#' @param key your API key for Gemini
#' @param secret your secret key for Gemini
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns a dataframe containing all of your historical trades.
#' @export
#'
#' @examples
#' \dontrun{
#' key <- "..."
#' secret <- "..."
#' df <- gemini_trades(key, secret)}

gemini_trades <- function(key, secret, timeout_seconds = 60) {
  path <- "/v1/mytrades"
  method <- "POST"
  data <- gemini_api_call(key, secret, path, method, timeout_seconds)

  if (is.null(data)) {
    warning("Failed to retrieve data from Binance US API.")
    return(NULL)
  } else {
    return(data)
  }

}

#' gemini_symbols
#'
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns a vector containing all symbols available on Gemini
#' @export
#'
#' @examples
#' gemini_symbols(4.5)

gemini_symbols <- function(timeout_seconds = 60) {
  tryCatch({
    res <- httr::GET("https://api.gemini.com/v1/symbols", httr::timeout(timeout_seconds))

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

#' gemini_price_feed
#'
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns a dataframe containing pairs, their current price, and their
#' 24 hour change in price
#' @export
#'
#' @examples
#' gemini_price_feed(4.5)

gemini_price_feed <- function(timeout_seconds = 60) {
  tryCatch({
    res <- httr::GET("https://api.gemini.com/v1/pricefeed", httr::timeout(timeout_seconds))

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
