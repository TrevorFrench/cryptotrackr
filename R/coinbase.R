#-------------------------------------------------------------------------------
#------------------------------------ACTION LIST--------------------------------
#-------------------------------------------------------------------------------
# -

#-------------------------------------------------------------------------------
#---------------------------COINBASE ALL KNOWN CURRENCIES-----------------------
#-------------------------------------------------------------------------------
#' coinbase_all_currencies
#'
#' @return returns a dataframe with information about all currencies known to Coinbase
#' @export
#'
#' @examples
#' \dontrun{
#' currencies <- coinbase_all_currencies()}

coinbase_all_currencies <- function() {
  res = httr::GET('https://api.exchange.coinbase.com/currencies',
                  httr::add_headers('Content-Type' = 'application/octet-stream'
                                    , 'accept' = 'application/json'
                  ))
  data = jsonlite::fromJSON(rawToChar(res$content))
  return(data)
}

#-------------------------------------------------------------------------------
#------------------------------COINBASE SINGLE CURRENCY-------------------------
#-------------------------------------------------------------------------------
#' coinbase_single_currency
#'
#' @param currency the currency id for the relevant asset
#'
#' @return returns a list with details related to the specified currency
#' @export
#'
#' @examples
#' \dontrun{
#' currency <- 'btc'
#' currency_data <- coinbase_single_currency(currency)}

coinbase_single_currency <- function(currency) {
  res = httr::GET(paste('https://api.exchange.coinbase.com/currencies/', toupper(currency), sep = ''),
                  httr::add_headers('Content-Type' = 'application/octet-stream'
                                    , 'accept' = 'application/json'
                  ))
  data = jsonlite::fromJSON(rawToChar(res$content))
  return(data)
}
