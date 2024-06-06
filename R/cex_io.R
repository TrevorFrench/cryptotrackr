#' cex_io_ticker
#'
#' @param symbol_1 the first currency in your pair
#' @param symbol_2 the second currency in your pair
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns a list with basic trading information about your specified
#' currency pair for the last 24 hours.
#' @export
#'
#' @examples
#' symbol_1 <- 'btc'
#' symbol_2 <- 'usd'
#' cex_io_ticker(symbol_1, symbol_2, 4.5)

cex_io_ticker <- function(symbol_1, symbol_2, timeout_seconds = 60) {
  tryCatch({
    res <- httr::GET(paste('https://cex.io/api/ticker/', toupper(symbol_1), '/',
                           toupper(symbol_2), sep = '')
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

#' cex_io_currency_limits
#'
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns a dataframe with information about currency limits on CEX.io.
#' @export
#'
#' @examples
#' cex_io_currency_limits(4.5)

cex_io_currency_limits <- function(timeout_seconds = 60) {
  tryCatch({
    res <- httr::GET('https://cex.io/api/currency_limits'
                     , httr::timeout(timeout_seconds))

    if (res$status_code == 200) {
      data <- jsonlite::fromJSON(rawToChar(res$content))

      if (!is.null(data$data$pairs)) {
        return(data$data$pairs)
      } else {
        warning("The response does not contain 'data$pairs'.")
        return(NULL)
      }

    } else {
      stop(paste("API call failed with status code", res$status_code))
    }

  }, error = function(e) {
    message <- paste("Error during API call:", e$message)
    warning(message)
    return(NULL)
  })
}

#' cex_io_last_price
#'
#' @param symbol_1 the first currency in your pair
#' @param symbol_2 the second currency in your pair
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns a list with the last price of your specified currency pair.
#' @export
#'
#' @examples
#' symbol_1 <- 'btc'
#' symbol_2 <- 'usd'
#' cex_io_last_price(symbol_1, symbol_2, 4.5)

cex_io_last_price <- function(symbol_1, symbol_2, timeout_seconds = 60) {
  tryCatch({
    res <- httr::GET(paste('https://cex.io/api/last_price/', toupper(symbol_1),
                           '/', toupper(symbol_2), sep = '')
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

#' cex_io_converter
#'
#' @param symbol_1 the first currency in your pair
#' @param symbol_2 the second currency in your pair
#' @param amount the currency amount to convert denominated in symbol_1
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns the converted amount denominated in symbol_2
#' @export
#'
#' @examples
#' symbol_1 <- 'btc'
#' symbol_2 <- 'usd'
#' amount <- '2.5'
#' cex_io_converter(symbol_1, symbol_2, amount, 4.5)

cex_io_converter <- function(symbol_1, symbol_2, amount, timeout_seconds = 60) {
  tryCatch({
    res <- httr::POST(paste('https://cex.io/api/convert/', toupper(symbol_1), '/',
                            toupper(symbol_2), sep = '')
                      , body = paste('{"amnt": "', amount, '"}', sep = '')
                      , httr::add_headers('Content-Type' = 'application/json'
                                          , 'Accept' = '*/*'
                      )
                      , httr::timeout(timeout_seconds))
    if (res$status_code == 200) {
      data <- jsonlite::fromJSON(rawToChar(res$content))

      if (!is.null(data$amnt)) {
        return(data$amnt)
      } else {
        warning("The response does not contain 'amnt'.")
        return(NULL)
      }

    } else {
      stop(paste("API call failed with status code", res$status_code))
    }

  }, error = function(e) {
    message <- paste("Error during API call:", e$message)
    warning(message)
    return(NULL)
  })
}

#' cex_io_ohlcv
#'
#' @param date the date for which to retrieve data
#' @param symbol_1 the first currency in your pair
#' @param symbol_2 the second currency in your pair
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns a list containing open, high, low, close, volume data for the
#' past minute, hour, and day
#' @export
#'
#' @examples
#' date <- '20220927'
#' symbol_1 <- 'btc'
#' symbol_2 <- 'usd'
#' cex_io_ohlcv(date, symbol_1, symbol_2, 4.5)

cex_io_ohlcv <- function(date, symbol_1, symbol_2, timeout_seconds = 60) {
  tryCatch({
    res <- httr::GET(paste('https://cex.io/api/ohlcv/hd/',
                           date, '/', toupper(symbol_1), '/',
                           toupper(symbol_2), sep = '')
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

#' cex_io_nonce
#'
#' @return returns a nonce for use in your signature
#' @export
#'
#' @examples
#' cex_io_nonce()

cex_io_nonce <- function() {
  old <- options()
  on.exit(options(old))
  op <- options(digits.secs=0)
  tm <- as.POSIXlt(Sys.time(), "UTC")
  formatted_time <- round(as.numeric(as.POSIXct(tm)))
  return(formatted_time)
}

#' cex_io_signature
#'
#' @param username your cex.io username
#' @param api_key your cex.io api_key
#' @param api_secret your cex.io api_secret
#' @param nonce a nonce to use in your signature and request body
#'
#' @return returns a signature for use in your API call
#' @export
#'
#' @examples
#' \dontrun{
#' nonce <- cex_io_nonce()
#' username <- "..."
#' api_key <- "..."
#' api_secret <- "..."
#' sig <- cex_io_signature(username, api_key, api_secret, nonce)}

cex_io_signature <- function(username, api_key, api_secret, nonce) {
  api_key <- stringi::stri_enc_toutf8(api_key)
  api_secret <- stringi::stri_enc_toutf8(api_secret)
  message <- paste(nonce, username, api_key, sep = '')
  sig <- openssl::sha256(message, key = api_secret)
  return(sig)
}

#' cex_io_balance
#'
#' @param username your cex.io username
#' @param api_key your cex.io api_key
#' @param api_secret your cex.io api_secret
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns a list with your balances for each currency
#' @export
#'
#' @examples
#' \dontrun{
#' username <- "..."
#' api_key <- "..."
#' api_secret <- "..."
#' balances <- cex_io_balance(username, api_key, api_secret, 4.5)}

cex_io_balance <- function(username, api_key, api_secret, timeout_seconds = 60) {
  nonce <- cex_io_nonce()
  sig <- cex_io_signature(username, api_key, api_secret, nonce)
  request_body <- paste('{"key": "', api_key
                        , '", "signature": "', sig
                        , '", "nonce": "', nonce, '"}'
                        , sep = '')

  tryCatch({
    res <- httr::POST('https://cex.io/api/balance/'
                      , httr::add_headers('Content-Type' = 'application/json'
                                          , 'Accept' = '*/*')
                      , httr::timeout(timeout_seconds)
                      , body = request_body)
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

