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

#' amberdata_spot_exchanges
#'
#' @param api_key your Amberdata API key
#' @param exchange choose a specific exchange or multiple exchanges
#' (comma-separated) rather than all exchanges
#' @param pair choose a specific pair or multiple pairs (comma-separated) rather
#' than all pairs
#' @param include_dates include a start date and an end date along with your
#' data. Default is "false"
#' @param time_format the format to return your times in. Choose from:
#' "milliseconds", "ms", "iso", "iso8601", "hr", and "human_readable". Default
#' is "ms".
#'
#' @return returns a list of spot exchanges and pairs supported on Amberdata
#' with the option of including the dates each one was supported.
#' @export
#'
#' @examples
#' \dontrun{
#' api_key <- "..."
#' exchanges <- amberdata_spot_exchanges(api_key)
#' gdax <- amberdata_spot_exchanges(api_key
#'                                  , "gdax"
#'                                  , "1inch_btc,ada_usd"
#'                                  , "true"
#'                                  , "hr")}

amberdata_spot_exchanges <- function(api_key
                                     , exchange = NULL
                                     , pair = NULL
                                     , include_dates = "false"
                                     , time_format = "ms"){

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

#' amberdata_market_metrics
#'
#' @param api_key your Amberdata API key
#' @param symbol the asset symbol you wish to receive metrics for
#'
#' @return returns a list containing market metrics for the specified symbol.
#' @export
#'
#' @examples
#' \dontrun{
#' api_key <- "..."
#' metrics <- amberdata_market_metrics(api_key, "btc")}

amberdata_market_metrics <- function(api_key, symbol){
  url <- paste('https://web3api.io/api/v2/market/metrics/'
               , symbol
               , '/latest'
               , sep = '')
  data <- amberdata_api_call(url, api_key, 'GET')
  return(data$payload)
}

#' amberdata_blockchain_metrics
#'
#' @param api_key your Amberdata API key
#' @param blockchain_id the id for the blockchain you wish to query. The default
#' blockchain_id is "ethereum-mainnet".
#'
#' @return returns a list containing blockchain metrics for your specified
#' blockchain_id.
#' @export
#'
#' @examples
#' \dontrun{
#' api_key <- "..."
#' metrics <- amberdata_blockchain_metrics(api_key)}

amberdata_blockchain_metrics <- function(api_key, blockchain_id = "ethereum-mainnet"){
  url <- 'https://web3api.io/api/v2/blockchains/metrics/latest'
  res <- httr::GET(url
                    , httr::add_headers('x-api-key' = api_key
                                        , 'x-amberdata-blockchain-id' = blockchain_id)
                    , httr::content_type("application/octet-stream")
                    , httr::accept("application/json")
                  )
  data <- jsonlite::fromJSON(rawToChar(res$content))
  return(data$payload)
}

#' amberdata_historical_exchange_volume
#'
#' @param api_key your Amberdata API key
#' @param exchange the exchange you wish to retrieve volume for. By default this
#' function will return all exchange volume.
#' @param direction the direction in which to sort your results (by volume). The
#' default is descending order. This function will accept "desc" or "asc".
#' @param start_date only include data after this date (inclusive). This
#' parameter will accept dates formatted as seconds, milliseconds, or iso8601.
#' @param end_date only include data before this date (exclusive). The maximum
#' time range is 31 days. This parameter will accept dates formatted as seconds,
#' milliseconds, or iso8601.
#' @param time_format the format to return your times in. Choose from:
#' "milliseconds", "ms", "iso", "iso8601", "hr", and "human_readable". Default
#' is "ms".
#'
#' @return returns a dataframe with your volume data.
#' @export
#'
#' @examples
#' \dontrun{
#' api_key <- "..."
#' volume <- amberdata_historical_exchange_volume(api_key
#'                                                , "gdax"
#'                                                , "desc"
#'                                                , "2020-09-01T01:00:00"
#'                                                , "2020-09-02T01:00:00"
#'                                                , "hr")}

amberdata_historical_exchange_volume <- function(api_key
                                                 , exchange = NULL
                                                 , direction = NULL
                                                 , start_date = NULL
                                                 , end_date = NULL
                                                 , time_format = NULL){
  url <- 'https://web3api.io/api/v2/market/metrics/exchanges/volumes/historical'
  query <- list(exchange = exchange
                , direction = direction
                , startDate = start_date
                , endDate = end_date
                , timeFormat = time_format)
  data <- amberdata_api_call(url, api_key, 'GET', query)
  return(data$payload$data)
}
