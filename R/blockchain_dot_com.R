#-------------------------------------------------------------------------------
#------------------------------------ACTION LIST--------------------------------
#-------------------------------------------------------------------------------
# -

#-------------------------------------------------------------------------------
#---------------------------BLOCKCHAIN.COM L2 ORDER BOOK------------------------
#-------------------------------------------------------------------------------
#' nifty_gateway_user_nifties
#'
#' @return returns a list containing a 'bids' and an 'asks' dataframe along with the specified symbol
#' @export
#'
#' @examples
#' \dontrun{
#' symbol <- 'BTC-USD'
#' l2_order_book <- blockchain_dot_com_l2_order_book(symbol)
#' bids <- l2_order_book$bids
#' asks <- l2_order_book$asks}

blockchain_dot_com_l2_order_book <- function(symbol) {
  res = httr::GET(paste('https://api.blockchain.com/v3/exchange/l2/', toupper(symbol), sep = ''))
  data = jsonlite::fromJSON(rawToChar(res$content))
  return(data)
}
