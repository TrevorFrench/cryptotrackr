#-------------------------------------------------------------------------------
#------------------------------------ACTION LIST--------------------------------
#-------------------------------------------------------------------------------
# -

#-------------------------------------------------------------------------------
#------------------------------CRYPTO.COM INSTRUMENTS---------------------------
#-------------------------------------------------------------------------------
#' crypto_dot_com_instruments
#'
#' @return returns a dataframe with information about instruments available on
#' Crypto.com
#' @export
#'
#' @examples
#' \dontrun{
#' instruments <- crypto_dot_com_instruments()}

crypto_dot_com_instruments <- function() {
  res = httr::GET('https://api.crypto.com/v2/public/get-instruments')
  data = jsonlite::fromJSON(rawToChar(res$content))
  return(data$result$instruments)
}

#-------------------------------------------------------------------------------
#-------------------------------CRYPTO.COM GET BOOK-----------------------------
#-------------------------------------------------------------------------------
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
#' \dontrun{
#' book <- crypto_dot_com_get_book("BTC_USDT")}

crypto_dot_com_get_book <- function(instrument, depth = 50) {
  query <- list(instrument_name = instrument, depth = depth)
  res = httr::GET('https://api.crypto.com/v2/public/get-book', query = query)
  data = jsonlite::fromJSON(rawToChar(res$content))
  return(data$result)
}
