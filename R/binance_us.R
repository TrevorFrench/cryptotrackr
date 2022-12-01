# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'
#   Document Functions:        'devtools::document()'

#-------------------------------------------------------------------------------
#-----------------------------BINANCE US RECENT TRADES--------------------------
#-------------------------------------------------------------------------------
#' binance_us_recent_trades
#'
#' @param symbol the trading pair for which you wish to retrieve data.
#' @param limit the number of results to return. The maximum is 1,000.
#'
#' @return returns a dataframe containing the most recent trades executed for the designated currency pair on Binance US
#' @export
#'
#' @examples
#' \dontrun{
#' symbol <- 'LTCBTC'
#' limit <- '1000'
#' recent_trades <- binance_us_recent_trades(symbol, limit)}

binance_us_recent_trades <- function(symbol, limit) {
  res = httr::GET(paste('https://api.binance.us/api/v3/trades?symbol=', symbol, '&limit=', limit, sep = ''))
  data = jsonlite::fromJSON(rawToChar(res$content))
  return(data)
}
