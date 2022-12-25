#-------------------------------------------------------------------------------
#------------------------------------ACTION LIST--------------------------------
#-------------------------------------------------------------------------------
# - Have not tested the airdrop function (need a hobbyist plan)

#-------------------------------------------------------------------------------
#------------------------------COINMARKETCAP API CALL---------------------------
#-------------------------------------------------------------------------------
#' coinmarketcap_api_call
#'
#' @param url the url for your CoinMarketCap API call
#' @param api_key your CoinMarketCap API key
#' @param method "GET" or "POST"
#' @param query your query parameters. The default value is NULL.
#'
#' @return returns data from your CoinMarketCap API call
#' @export
#'
#' @examples
#' \dontrun{
#' url <- "https://pro-api.coinmarketcap.com/v1/cryptocurrency/map"
#' api_key <- "..."
#' query_string <- list(
#'   listing_status = "active",
#'   start = "1",
#'   limit = NULL,
#'   sort = "id",
#'   symbol = NULL,
#'   aux = "platform,first_historical_data,last_historical_data,is_active,status"
#' )
#' data <- coinmarketcap_api_call(url, api_key, 'GET', query = query_string)}

coinmarketcap_api_call <- function(url, api_key, method, query = NULL){
  res <- httr::VERB(method
                    , url
                    , httr::add_headers('X-CMC_PRO_API_KEY' = api_key)
                    , httr::content_type("application/octet-stream")
                    , httr::accept("application/json")
                    , query = query
  )
  data <- jsonlite::fromJSON(rawToChar(res$content))
  return(data)
}

#-------------------------------------------------------------------------------
#-------------------------------COINMARKETCAP ID MAP----------------------------
#-------------------------------------------------------------------------------
#' coinmarketcap_id_map
#'
#' @param api_key your CoinMarketCap API key
#' @param listing_status you can choose "active", "inactive", or "untracked".
#' Multiple options can be passed if they are comma-separated. Choosing "active"
#' will return only active cryptocurrencies. Choosing "inactive" will return
#' cryptocurrencies which are inactive. Choosing "untracked" will return a list
#' of cryptocurrencies which are listed by CoinMarketCap but do not yet meet
#' their methodology requirements to have tracked markets available. The default
#' is "active".
#' @param start you can use this parameter to offset your first result. The
#' default value is "1".
#' @param limit an optional string value between 1 and 5000 which tells
#' CoinMarketCap how many results to return. The default value is NULL.
#' @param sort the field used to sort your results. The two acceptable values
#' are "id" and "cmc_rank". The default value is "id".
#' @param symbol Optionally pass a comma-separated list of cryptocurrency
#' symbols to return CoinMarketCap IDs for. The default value is NULL.
#' @param aux Optionally specify a comma-separated list of supplemental data
#' fields to return. Pass "platform,first_historical_data,last_historical_data,
#' is_active,status" to include all auxiliary fields. This function will include
#' all auxiliary fields by default.
#'
#' @return returns a dataframe which includes the id mapping for CoinMarketCap
#' cryptocurrencies along with other metadata related to the currencies.
#' @export
#'
#' @examples
#' \dontrun{
#' api_key <- "..."
#' id_map <- coinmarketcap_id_map(api_key)}

coinmarketcap_id_map <- function(api_key
                                 , listing_status = 'active'
                                 , start = '1'
                                 , limit = NULL
                                 , sort = 'id'
                                 , symbol = NULL
                                 , aux = 'platform,first_historical_data,last_historical_data,is_active,status'){

  url <- 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/map'

  query_string <- list(
    listing_status = listing_status
    , start = start
    , limit = limit
    , sort = sort
    , symbol = symbol
    , aux = aux
  )

  data <- coinmarketcap_api_call(url, api_key, 'GET', query = query_string)
  return(data$data)
}

#-------------------------------------------------------------------------------
#------------------------------COINMARKETCAP METADATA---------------------------
#-------------------------------------------------------------------------------
#' coinmarketcap_metadata
#'
#' @param api_key your CoinMarketCap API key
#' @param id the id of the asset you wish to query. The default value is NULL;
#' however, each request must include either an id, slug, symbol, or contract
#' address. You can also pass multiple comma-separated values.
#' @param slug the slug of the asset you wish to query. The default value is
#' NULL. You can also pass multiple comma-separated values.
#' @param symbol the symbol of the asset you wish to query. The default value is
#' NULL. You can also pass multiple comma-separated values.
#' @param address the contract address of the asset you wish to query.
#' The default calue is NULL. You can also pass multiple comma-separated values.
#' @param aux Optionally specify a comma-separated list of supplemental data
#' fields to return. Pass "urls,logo,description,tags,platform,date_added,
#' notice,status" to include all auxiliary fields. This function will include
#' all auxiliary fields by default.
#'
#' @return returns a list which includes a dataframe for each asset you
#' requested. The dataframe will contain CoinMarketCap metadata for the asset.
#' @export
#'
#' @examples
#' \dontrun{
#' api_key <- "..."
#' metadata <- coinmarketcap_metadata(api_key, symbol = "BTC")}

