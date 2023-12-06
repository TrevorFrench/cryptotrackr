#' coinlist_symbols
#'
#' @return returns a dataframe with information about symbols available on Coinlist Pro
#' @export
#'
#' @examples
#' coinlist_symbols()

coinlist_symbols <- function() {
  res = httr::GET('https://trade-api.coinlist.co/v1/symbols')
  data = jsonlite::fromJSON(rawToChar(res$content))
  return(data$symbols)
}

#' coinlist_time
#'
#' @return returns a timestamp for use in your Coinlist API calls
#' @export
#'
#' @examples
#' coinlist_time()

coinlist_time <- function() {
  old <- options()
  on.exit(options(old))
  op <- options(digits.secs=0)
  tm <- as.POSIXlt(Sys.time(), "UTC")
  formatted_time <- round(as.numeric(as.POSIXct(tm)))
  return(formatted_time)
}

#' coinlist_signature
#'
#' @param api_secret your Coinlist API secret
#' @param coinlist_time a timestamp in the correct format according to Coinlist
#' @param method "GET" or "POST"
#' @param path the path of your API call
#' @param body the body of your API call
#'
#' @return returns a signature for use in your Coinlist API calls
#' @export
#'
#' @examples
#' \dontrun{
#' api_secret <- "..."
#' coinlist_time <- coinlist_time()
#' method <- "GET"
#' path <- "/v1/accounts"
#' body <- ""
#' coinlist_signature <- coinlist_signature(api_secret, coinlist_time, method, path, body)}

coinlist_signature <- function(api_secret, coinlist_time, method, path, body) {
  api_secret <- jsonlite::base64_dec(api_secret)
  message <- paste(coinlist_time, method, path, body, sep = '')
  sig <- digest::hmac(api_secret
                      , message
                      , "sha256"
                      , serialize = FALSE
                      , raw = TRUE
  )
  encoded_sig <- openssl::base64_encode(sig)
  return(encoded_sig)
}

#' coinlist_api_call
#'
#' @param api_key your Coinlist API key
#' @param api_secret your Coinlist API secret
#' @param method "GET" or "POST"
#' @param path the path of your API call
#' @param body the body of your API call
#'
#' @return returns the response from your Coinlist API call
#' @export
#'
#' @examples
#' \dontrun{
#' path <- "/v1/accounts"
#' method <- "GET"
#' api_key <- "..."
#' api_secret <- "..."
#' body <- ""
#' data <- coinlist_api_call(api_key, api_secret, method, path, body)}

coinlist_api_call <- function(api_key, api_secret, method, path, body) {
  coinlist_time <- coinlist_time()
  sig <- coinlist_signature(api_secret, coinlist_time, method, path, body)
  url <- paste('https://trade-api.coinlist.co', path, sep = '')
  res = httr::GET(url
                  , httr::accept("application/json")
                  , body = body
                  , httr::add_headers('CL-ACCESS-KEY' = api_key
                                      , 'CL-ACCESS-SIG' = sig
                                      , 'CL-ACCESS-TIMESTAMP' = coinlist_time
                  ))
  data = jsonlite::fromJSON(rawToChar(res$content))
  return(data)
}

#' coinlist_fees
#'
#' @param api_key your Coinlist API key
#' @param api_secret your Coinlist API secret
#'
#' @return returns a list containing Coinlist fees by symbols.
#' @export
#'
#' @examples
#' \dontrun{
#' api_key <- "..."
#' api_secret <- "..."
#' fees <- coinlist_fees(api_key, api_secret)}

coinlist_fees <- function(api_key, api_secret) {
  data <- coinlist_api_call(api_key, api_secret, 'GET', '/v1/fees', '')
  return(data$fees_by_symbols)
}
