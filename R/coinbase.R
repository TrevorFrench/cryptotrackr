#' coinbase_all_currencies
#'
#' @return returns a dataframe with information about all currencies known to Coinbase
#' @export
#'
#' @examples
#' coinbase_all_currencies()

coinbase_all_currencies <- function() {
  res <- httr::GET('https://api.exchange.coinbase.com/currencies',
                  httr::add_headers('Content-Type' = 'application/octet-stream'
                                    , 'accept' = 'application/json'
                  ))
  data <- jsonlite::fromJSON(rawToChar(res$content))
  return(data)
}

#' coinbase_single_currency
#'
#' @param currency the currency id for the relevant asset
#'
#' @return returns a list with details related to the specified currency
#' @export
#'
#' @examples
#' currency <- 'btc'
#' coinbase_single_currency(currency)

coinbase_single_currency <- function(currency) {
  res <- httr::GET(paste('https://api.exchange.coinbase.com/currencies/',
                         toupper(currency), sep = ''),
                  httr::add_headers('Content-Type' = 'application/octet-stream'
                                    , 'accept' = 'application/json'
                  ))
  data <- jsonlite::fromJSON(rawToChar(res$content))
  return(data)
}

#' coinbase_time
#'
#' @return returns a timestamp for use in your Coinbase API calls
#' @export
#'
#' @examples
#' coinbase_time()

coinbase_time <- function() {
  old <- options()
  on.exit(options(old))
  op <- options(digits.secs=0)
  tm <- as.POSIXlt(Sys.time(), "UTC")
  formatted_time <- round(as.numeric(as.POSIXct(tm)))
  return(formatted_time)
}

#' coinbase_signature
#'
#' @param api_secret your Coinbase API secret
#' @param coinbase_time a timestamp in the correct format according to Coinbase
#' @param method "GET" or "POST"
#' @param path the path of your API call
#' @param body the body of your API call
#'
#' @return returns a signature for use in your Coinbase API calls
#' @export
#'
#' @examples
#' \dontrun{
#' api_secret <- "..."
#' coinbase_time <- coinbase_time()
#' method <- "GET"
#' path <- "/api/v3/brokerage/accounts"
#' body <- ""
#' coinbase_signature <- coinbase_signature(api_secret, coinbase_time, method, path, body)}

coinbase_signature <- function(api_secret, coinbase_time, method, path, body) {
  api_secret <- stringi::stri_enc_toutf8(api_secret)
  message <- paste(coinbase_time, method, path, body, sep = '')
  sig <- openssl::sha256(message, key = api_secret)
  return(sig)
}

#' coinbase_api_call
#'
#' @param api_key your Coinbase API key
#' @param api_secret your Coinbase API secret
#' @param method "GET" or "POST"
#' @param path the path of your API call
#' @param body the body of your API call
#' @param query the query for your coinbase API call as a list
#'
#' @return returns the response from your Coinbase API call
#' @export
#'
#' @examples
#' \dontrun{
#' path <- "/api/v3/brokerage/accounts"
#' method <- "GET"
#' api_key <- "..."
#' api_secret <- "..."
#' body <- ""
#' data <- coinbase_api_call(api_key, api_secret, method, path, body)}

coinbase_api_call <- function(api_key, api_secret, method, path, body, query = NULL) {
  coinbase_time <- coinbase_time()
  sig <- coinbase_signature(api_secret, coinbase_time, method, path, body)
  url <- paste('https://api.coinbase.com', path, sep = '')
  res <- httr::VERB(method
                  , url
                  , body = body
                  , httr::add_headers('CB-ACCESS-KEY' = api_key
                                      , 'CB-ACCESS-SIGN' = sig
                                      , 'CB-ACCESS-TIMESTAMP' = coinbase_time
                  )
                  , query = query)
  data <- jsonlite::fromJSON(rawToChar(res$content))
  return(data)
}

#' coinbase_accounts
#'
#' @param api_key your Coinbase API key
#' @param api_secret your Coinbase API secret
#' @param limit the maximum number of results to return. The maximum limit is
#' 250 while the default value is 49.
#' @param cursor Cursor used for pagination. When provided, the response returns
#' responses after this cursor.
#'
#' @return returns a list with a dataframe with information about your Coinbase
#' accounts along with your cursor for use in pagination.
#' @export
#'
#' @examples
#' \dontrun{
#' api_key <- "..."
#' api_secret <- "..."
#' accounts <- coinbase_accounts(api_key, api_secret)}

coinbase_accounts <- function(api_key, api_secret, limit = NULL, cursor = NULL) {
  path <- '/api/v3/brokerage/accounts'
  method <- 'GET'
  body <- ''
  query <- list(
    limit = limit,
    cursor = cursor
  )
  data <- coinbase_api_call(api_key, api_secret, method, path, body, query)
  return(data)
}

#' coinbase_candles
#'
#' @param api_key your Coinbase API key
#' @param api_secret your Coinbase API secret
#' @param product_id the trading pair.
#' @param start timestamp for starting range of aggregations, in UNIX time.
#' @param end timestamp for ending range of aggregations, in UNIX time.
#' @param granularity time slice value for each candle. Options: "ONE_MINUTE",
#' "FIVE_MINUTE", "FIFTEEN_MINUTE", "THIRTY_MINUTE", "ONE_HOUR", "TWO_HOUR",
#' "SIX_HOUR", or "ONE_DAY"
#'
#' @return returns a dataframe with your Coinbase candle data.
#' @export
#'
#' @examples
#' \dontrun{
#' api_key <- "..."
#' api_secret <- "..."
#' end <- coinbase_time()
#' end_timestamp <- as.POSIXct(end, origin = "1970-01-01", tz = "UTC")
#' start_timestamp <- end_timestamp - 20 * 60  # 20 minutes in seconds
#' start <- as.numeric(start_timestamp)
#' coinbase_candles(api_key, api_secret, 'BTC-USD', start, end, 'ONE_MINUTE')}

coinbase_candles <- function(api_key, api_secret, product_id, start, end, granularity) {
  path <- '/api/v3/brokerage/products/BTC-USD/candles'
  method <- 'GET'
  body <- ''
  query <- list(
    start = start,
    end = end,
    granularity = granularity
  )
  data <- coinbase_api_call(api_key, api_secret, method, path, body, query)
  return(data$candles)
}
