#' blockchain_dot_com_l2_order_book
#'
#' @param symbol the symbol for which to retrieve data
#'
#' @return returns a list containing a 'bids' and an 'asks' dataframe along with
#' the specified symbol
#' @export
#'
#' @examples
#' symbol <- 'BTC-USD'
#' l2_order_book <- blockchain_dot_com_l2_order_book(symbol)
#' l2_order_book$bids
#' l2_order_book$asks

blockchain_dot_com_l2_order_book <- function(symbol) {
  res <- httr::GET(paste('https://api.blockchain.com/v3/exchange/l2/',
                        toupper(symbol), sep = ''))
  data <- jsonlite::fromJSON(rawToChar(res$content))
  return(data)
}

#' blockchain_dot_com_l3_order_book
#'
#' @param symbol the symbol for which to retrieve data
#'
#' @return returns a list containing a 'bids' and an 'asks' dataframe along with
#' the specified symbol
#' @export
#'
#' @examples
#' symbol <- 'BTC-USD'
#' l3_order_book <- blockchain_dot_com_l3_order_book(symbol)
#' l3_order_book$bids
#' l3_order_book$asks

blockchain_dot_com_l3_order_book <- function(symbol) {
  res <- httr::GET(paste('https://api.blockchain.com/v3/exchange/l3/',
                        toupper(symbol), sep = ''))
  data <- jsonlite::fromJSON(rawToChar(res$content))
  return(data)
}

#' blockchain_dot_com_tickers
#'
#' @return returns a dataframe with price and volume data for all symbols
#' @export
#'
#' @examples
#' blockchain_dot_com_tickers()

blockchain_dot_com_tickers <- function() {
  res <- httr::GET('https://api.blockchain.com/v3/exchange/tickers')
  data <- jsonlite::fromJSON(rawToChar(res$content))
  return(data)
}

#' blockchain_dot_com_ticker_symbol
#'
#' @param symbol the symbol for which to retrieve data
#'
#' @return returns a list with price and volume data for specified symbol
#' @export
#'
#' @examples
#' symbol <- 'BTC-USD'
#' blockchain_dot_com_ticker_symbol(symbol)

blockchain_dot_com_ticker_symbol <- function(symbol) {
  res <- httr::GET(paste('https://api.blockchain.com/v3/exchange/tickers/',
                        toupper(symbol), sep = ''))
  data <- jsonlite::fromJSON(rawToChar(res$content))
  return(data)
}

#' blockchain_dot_com_symbols
#'
#' @return returns a list with various data for all symbols
#' @export
#'
#' @examples
#' blockchain_dot_com_symbols()

blockchain_dot_com_symbols <- function() {
  res <- httr::GET('https://api.blockchain.com/v3/exchange/symbols')
  data <- jsonlite::fromJSON(rawToChar(res$content))
  return(data)
}

#' blockchain_dot_com_symbol
#'
#' @param symbol the symbol for which to retrieve data
#'
#' @return returns a list with various data for specified symbol
#' @export
#'
#' @examples
#' symbol <- 'BTC-USD'
#' blockchain_dot_com_symbol(symbol)

blockchain_dot_com_symbol <- function(symbol) {
  res <- httr::GET(paste('https://api.blockchain.com/v3/exchange/symbols/',
                        toupper(symbol), sep = ''))
  data <- jsonlite::fromJSON(rawToChar(res$content))
  return(data)
}
