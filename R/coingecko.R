#' coingecko_ping
#'
#' @return returns the Coingecko API server status
#' @export
#'
#' @examples
#' coingecko_ping()

coingecko_ping <- function() {
  res <- httr::VERB('GET'
                    , 'https://api.coingecko.com/api/v3/ping'
                    , httr::accept("application/json")
                    )
  data = jsonlite::fromJSON(rawToChar(res$content))
  return(data)
}

#' coingecko_vs_currencies
#'
#' @return returns a character vector containg all supported currencies on
#' Coingecko.
#' @export
#'
#' @examples
#' coingecko_vs_currencies()

coingecko_vs_currencies <- function() {
  url <- 'https://api.coingecko.com/api/v3/simple/supported_vs_currencies'
  res <- httr::VERB('GET'
                    , url
                    , httr::accept("application/json")
  )
  data = jsonlite::fromJSON(rawToChar(res$content))
  return(data)
}

#' coingecko_coins
#'
#' @param include_platform optionally select either "true" or "false" to include
#' platform contract tokens.
#'
#' @return returns a dataframe containing all coins on CoinGecko and their respective
#' ids, symbols, and names
#' @export
#'
#' @examples
#' coingecko_coins()

coingecko_coins <- function(include_platform = NULL) {
  url <- 'https://api.coingecko.com/api/v3/coins/list'
  query <- list(include_platform = include_platform)
  res <- httr::VERB('GET'
                    , url
                    , httr::accept("application/json")
                    , query = query
                    )
  data = jsonlite::fromJSON(rawToChar(res$content))
  return(data)
}

#' coingecko_price
#'
#' @param id one or more comma-separated asset ids to query
#' @param vs_currency one or more comma-separated vs_currencies to query
#' @param include_market_cap optionally provide a 'true' or 'false' value to
#' include/exclude market cap. The default is 'false'.
#' @param include_24hr_vol optionally provide a 'true' or 'false' value to
#' include/exclude 24-hour volume. The default is 'false'.
#' @param include_24hr_change optionally provide a 'true' or 'false' value to
#' include/exclude the 24-hour price change. The default is 'false'.
#' @param include_last_updated_at optionally provide a 'true' or 'false' value to
#' include/exclude the last updated information. The default is 'false'.
#' @param precision optionally specify the decimal precision to return. Choose
#' either 'full' or any number between 0 and 18.
#'
#' @return returns a list of currency prices
#' @export
#'
#' @examples
#' coingecko_price(id = 'bitcoin', vs_currency = 'usd')

coingecko_price <- function(id
                            , vs_currency
                            , include_market_cap = NULL
                            , include_24hr_vol = NULL
                            , include_24hr_change = NULL
                            , include_last_updated_at = NULL
                            , precision = NULL) {
  url <- 'https://api.coingecko.com/api/v3/simple/price'
  query <- list(ids = id
                , vs_currencies = vs_currency
                , include_market_cap = include_market_cap
                , include_24hr_vol = include_24hr_vol
                , include_24hr_change = include_24hr_change
                , include_last_updated_at = include_last_updated_at
                , precision = precision)
  res <- httr::VERB('GET'
                    , url
                    , httr::accept("application/json")
                    , query = query
  )
  data = jsonlite::fromJSON(rawToChar(res$content))
  return(data)
}

#' coingecko_categories
#'
#' @return returns a dataframe of all categories on CoinGecko.
#' @export
#'
#' @examples
#' coingecko_categories()

coingecko_categories <- function() {
  url <- 'https://api.coingecko.com/api/v3/coins/categories/list'
  res <- httr::VERB('GET'
                    , url
                    , httr::accept("application/json"))
  data = jsonlite::fromJSON(rawToChar(res$content))
  return(data)
}

#' coingecko_price_history
#'
#' @param id The asset id you wish to query. IDs can be retrieved with the
#' coingecko_coins function.
#' @param date the date you wish to query formatted as "dd-mm-yyyy"
#' @param localization "true" or "false" to include/exclude localized languages
#' in the response. The default value is "false".
#'
#' @return returns a list containing data about asset pricing.
#' @export
#'
#' @examples
#' price <- coingecko_price_history("bitcoin", "30-12-2017")
#' price$market_data$current_price$usd

coingecko_price_history <- function(id
                            , date
                            , localization = "false") {
  url <- paste('https://api.coingecko.com/api/v3/coins/'
               , id
               , '/history'
               , sep = '')
  query <- list(id = id, date = date, localization = localization)
  res <- httr::VERB('GET'
                    , url
                    , httr::accept("application/json")
                    , query = query
  )
  data = jsonlite::fromJSON(rawToChar(res$content))
  return(data)
}

#' coingecko_global_data
#'
#' @return returns a list containing high-level statistics about the
#' cryptocurrency ecosystem.
#' @export
#'
#' @examples
#' coingecko_global_data()

coingecko_global_data <- function() {
  url <- 'https://api.coingecko.com/api/v3/global'
  res <- httr::VERB('GET'
                    , url
                    , httr::accept("application/json")
  )
  data = jsonlite::fromJSON(rawToChar(res$content))
  return(data$data)
}
