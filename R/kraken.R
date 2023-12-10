#' kraken_server_time
#'
#' @return returns a list with Kraken's server time in unix and rfc1123 formats
#' @export
#'
#' @examples
#' kraken_server_time()

kraken_server_time <- function() {
  res <- httr::GET('https://api.kraken.com/0/public/Time')
  data <- jsonlite::fromJSON(rawToChar(res$content))
  return(data$result)
}

#' kraken_server_status
#'
#' @return returns a list with Kraken's server status along with a timestamp
#' @export
#'
#' @examples
#' kraken_server_status()

kraken_server_status <- function() {
  res <- httr::GET('https://api.kraken.com/0/public/SystemStatus')
  data <- jsonlite::fromJSON(rawToChar(res$content))
  return(data$result)
}

#' kraken_asset_info
#'
#' @param asset optionally provide one or more comma-separated ticker symbols.
#' @param aclass optionally provide asset categories to filter by.
#'
#' @return returns a list containing asset information
#' @export
#'
#' @examples
#' all_asset_info <- kraken_asset_info()
#' eth_btc_info <- kraken_asset_info("ETH,BTC")
#' currency_info <- kraken_asset_info(aclass = "currency")

kraken_asset_info <- function(asset = NULL, aclass = NULL) {
  query <- list(asset = asset, aclass = aclass)
  res <- httr::GET('https://api.kraken.com/0/public/Assets', query = query)
  data <- jsonlite::fromJSON(rawToChar(res$content))
  return(data$result)
}

#' kraken_asset_pairs
#'
#' @param pair optionally provide one or more comma-separated asset pairs to query.
#' @param info optionally select the information to return. You can choose from:
#' "info" (all info), "leverage" (leverage info), "fees" (fee schedule), or
#' "margin" (margin info).
#'
#' @return returns a list containing information on Kraken asset pairs.
#' @export
#'
#' @examples
#' kraken_asset_pairs()

kraken_asset_pairs <- function(pair = NULL, info = NULL) {
  query <- list(pair = pair, info = info)
  res <- httr::GET('https://api.kraken.com/0/public/AssetPairs', query = query)
  data <- jsonlite::fromJSON(rawToChar(res$content))
  return(data$result)
}

#' kraken_ticker_info
#'
#' @param pair optionally provide one or more comma-separated asset pairs.
#'
#' @return returns a list containing ticker info for assets on Kraken. Refer to
#' Kraken for help interpreting response data:
#' https://docs.kraken.com/rest/#tag/Market-Data/operation/getTickerInformation
#' @export
#'
#' @examples
#' kraken_ticker_info("ETHUSD")

kraken_ticker_info <- function(pair = NULL) {
  query <- list(pair = pair)
  res <- httr::GET('https://api.kraken.com/0/public/Ticker', query = query)
  data <- jsonlite::fromJSON(rawToChar(res$content))
  return(data$result)
}
