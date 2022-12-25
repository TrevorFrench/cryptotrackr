#-------------------------------------------------------------------------------
#------------------------------------ACTION LIST--------------------------------
#-------------------------------------------------------------------------------
# -

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
    listing_status = listing_status,
    start = start,
    limit = limit,
    sort = sort,
    symbol = symbol,
    aux = aux
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
    id = id,
    slug = slug,
    symbol = symbol,
    address = address,
    aux = aux
  )

  data <- coinmarketcap_api_call(url, api_key, 'GET', query = query_string)
  return(data$data)
}
