#-------------------------------------------------------------------------------
#------------------------------------ACTION LIST--------------------------------
#-------------------------------------------------------------------------------
# -

#-------------------------------------------------------------------------------
#------------------------------CRYPTO.COM INSTRUMENTS---------------------------
#-------------------------------------------------------------------------------
#' crypto_dot_com_instruments
#'
#' @return returns a dataframe with information about instruments available on Crypto.com
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
