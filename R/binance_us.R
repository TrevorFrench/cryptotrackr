#' binance_us_recent_trades
#'
#' @param symbol the trading pair for which you wish to retrieve data.
#' @param limit the number of results to return. The maximum is 1,000.
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns a dataframe containing the most recent trades executed for
#' the designated currency pair on Binance US
#' @export
#'
#' @examples
#' symbol <- 'LTCBTC'
#' limit <- '1000'
#' binance_us_recent_trades(symbol, limit)

binance_us_recent_trades <- function(symbol, limit, timeout_seconds = 60) {
  url <- paste('https://api.binance.us/api/v3/trades'
               , '?symbol=', toupper(symbol)
               , '&limit=', limit
               , sep = '')
  tryCatch({
    res <- httr::GET(url, httr::timeout(timeout_seconds))

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

#' binance_us_account_info
#'
#' @param key your Binance.US API key
#' @param secret your Binance.US secret key
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns a list containing information about your account
#' @export
#'
#' @examples
#' \dontrun{
#' key <- "..."
#' secret <- "..."
#' account_info <- binance_us_account_info(key, secret)}

binance_us_account_info <- function(key, secret, timeout_seconds = 60) {
  time <- binance_us_time()
  data <- paste('timestamp=', time, sep = '')
  url <- 'https://api.binance.us/api/v3/account'
  data <- binance_us_api_call(url, key, data, secret, timeout_seconds)

  if (is.null(data)) {
    warning("Failed to retrieve data from Amberdata API.")
    return(NULL)
  } else {
    return(data)
  }

}

#' binance_us_api_call
#'
#' @param url the base url and endpoint followed by '?' for your API call
#' @param key your Binance.US API key
#' @param data your URL encoded query parameters
#' @param secret your Binance.US secret key
#' @param timeout_seconds seconds until the query times out. Default is 60.
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

binance_us_api_call <- function(url, key, data, secret, timeout_seconds = 60) {
  signature <- binance_us_signature(data, secret)
  tryCatch({
    res <- httr::GET(paste(url, '?', data, '&signature=', signature,  sep = '')
                    , httr::add_headers('Content-Type' = 'application/json'
                                           , 'X-MBX-APIKEY' = key)
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

#' binance_us_time
#'
#' @return returns a timestamp in the format that Binance.US expects
#' @export
#'
#' @examples
#' binance_us_time()

binance_us_time <- function() {
  old <- options()
  on.exit(options(old))
  op <- options(digits.secs=3)
  tm <- as.POSIXlt(Sys.time(), "UTC")
  formatted_time <- round(as.numeric(as.POSIXct(tm)) * 1000)
  return(formatted_time)
}

#' binance_us_ping
#'
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns a response from the Binance.US API server
#' @export
#'
#' @examples
#' binance_us_ping()

binance_us_ping <- function(timeout_seconds = 60) {
  url <- 'https://api.binance.us/api/v3/ping'

  tryCatch({
    res <- httr::GET(url, httr::timeout(timeout_seconds))

    if (res$status_code == 200) {
      return(res)
    } else {
      stop(paste("API call failed with status code", res$status_code))
    }

  }, error = function(e) {
    message <- paste("Error during API call:", e$message)
    warning(message)
    return(NULL)
  })
}

#' binance_us_server_time
#'
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns the Binance.US server time
#' @export
#'
#' @examples
#' binance_us_server_time()

binance_us_server_time <- function(timeout_seconds = 60) {
  url <- 'https://api.binance.us/api/v3/time'

  tryCatch({
    res <- httr::GET(url, httr::timeout(timeout_seconds))
    data <- jsonlite::fromJSON(rawToChar(res$content))

    if (res$status_code == 200) {

      if (!is.null(data$serverTime)) {
        return(data$serverTime)
      } else {
        warning("The response does not contain 'payload'.")
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

#' binance_us_system_status
#'
#' @param timeout_seconds seconds until the query times out. Default is 60.
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

binance_us_system_status <- function(key, secret, timeout_seconds = 60) {
  time <- binance_us_time()
  data <- paste('timestamp=', time, sep = '')
  url <- 'https://api.binance.us/sapi/v1/system/status'
  data <- binance_us_api_call(url, key, data, secret, timeout_seconds)

  if (is.null(data)) {
    warning("Failed to retrieve data from Amberdata API.")
    return(NULL)
  }

  if (!is.null(data$status)) {
    return(data$status)
  } else {
    warning("The response does not contain 'payload'.")
    return(NULL)
  }
}
