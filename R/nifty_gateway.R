#' nifty_gateway_user_nifties
#'
#' @param username the username you wish to query
#' @param limit optionally provide the maximum number of results to return. This
#' is a numeric parameter.
#' @param offset optionally specify how many results to skip. This is a numeric
#' parameter.
#' @param contract_address optionally filter results by contract address.
#'
#' @return returns a dataframe containing information about the nifties owned by
#' the specified user
#' @export
#'
#' @examples
#' \dontrun{
#' nifties <- nifty_gateway_user_nifties('tommy')}

nifty_gateway_user_nifties <- function(username
                                       , limit = NULL
                                       , offset = NULL
                                       , contract_address = NULL) {
  url <- paste('https://api.niftygateway.com/v1/users/'
               , username
               , '/nifties/'
               , sep = ''
               )
  query <- list(contractAddress = contract_address
                , limit = limit
                , offset = offset
                )
  res <- httr::GET(url
                  , query = query)
  data <- jsonlite::fromJSON(rawToChar(res$content))
  return(data$results)
}

#' nifty_gateway_creators
#'
#' @param username the username you wish to query
#' @param limit optionally provide the maximum number of results to return. This
#' is a numeric parameter.
#' @param offset optionally specify how many results to skip. This is a numeric
#' parameter.
#'
#' @return returns a dataframe containing ownership information for all nifties
#' created by the given creator and currently stored on Nifty Gateway
#' @export
#'
#' @examples
#' \dontrun{
#' creators <- nifty_gateway_creators('beeple')}

nifty_gateway_creators <- function(username, limit = NULL, offset = NULL) {
  url <- paste('https://api.niftygateway.com/v1/creators/'
               , username
               , '/collectors/'
               , sep = '')
  query <- list(limit = limit, offset = offset)
  res <- httr::GET(url, query = query)
  #res <- httr::VERB('GET', url, httr::accept("application/json"), query = query)
  data <- jsonlite::fromJSON(rawToChar(res$content))
  return(data$results)
}
