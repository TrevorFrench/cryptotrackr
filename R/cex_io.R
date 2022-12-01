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
