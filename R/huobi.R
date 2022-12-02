#-------------------------------------------------------------------------------
#------------------------------------ACTION LIST--------------------------------
#-------------------------------------------------------------------------------
# -


#-------------------------------------------------------------------------------
#-----------------------------------HUOBI CANDLES-------------------------------
#-------------------------------------------------------------------------------
#' huobi_candles
#'
#' @param period the period of each candle. The following are acceptable options:	"1min", "5min", "15min", "30min", "60min", "4hour", "1day", "1mon", "1week", "1year"
#' @param size the number of datapoints to return. This should fall between 1 and 2000.
#' @param symbol the trading symbol to query.
#'
#' @return returns a dataframe containing huobi candle data
#' @export
#'
#' @examples
#' \dontrun{
#' period <- '1day'
#' size <- '200'
#' symbol <- 'btcusdt'
#' candles <- huobi_candles(period, size, symbol)}

huobi_candles <- function(period, size, symbol) {
  base <- 'https://api.huobi.pro'
  path <- '/market/history/kline'
  params <- paste('?period=', period
                  , '&size=', size
                  , '&symbol=', symbol
                  , sep = '')
  url <- paste(base, path, params, sep = '')
  res = httr::GET(url)
  data = jsonlite::fromJSON(rawToChar(res$content))
  return(data$data)
}
