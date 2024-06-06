#' blockchain_dot_com_l2_order_book
#'
#' @param symbol the symbol for which to retrieve data
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns a list containing a 'bids' and an 'asks' dataframe along with
#' the specified symbol
#' @export
#'
#' @examples
#' symbol <- 'BTC-USD'
#' l2_order_book <- blockchain_dot_com_l2_order_book(symbol, 4.5)
#' l2_order_book$bids
#' l2_order_book$asks

blockchain_dot_com_l2_order_book <- function(symbol, timeout_seconds = 60) {
  tryCatch({
    res <- httr::GET(paste('https://api.blockchain.com/v3/exchange/l2/',
                           toupper(symbol), sep = '')
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

#' blockchain_dot_com_l3_order_book
#'
#' @param symbol the symbol for which to retrieve data
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns a list containing a 'bids' and an 'asks' dataframe along with
#' the specified symbol
#' @export
#'
#' @examples
#' symbol <- 'BTC-USD'
#' l3_order_book <- blockchain_dot_com_l3_order_book(symbol, 4.5)
#' l3_order_book$bids
#' l3_order_book$asks

blockchain_dot_com_l3_order_book <- function(symbol, timeout_seconds = 60) {
  tryCatch({
    res <- httr::GET(paste('https://api.blockchain.com/v3/exchange/l3/',
                           toupper(symbol), sep = '')
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

#' blockchain_dot_com_tickers
#'
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns a dataframe with price and volume data for all symbols
#' @export
#'
#' @examples
#' blockchain_dot_com_tickers(4.5)

blockchain_dot_com_tickers <- function(timeout_seconds = 60) {
  tryCatch({
    res <- httr::GET('https://api.blockchain.com/v3/exchange/tickers'
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

#' blockchain_dot_com_ticker_symbol
#'
#' @param symbol the symbol for which to retrieve data
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns a list with price and volume data for specified symbol
#' @export
#'
#' @examples
#' symbol <- 'BTC-USD'
#' blockchain_dot_com_ticker_symbol(symbol, 4.5)

blockchain_dot_com_ticker_symbol <- function(symbol, timeout_seconds = 60) {
  tryCatch({
    res <- httr::GET(paste('https://api.blockchain.com/v3/exchange/tickers/',
                           toupper(symbol), sep = '')
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

#' blockchain_dot_com_symbols
#'
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns a list with various data for all symbols
#' @export
#'
#' @examples
#' blockchain_dot_com_symbols(4.5)

blockchain_dot_com_symbols <- function(timeout_seconds = 60) {
  tryCatch({
    res <- httr::GET('https://api.blockchain.com/v3/exchange/symbols'
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

#' blockchain_dot_com_symbol
#'
#' @param symbol the symbol for which to retrieve data
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns a list with various data for specified symbol
#' @export
#'
#' @examples
#' symbol <- 'BTC-USD'
#' blockchain_dot_com_symbol(symbol, 4.5)

blockchain_dot_com_symbol <- function(symbol, timeout_seconds = 60) {
  tryCatch({
    res <- httr::GET(paste('https://api.blockchain.com/v3/exchange/symbols/',
                           toupper(symbol), sep = '')
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
