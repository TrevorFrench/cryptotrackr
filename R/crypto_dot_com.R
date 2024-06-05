#' crypto_dot_com_instruments
#'
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns a dataframe with information about instruments available on
#' Crypto.com
#' @export
#'
#' @examples
#' crypto_dot_com_instruments()

crypto_dot_com_instruments <- function(timeout_seconds = 60) {
  tryCatch({
    res <- httr::GET('https://api.crypto.com/v2/public/get-instruments'
                     , httr::timeout(timeout_seconds))

    if (res$status_code == 200) {
      data <- jsonlite::fromJSON(rawToChar(res$content))

      if (!is.null(data$result$instruments)) {
        return(data$result$instruments)
      } else {
        warning("The response does not contain 'result$instruments'.")
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

#' crypto_dot_com_get_book
#'
#' @param instrument the instrument name which you want to query
#' @param depth the depth of the order book to retrieve. The maximum and default
#' value is 50.
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns a list containing the order book for your specified
#' instrument.
#' @export
#'
#' @examples
#' crypto_dot_com_get_book("BTC_USDT")

crypto_dot_com_get_book <- function(instrument, depth = 50, timeout_seconds = 60) {
  query <- list(instrument_name = instrument, depth = depth)

  tryCatch({
    res <- httr::GET('https://api.crypto.com/v2/public/get-book'
                     , query = query
                     , httr::timeout(timeout_seconds))

    if (res$status_code == 200) {
      data <- jsonlite::fromJSON(rawToChar(res$content))

      if (!is.null(data$result)) {
        return(data$result)
      } else {
        warning("The response does not contain 'result'.")
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

#' crypto_dot_com_get_candlestick
#'
#' @param instrument the instrument name which you want to query
#' @param timeframe the timeframe which each candle represents. You can choose
#' from the following options: '1m', '5m', '15m', '30m', '1h', '4h', '6h',
#' '12h', '1D', '7D', '14D', '1M'. The defailt option is '5m'.
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns a list which contains metadata about your query along with a
#' dataframe containing your candlestick data.
#' @export
#'
#' @examples
#' crypto_dot_com_get_candlestick("BTC_USDT")

crypto_dot_com_get_candlestick <- function(instrument, timeframe = '5m', timeout_seconds = 60) {
  query <- list(instrument_name = instrument, timeframe = timeframe)
  tryCatch({
    res <- httr::GET('https://api.crypto.com/v2/public/get-candlestick'
                     , query = query
                     , httr::timeout(timeout_seconds))

    if (res$status_code == 200) {
      data <- jsonlite::fromJSON(rawToChar(res$content))

      if (!is.null(data$result)) {
        return(data$result)
      } else {
        warning("The response does not contain 'result'.")
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


#' crypto_dot_com_get_ticker
#'
#' @param instrument the instrument name which you want to query
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns ticker data for specified instrument. Refer to Crypto.com for
#' help interpreting response data:
#' https://exchange-docs.crypto.com/spot/index.html#public-get-ticker
#' @export
#'
#' @examples
#' crypto_dot_com_get_ticker("BTC_USDT")

crypto_dot_com_get_ticker <- function(instrument, timeout_seconds = 60) {
  query <- list(instrument_name = instrument)

  tryCatch({
    res <- httr::GET('https://api.crypto.com/v2/public/get-ticker'
                     , query = query
                     , httr::timeout(timeout_seconds))

    if (res$status_code == 200) {
      data <- jsonlite::fromJSON(rawToChar(res$content))

      if (!is.null(data$result$data)) {
        return(data$result$data)
      } else {
        warning("The response does not contain 'result$data'.")
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

#' crypto_dot_com_get_trades
#'
#' @param instrument the instrument name which you want to query
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns trade data for specified instrument. Refer to Crypto.com for
#' help interpreting response data:
#' https://exchange-docs.crypto.com/spot/index.html#public-get-trades
#' @export
#'
#' @examples
#' crypto_dot_com_get_trades("BTC_USDT")

crypto_dot_com_get_trades <- function(instrument, timeout_seconds = 60) {
  query <- list(instrument_name = instrument)

  tryCatch({
    res <- httr::GET('https://api.crypto.com/v2/public/get-trades'
                     , query = query
                     , httr::timeout(timeout_seconds))

    if (res$status_code == 200) {
      data <- jsonlite::fromJSON(rawToChar(res$content))

      if (!is.null(data$result$data)) {
        return(data$result$data)
      } else {
        warning("The response does not contain 'result$data'.")
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
