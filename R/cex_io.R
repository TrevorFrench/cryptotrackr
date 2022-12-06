#-------------------------------------------------------------------------------
#------------------------------------ACTION LIST--------------------------------
#-------------------------------------------------------------------------------
# - Don't know what the ticker symbol by market endpoint is doing. did not create function
# - Same for last markets
# - getting 500s on cex_io_converter

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

#-------------------------------------------------------------------------------
#------------------------------CEX.IO CURRENCY LIMITS---------------------------
#-------------------------------------------------------------------------------
#' cex_io_currency_limits
#'
#' @return returns a dataframe with information about currency limits on CEX.io.
#' @export
#'
#' @examples
#' \dontrun{
#' }

currency_limits <- cex_io_currency_limits()

cex_io_currency_limits <- function() {
  res = httr::GET('https://cex.io/api/currency_limits')
  data = jsonlite::fromJSON(rawToChar(res$content))
  return(data$data$pairs)
}

#-------------------------------------------------------------------------------
#---------------------------------CEX.IO LAST PRICE-----------------------------
#-------------------------------------------------------------------------------
#' cex_io_last_price
#'
#' @param symbol_1 the first currency in your pair
#' @param symbol_2 the second currency in your pair
#'
#' @return returns a list with the last price of your specified currency pair.
#' @export
#'
#' @examples
#' \dontrun{
#' symbol_1 <- 'btc'
#' symbol_2 <- 'usd'
#' last_price <- cex_io_last_price(symbol_1, symbol_2)}

cex_io_last_price <- function(symbol_1, symbol_2) {
  res = httr::GET(paste('https://cex.io/api/last_price/', toupper(symbol_1), '/', toupper(symbol_2), sep = ''))
  data = jsonlite::fromJSON(rawToChar(res$content))
  return(data)
}

#-------------------------------------------------------------------------------
#----------------------------------CEX.IO CONVERTER-----------------------------
#-------------------------------------------------------------------------------
#' cex_io_converter
#'
#' @param symbol_1 the first currency in your pair
#' @param symbol_2 the second currency in your pair
#'
#' @return returns a list with the last price of your specified currency pair.
#' @export
#'
#' @examples
#' \dontrun{
#' symbol_1 <- 'btc'
#' symbol_2 <- 'usd'
#' last_price <- cex_io_converter(symbol_1, symbol_2)}

amount <- '1'

cex_io_converter <- function(symbol_1, symbol_2) {
  res = httr::POST(paste('https://cex.io/api/convert/', toupper(symbol_1), '/', toupper(symbol_2), sep = '')
                   , body = list('amnt' = amount)
                   , httr::add_headers('Content-Type' = 'application/json'
                                      , 'accept' = '*/*'
                   ))
  data = jsonlite::fromJSON(rawToChar(res$content))
  return(data)
}
