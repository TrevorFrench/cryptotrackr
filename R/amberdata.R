#-------------------------------------------------------------------------------
#------------------------------------ACTION LIST--------------------------------
#-------------------------------------------------------------------------------
# - Amberdata allows csv responses. Figure out a clean way to allow this data format as a response.

#-------------------------------------------------------------------------------
#--------------------------------AMBERDATA API CALL-----------------------------
#-------------------------------------------------------------------------------
#' amberdata_api_call
#'
#' @param url the url for your Amberdata API call
#' @param api_key your Amberdata API key
#' @param method "GET" or "POST"
#' @param query your query parameters. The default value is NULL.
#'
#' @return returns data from your Amberdata API call
#' @export
#'
#' @examples
#' \dontrun{
#' api_key <- "..."
#' url <- "https://web3api.io/api/v2/market/exchanges"
#' method <- "GET"
#' exchanges <- amberdata_api_call(url, api_key, method)}

amberdata_api_call <- function(url, api_key, method, query = NULL){
  res <- httr::VERB(method
                    , url
                    , httr::add_headers('x-api-key' = api_key)
                    , httr::content_type("application/octet-stream")
                    , httr::accept("application/json")
                    , query = query
  )
  data <- jsonlite::fromJSON(rawToChar(res$content))
  return(data)
}

#-------------------------------------------------------------------------------
#-----------------------------AMBERDATA SPOT EXCHANGES--------------------------
#-------------------------------------------------------------------------------
#' amberdata_spot_exchanges
#'
#' @param api_key your Amberdata API key
#' @param exchange choose a specific exchange or multiple exchanges (comma-separated) rather than all exchanges
#' @param pair choose a specific pair or multiple pairs (comma-separated) rather than all pairs
#' @param include_dates include a start date and an end date along with your data. Default is "false"
#' @param time_format the format to return your times in. Chosse from: "milliseconds", "ms", "iso", "iso8601", "hr", and "human_readable". Default is "ms".
#'
#' @return returns a list of spot exchanges and pairs supported on Amberdata with the option of including the dates each one was supported.
#' @export
#'
#' @examples
#' \dontrun{
#' api_key <- "..."
#' exchanges <- amberdata_spot_exchanges(api_key)
#' gdax <- amberdata_spot_exchanges(api_key, "gdax", "1inch_btc,ada_usd", "true", "hr")}

amberdata_spot_exchanges <- function(api_key, exchange = NULL, pair = NULL, include_dates = "false", time_format = "ms"){

  query_string <- list(
    exchange = exchange,
    pair = pair,
    includeDates = include_dates,
    timeFormat = time_format
  )

  url <- 'https://web3api.io/api/v2/market/exchanges'
  data <- amberdata_api_call(url, api_key, 'GET', query_string)
  return(data$payload)
}
