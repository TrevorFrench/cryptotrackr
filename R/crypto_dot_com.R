#' crypto_dot_com_instruments
#'
#' @return returns a dataframe with information about instruments available on
#' Crypto.com
#' @export
#'
#' @examples
#' crypto_dot_com_instruments()

crypto_dot_com_instruments <- function() {
  res <- httr::GET('https://api.crypto.com/v2/public/get-instruments')
  data <- jsonlite::fromJSON(rawToChar(res$content))
  return(data$result$instruments)
}

#' crypto_dot_com_get_book
#'
#' @param instrument the instrument name which you want to query
#' @param depth the depth of the order book to retrieve. The maximum and default
#' value is 50.
#'
#' @return returns a list containing the order book for your specified
#' instrument.
#' @export
#'
#' @examples
#' crypto_dot_com_get_book("BTC_USDT")

crypto_dot_com_get_book <- function(instrument, depth = 50) {
  query <- list(instrument_name = instrument, depth = depth)
  res <- httr::GET('https://api.crypto.com/v2/public/get-book', query = query)
  data <- jsonlite::fromJSON(rawToChar(res$content))
  return(data$result)
}

#' crypto_dot_com_get_candlestick
#'
#' @param instrument the instrument name which you want to query
#' @param timeframe the timeframe which each candle represents. You can choose
#' from the following options: '1m', '5m', '15m', '30m', '1h', '4h', '6h',
#' '12h', '1D', '7D', '14D', '1M'. The defailt option is '5m'.
#'
#' @return returns a list which contains metadata about your query along with a
#' dataframe containing your candlestick data.
#' @export
#'
#' @examples
#' crypto_dot_com_get_candlestick("BTC_USDT")

crypto_dot_com_get_candlestick <- function(instrument, timeframe = '5m') {
  query <- list(instrument_name = instrument, timeframe = timeframe)
  res <- httr::GET('https://api.crypto.com/v2/public/get-candlestick'
                  , query = query)
  data <- jsonlite::fromJSON(rawToChar(res$content))
  return(data$result)
}

#' crypto_dot_com_get_ticker
#'
#' @param instrument the instrument name which you want to query
#'
#' @return returns ticker data for specified instrument. Refer to Crypto.com for
#' help interpreting response data:
#' https://exchange-docs.crypto.com/spot/index.html#public-get-ticker
#' @export
#'
#' @examples
#' crypto_dot_com_get_ticker("BTC_USDT")

crypto_dot_com_get_ticker <- function(instrument) {
  query <- list(instrument_name = instrument)
  res <- httr::GET('https://api.crypto.com/v2/public/get-ticker', query = query)
  data <- jsonlite::fromJSON(rawToChar(res$content))
  return(data$result$data)
}

#' crypto_dot_com_get_trades
#'
#' @param instrument the instrument name which you want to query
#'
#' @return returns trade data for specified instrument. Refer to Crypto.com for
#' help interpreting response data:
#' https://exchange-docs.crypto.com/spot/index.html#public-get-trades
#' @export
#'
#' @examples
#' crypto_dot_com_get_trades("BTC_USDT")

crypto_dot_com_get_trades <- function(instrument) {
  query <- list(instrument_name = instrument)
  res <- httr::GET('https://api.crypto.com/v2/public/get-trades', query = query)
  data <- jsonlite::fromJSON(rawToChar(res$content))
  return(data$result$data)
}
