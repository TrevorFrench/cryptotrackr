#-------------------------------------------------------------------------------
#------------------------------------ACTION LIST--------------------------------
#-------------------------------------------------------------------------------
# - Is there a difference between Coinlist and coinlist pro?

#-------------------------------------------------------------------------------
#---------------------------------COINLIST SYMBOLS------------------------------
#-------------------------------------------------------------------------------
#' coinlist_symbols
#'
#' @return returns a dataframe with information about symbols available on Coinlist Pro
#' @export
#'
#' @examples
#' \dontrun{
#' symbols <- coinlist_symbols()}

coinlist_symbols <- function() {
  res = httr::GET('https://trade-api.coinlist.co/v1/symbols')
  data = jsonlite::fromJSON(rawToChar(res$content))
  return(data$symbols)
}
