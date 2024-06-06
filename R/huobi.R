#' huobi_candles
#'
#' @param period the period of each candle. The following are acceptable options:
#' "1min", "5min", "15min", "30min", "60min", "4hour", "1day", "1mon", "1week",
#' "1year"
#' @param size the number of datapoints to return. This should fall between 1
#' and 2000.
#' @param symbol the trading symbol to query.
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns a dataframe containing Huobi candle data
#' @export
#'
#' @examples
#' period <- '1day'
#' size <- '200'
#' symbol <- 'btcusdt'
#' huobi_candles(period, size, symbol, 4.5)

huobi_candles <- function(period, size, symbol, timeout_seconds = 60) {
  base <- 'https://api.huobi.pro'
  path <- '/market/history/kline'
  params <- paste('?period=', period
                  , '&size=', size
                  , '&symbol=', symbol
                  , sep = '')
  url <- paste(base, path, params, sep = '')

  tryCatch({
    res <- httr::GET(url, httr::timeout(timeout_seconds))

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

