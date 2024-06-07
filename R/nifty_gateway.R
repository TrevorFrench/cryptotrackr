#' nifty_gateway_user_nifties
#'
#' @param username the username you wish to query
#' @param limit optionally provide the maximum number of results to return. This
#' is a numeric parameter.
#' @param offset optionally specify how many results to skip. This is a numeric
#' parameter.
#' @param contract_address optionally filter results by contract address.
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns a dataframe containing information about the nifties owned by
#' the specified user
#' @export
#'
#' @examples
#' \donttest{
#' nifties <- nifty_gateway_user_nifties('tommy')}

nifty_gateway_user_nifties <- function(username
                                       , limit = NULL
                                       , offset = NULL
                                       , contract_address = NULL
                                       , timeout_seconds = 60) {
  url <- paste('https://api.niftygateway.com/v1/users/'
               , username
               , '/nifties/'
               , sep = ''
               )
  query <- list(contractAddress = contract_address
                , limit = limit
                , offset = offset
                )

  tryCatch({
    res <- httr::GET(url
                     , query = query
                     , httr::timeout(timeout_seconds))

    if (res$status_code == 200) {
      data <- jsonlite::fromJSON(rawToChar(res$content))

      if (!is.null(data$results)) {
        return(data$results)
      } else {
        warning("The response does not contain 'results'.")
        return(NULL)
      }

    } else {
      stop(paste("API call failed with status code", res$status_code))
    }

  }, error = function(e) {
    message <- paste("Error during API call:", e$message)
    warning(message)
    return(NULL)
  })
}

#' nifty_gateway_creators
#'
#' @param username the username you wish to query
#' @param limit optionally provide the maximum number of results to return. This
#' is a numeric parameter.
#' @param offset optionally specify how many results to skip. This is a numeric
#' parameter.
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns a dataframe containing ownership information for all nifties
#' created by the given creator and currently stored on Nifty Gateway
#' @export
#'
#' @examples
#' \donttest{
#' creators <- nifty_gateway_creators('beeple')}

nifty_gateway_creators <- function(username, limit = NULL, offset = NULL, timeout_seconds = 60) {
  url <- paste('https://api.niftygateway.com/v1/creators/'
               , username
               , '/collectors/'
               , sep = '')
  query <- list(limit = limit, offset = offset)
  #res <- httr::VERB('GET', url, httr::accept("application/json"), query = query)

  tryCatch({
    res <- httr::GET(url, query = query, httr::timeout(timeout_seconds))

    if (res$status_code == 200) {
      data <- jsonlite::fromJSON(rawToChar(res$content))

      if (!is.null(data$results)) {
        return(data$results)
      } else {
        warning("The response does not contain 'results'.")
        return(NULL)
      }

    } else {
      stop(paste("API call failed with status code", res$status_code))
    }

  }, error = function(e) {
    message <- paste("Error during API call:", e$message)
    warning(message)
    return(NULL)
  })
}
