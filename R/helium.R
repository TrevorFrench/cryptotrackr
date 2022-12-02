#-------------------------------------------------------------------------------
#------------------------------------ACTION LIST--------------------------------
#-------------------------------------------------------------------------------
# - Add limit, offset, and contractAddress parameters
# - Add custom endpoints created on last Nifty Gateway app

#-------------------------------------------------------------------------------
#----------------------------NIFTY GATEWAY USER NIFTIES-------------------------
#-------------------------------------------------------------------------------
#' nifty_gateway_user_nifties
#'
#' @return returns a dataframe containing information about the nifties owned by the specified user
#' @export
#'
#' @examples
#' \dontrun{
#' nifties <- nifty_gateway_user_nifties('tommy')}

nifty_gateway_user_nifties <- function(username) {
  res = httr::GET(paste('https://api.niftygateway.com/v1/users/', username, '/nifties/', sep = ''))
  data = jsonlite::fromJSON(rawToChar(res$content))
  return(data$results)
}
