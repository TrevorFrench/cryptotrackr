#-------------------------------------------------------------------------------
#------------------------------------ACTION LIST--------------------------------
#-------------------------------------------------------------------------------
# -

#-------------------------------------------------------------------------------
#--------------------------------KRAKEN SERVER TIME-----------------------------
#-------------------------------------------------------------------------------
#' kraken_server_time
#'
#' @return returns a list with Kraken's server time in unix and rfc1123 formats
#' @export
#'
#' @examples
#' \dontrun{
#' time <- kraken_server_time()}

kraken_server_time <- function() {
  res = httr::GET('https://api.kraken.com/0/public/Time')
  data = jsonlite::fromJSON(rawToChar(res$content))
  return(data$result)
}

#-------------------------------------------------------------------------------
#-------------------------------KRAKEN SERVER STATUS----------------------------
#-------------------------------------------------------------------------------
#' kraken_server_status
#'
#' @return returns a list with Kraken's server status along with a timestamp
#' @export
#'
#' @examples
#' \dontrun{
#' status <- kraken_server_status()}

kraken_server_status <- function() {
  res = httr::GET('https://api.kraken.com/0/public/SystemStatus')
  data = jsonlite::fromJSON(rawToChar(res$content))
  return(data$result)
}
