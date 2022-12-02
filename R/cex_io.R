#-------------------------------------------------------------------------------
#------------------------------------ACTION LIST--------------------------------
#-------------------------------------------------------------------------------
# -

#-------------------------------------------------------------------------------
#-----------------------------------CEX.IO TICKER-------------------------------
#-------------------------------------------------------------------------------
#' cex_io_ticker
#'
#' @param symbol_1 the first currency in your pair
#' @param symbol_2 the second currency in your pair
#'
#' @return returns a list with basic trading information about your specified currency pair for the last 24 hours.
#' @export
#'
#' @examples
#' \dontrun{
#' symbol_1 <- 'btc'
#' symbol_2 <- 'usd'
#' ticker_info <- cex_io_ticker(symbol_1, symbol_2)}

cex_io_ticker <- function(symbol_1, symbol_2) {
  res = httr::GET(paste('https://cex.io/api/ticker/', toupper(symbol_1), '/', toupper(symbol_2), sep = ''))
  data = jsonlite::fromJSON(rawToChar(res$content))
  return(data)
}
