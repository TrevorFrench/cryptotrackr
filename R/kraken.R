#' kraken_server_time
#'
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns a list with Kraken's server time in unix and rfc1123 formats
#' @export
#'
#' @examples
#' kraken_server_time()

kraken_server_time <- function(timeout_seconds = 60) {
  tryCatch({
    res <- httr::GET('https://api.kraken.com/0/public/Time', httr::timeout(timeout_seconds))

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

#' kraken_server_status
#'
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns a list with Kraken's server status along with a timestamp
#' @export
#'
#' @examples
#' kraken_server_status()

kraken_server_status <- function(timeout_seconds = 60) {
  tryCatch({
    res <- httr::GET('https://api.kraken.com/0/public/SystemStatus', httr::timeout(timeout_seconds))

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

#' kraken_asset_info
#'
#' @param asset optionally provide one or more comma-separated ticker symbols.
#' @param aclass optionally provide asset categories to filter by.
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns a list containing asset information
#' @export
#'
#' @examples
#' all_asset_info <- kraken_asset_info()
#' eth_btc_info <- kraken_asset_info("ETH,BTC")
#' currency_info <- kraken_asset_info(aclass = "currency")

kraken_asset_info <- function(asset = NULL, aclass = NULL, timeout_seconds = 60) {
  query <- list(asset = asset, aclass = aclass)
  tryCatch({
    res <- httr::GET('https://api.kraken.com/0/public/Assets', query = query, httr::timeout(timeout_seconds))

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

#' kraken_asset_pairs
#'
#' @param pair optionally provide one or more comma-separated asset pairs to query.
#' @param info optionally select the information to return. You can choose from:
#' "info" (all info), "leverage" (leverage info), "fees" (fee schedule), or
#' "margin" (margin info).
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns a list containing information on Kraken asset pairs.
#' @export
#'
#' @examples
#' kraken_asset_pairs()

kraken_asset_pairs <- function(pair = NULL, info = NULL, timeout_seconds = 60) {
  query <- list(pair = pair, info = info)
  tryCatch({
    res <- httr::GET('https://api.kraken.com/0/public/AssetPairs', query = query, httr::timeout(timeout_seconds))

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

#' kraken_ticker_info
#'
#' @param pair optionally provide one or more comma-separated asset pairs.
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns a list containing ticker info for assets on Kraken. Refer to
#' Kraken for help interpreting response data:
#' https://docs.kraken.com/rest/#tag/Market-Data/operation/getTickerInformation
#' @export
#'
#' @examples
#' kraken_ticker_info("ETHUSD")

kraken_ticker_info <- function(pair = NULL, timeout_seconds = 60) {
  query <- list(pair = pair)
  tryCatch({
    res <- httr::GET('https://api.kraken.com/0/public/Ticker', query = query, httr::timeout(timeout_seconds))

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
