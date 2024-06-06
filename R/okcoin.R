#' okcoin_trading_pairs
#'
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns a dataframe containing information about all trading pairs on
#' Okcoin
#' @export
#'
#' @examples
#' okcoin_trading_pairs()

okcoin_trading_pairs <- function(timeout_seconds = 60) {
  tryCatch({
    res <- httr::GET("https://www.okcoin.com/api/v5/public/instruments?instType=SPOT"
                     , httr::timeout(timeout_seconds))

    if (res$status_code == 200) {
      data <- jsonlite::fromJSON(rawToChar(res$content))
      if (!is.null(data$data)) {
        return(data$data)
      } else {
        warning("The response does not contain 'data'.")
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

#' okcoin_orders
#'
#' @param secret your secret key for Okcoin
#' @param key your API key for Okcoin
#' @param passphrase the passphrase which you created when generating your
#' Okcoin API key
#' @param instrument_id the trading pair symbol
#' @param state Order Status: -1: Canceled, 0: Open, 1: Partially Filled,
#' 2: Fully Filled, 3: Submitting, 4: Canceling, 6: Incomplete (open + partially
#' filled), 7: Complete (canceled + fully filled)
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns a dataframe containing your orders from the most recent 3
#' months
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

okcoin_orders <- function(secret, key, passphrase, instrument_id, state, timeout_seconds = 60) {
  path <- paste('/api/spot/v3/orders?instrument_id=', instrument_id, '&state=', state, sep = '')
  url <- paste('https://www.okcoin.com', path, sep = '')
  formatted_time <- okcoin_time()
  signature <- okcoin_signature(path, secret, formatted_time, 'GET')
  data <- okcoin_api_call(url, key, signature, formatted_time, passphrase, timeout_seconds)

  if (is.null(data)) {
    warning("Failed to retrieve data from Amberdata API.")
    return(NULL)
  }

  return(data)
}

#' okcoin_spot_account_info
#'
#' @param secret your secret key for Okcoin
#' @param key your API key for Okcoin
#' @param passphrase the passphrase which you created when generating your
#' Okcoin API key
#' @param timeout_seconds seconds until the query times out. Default is 60.
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

okcoin_spot_account_info <- function(secret, key, passphrase, timeout_seconds = 60) {
  path <- paste('/api/spot/v3/accounts', sep = '')
  url <- paste('https://www.okcoin.com', path, sep = '')
  formatted_time <- okcoin_time()
  signature <- okcoin_signature(path, secret, formatted_time, 'GET')
  data <- okcoin_api_call(url, key, signature, formatted_time, passphrase, timeout_seconds)

  if (is.null(data)) {
    warning("Failed to retrieve data from Amberdata API.")
    return(NULL)
  }

  return(data)
}

#' okcoin_time
#'
#' @return returns a string with the current timestamp in ISO 8601 format
#' @export
#'
#' @examples
#' okcoin_time()

okcoin_time <- function() {
  old <- options()
  on.exit(options(old))
  op <- options(digits.secs=3)
  tm <- as.POSIXlt(Sys.time(), "UTC")
  formatted_time <- strftime(tm , "%Y-%m-%dT%H:%M:%OSZ")
  return(formatted_time)
}

#' okcoin_signature
#'
#' @param path the API endpoint
#' @param secret your Okcoin secret key
#' @param formatted_time a string containing the currrent timestamp in ISO 8601
#' format
#' @param method 'POST' or 'GET'
#'
#' @return returns a base64 encoded SHA256 signature for signing Okcoin API
#' calls
#' @export
#'
#' @examples
#' \dontrun{
#' path <- "..."
#' secret <- "..."
#' formatted_time <- okcoin_time()
#' method <- "GET"
#' signature <- okcoin_signature(path, secret, formatted_time, method)}

okcoin_signature <- function(path, secret, formatted_time, method) {
  signature <- paste(formatted_time, method, path, sep = '')
  sig <- charToRaw(signature)
  signature_hashed <- openssl::sha256(sig, key = secret)
  signature_encoded <- jsonlite::base64_enc(signature_hashed)
  return(signature_encoded)
}

#' okcoin_api_call
#'
#' @param url the full URL for the API call
#' @param key your API key for Okcoin
#' @param signature your hashed and encoded signature for Okcoin API calls
#' @param formatted_time a string containing the currrent timestamp in ISO 8601
#' format
#' @param passphrase the passphrase which you created when generating your
#' Okcoin API key
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns a dataframe containing the results of your API call
#' @export
#'
#' @examples
#' \dontrun{
#' url <- "..."
#' key <- "..."
#' path <- "..."
#' secret <- "..."
#' formatted_time <- okcoin_time()
#' method <- "GET"
#' signature <- okcoin_signature(path, secret, formatted_time, method)
#' passphrase <- "..."
#' data <- okcoin_api_call()}

okcoin_api_call <- function(url, key, signature, formatted_time, passphrase, timeout_seconds = 60) {
  tryCatch({
    res <- httr::GET(url,
                     httr::add_headers('Content-Type' = 'application/json'
                                       , 'OK-ACCESS-KEY' = key
                                       , 'OK-ACCESS-SIGN' = signature
                                       , 'OK-ACCESS-TIMESTAMP' = formatted_time
                                       , 'OK-ACCESS-PASSPHRASE' = passphrase
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