coinmarketcap_metadata <- function(api_key
                                   , id = NULL
                                   , slug = NULL
                                   , symbol = NULL
                                   , address = NULL
                                   , aux = 'urls,logo,description,tags,platform,date_added,notice,status'){

  url <- 'https://pro-api.coinmarketcap.com/v2/cryptocurrency/info'

  query_string <- list(
    id = id
    , slug = slug
    , symbol = symbol
    , address = address
    , aux = aux
  )

  data <- coinmarketcap_api_call(url, api_key, 'GET', query = query_string)
  return(data$data)
}

#-------------------------------------------------------------------------------
#------------------------------COINMARKETCAP AIRDROP----------------------------
#-------------------------------------------------------------------------------
#' coinmarketcap_airdrop
#'
#' @param api_key your CoinMarketCap API key
#' @param id the unique airdrop id which can be found through the airdrops api.
#'
#' @return returns information about the airdrop for the id you provided.
#' @export
#'
#' @examples
#' \dontrun{
#' api_key <- "..."
#' id <- "10744"
#' airdrop <- coinmarketcap_airdrop(api_key, url)}

coinmarketcap_airdrop <- function(api_key, id){
  url <- 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/airdrop'
  query_string <- list(id = id)
  data <- coinmarketcap_api_call(url, api_key, 'GET', query = query_string)
  return(data)
}

#-------------------------------------------------------------------------------
#-----------------------------COINMARKETCAP CATEGORIES--------------------------
#-------------------------------------------------------------------------------
#' coinmarketcap_categories
#'
#' @param api_key your CoinMarketCap API key
#' @param start you can use this parameter to offset your first result. The
#' default value is "1".
#' @param limit an optional string value between 1 and 5000 which tells
#' CoinMarketCap how many results to return. The default value is NULL.
#' @param id filter categories by one or more asset ids. The default value is
#' NULL. Multiple values must be comma-separated.
#' @param slug filter categories by one or more asset slugs. The default value is
#' NULL. Multiple values must be comma-separated.
#' @param symbol filter categories by one or more asset symbols. The default
#' value is NULL. Multiple values must be comma-separated.
#'
#' @return returns a datafrane with information about CoinMarketCap asset
#' categories.
#' @export
#'
#' @examples
#' \dontrun{
#' api_key <- "..."
#' categories <- coinmarketcap_categories(api_key)}

coinmarketcap_categories <- function(api_key
                                  , start = "1"
                                  , limit = NULL
                                  , id = NULL
                                  , slug = NULL
                                  , symbol = NULL){

  url <- 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/categories'

  query_string <- list(
    start = start
    , limit = limit
    , id = id
    , slug = slug
    , symbol = symbol
  )

  data <- coinmarketcap_api_call(url, api_key, 'GET', query = query_string)
  return(data$data)
}

#-------------------------------------------------------------------------------
#------------------------------COINMARKETCAP CATEGORY---------------------------
#-------------------------------------------------------------------------------
#' coinmarketcap_category
#'
#' @param api_key your CoinMarketCap API key
#' @param id the category id you wish to query.
#' @param start you can use this parameter to offset your first result. The
#' default value is "1".
#' @param limit an optional string value between 1 and 5000 which tells
#' CoinMarketCap how many results to return. The default value is NULL.
#' @param convert Optionally calculate market quotes in up to 120 currencies at
#' once by passing a comma-separated list of cryptocurrency or fiat currency
#' symbols.
#' @param convert_id Optionally calculate market quotes by CoinMarketCap id
#' instead of symbol.
#'
#' @return returns a list with information about the specified category.
#' @export
#'
#' @examples
#' \dontrun{
#' api_key <- "..."
#' id <- "6363a6c9cd197958bb543bf0"
#' category <- coinmarketcap_category(api_key, id)}

coinmarketcap_category <- function(api_key
                                     , id
                                     , start = "1"
                                     , limit = NULL
                                     , convert = NULL
                                     , convert_id = NULL){

  url <- 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/category'

  query_string <- list(
    id = id
    , start = start
    , limit = limit
    , convert = convert
    , convert_id = convert_id
  )

  data <- coinmarketcap_api_call(url, api_key, 'GET', query = query_string)
  return(data$data)
}
