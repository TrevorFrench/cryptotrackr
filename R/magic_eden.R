#-------------------------------------------------------------------------------
#------------------------------------ACTION LIST--------------------------------
#-------------------------------------------------------------------------------
# - Add offset and limit parameters

#-------------------------------------------------------------------------------
#------------------------------MAGIC EDEN TRANSACTIONS--------------------------
#-------------------------------------------------------------------------------
#' magic_eden_transactions
#'
#' @param wallet the address of the wallet you are trying to query
#'
#' @return returns a dataframe containing all transactions for the specified wallet.
#' @export
#'
#' @examples
#' \dontrun{
#' wallet <- "72tXz6jhGVPFE8ZfAQocJPJU3HgxsdrRqKZoUdWUhs7o"
#' transactions <- magic_eden_transactions(wallet)}

magic_eden_transactions <- function(wallet) {
  res = httr::GET(paste('http://api-mainnet.magiceden.dev/v2/wallets/', wallet, '/activities', sep = ''))
  data = jsonlite::fromJSON(rawToChar(res$content))
  return(data)
}
