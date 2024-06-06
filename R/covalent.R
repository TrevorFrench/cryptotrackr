#' covalent_api_call
#'
#' @param url the Covalent URL for use in your API call
#' @param method 'GET' or 'POST'
#' @param query your query parameters formatted as a named list
#' @param csv 'TRUE' will return csv data parsed as a dataframe while 'FALSE'
#' will return json data. The default value is 'FALSE'.
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns your Covalent API data
#' @export
#'
#' @examples
#' \dontrun{
#' url <- "https://api.covalenthq.com/v1/1/address/trevorfrench.eth/balances_v2/"
#' api_key <- "..."
#' query <- list(key = api_key, format = NULL)
#' method <- "GET"
#' balances <- covalent_api_call(url, method, api_key, method, query, csv = FALSE)}

covalent_api_call <- function(url, method, query = NULL, csv = FALSE, timeout_seconds = 60){
  tryCatch({
    res <- httr::VERB(method
                      , url
                      , httr::accept("application/json")
                      , httr::timeout(timeout_seconds)
                      , query = query
    )


    if (res$status_code == 200) {
      if (csv == FALSE) {
        data <- jsonlite::fromJSON(rawToChar(res$content))
      } else {
        data <- utils::read.table(text = rawToChar(res$content), sep = ',', header = TRUE)
      }
      return(data)
    } else {
      stop(paste("API call failed with status code", res$status_code))
    }

  }, error = function(e) {
    message <- paste("Error during API call:", e$message)
    warning(message)
    return(NULL)
  })
}

#' covalent_balances
#'
#' @param api_key your Covalent API key
#' @param chain_id the string id of the chain for which you wish to check
#' balances.
#' @param address the address you for which wish to check balances.
#' @param csv 'TRUE' will return csv data parsed as a dataframe while 'FALSE'
#' will return json data. The default value is 'FALSE'.
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns either a list or a dataframe with account balances
#' @export
#'
#' @examples
#' \dontrun{
#' api_key <- "..."
#' balances <- covalent_balances(api_key, "1", "trevorfrench.eth", csv = FALSE)}

covalent_balances <- function(api_key, chain_id, address, csv = FALSE, timeout_seconds = 60){
  base <- 'https://api.covalenthq.com/v1/'
  endpoint <- paste(chain_id, '/address/', address, '/balances_v2/', sep = '')
  url <- paste(base, endpoint, sep = '')
  if (csv == FALSE){
    format <- 'json'
  } else {
    format <- 'csv'
  }
  query <- list(key = api_key, format = format)
  data <- covalent_api_call(url, 'GET', query, csv, timeout_seconds)

  if (is.null(data)) {
    warning("Failed to retrieve data from Covalent API.")
    return(NULL)
  } else {
    return(data)
  }

}

#' covalent_portfolio
#'
#' @param api_key your Covalent API key
#' @param chain_id the string id of the chain for which you wish to check
#' portfolio history.
#' @param address the address you for which wish to get portfolio history.
#' @param csv 'TRUE' will return csv data parsed as a dataframe while 'FALSE'
#' will return json data. The default value is 'FALSE'.
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns either a list or a dataframe with portfolio history
#' @export
#'
#' @examples
#' \dontrun{
#' api_key <- "..."
#' portfolio <- covalent_portfolio(api_key, "1", "trevorfrench.eth", csv = FALSE)}

covalent_portfolio <- function(api_key, chain_id, address, csv = FALSE, timeout_seconds = 60){
  base <- 'https://api.covalenthq.com/v1/'
  endpoint <- paste(chain_id, '/address/', address, '/portfolio_v2/', sep = '')
  url <- paste(base, endpoint, sep = '')
  if (csv == FALSE){
    format <- 'json'
  } else {
    format <- 'csv'
  }
  query <- list(key = api_key, format = format)
  data <- covalent_api_call(url, 'GET', query, csv, timeout_seconds)

  if (is.null(data)) {
    warning("Failed to retrieve data from Covalent API.")
    return(NULL)
  } else {
    return(data)
  }

}
