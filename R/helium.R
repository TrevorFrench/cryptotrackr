#-------------------------------------------------------------------------------
#------------------------------------ACTION LIST--------------------------------
#-------------------------------------------------------------------------------
# - Check examples with cursor for pagination

#-------------------------------------------------------------------------------
#-----------------------------HELIUM BLOCKCHAIN STATS---------------------------
#-------------------------------------------------------------------------------
#' helium_blockchain_stats
#'
#' @return returns a list containing statistics about the Helium blockchain
#' @export
#'
#' @examples
#' \dontrun{
#' stats <- helium_blockchain_stats()}

helium_blockchain_stats <- function() {
  res = httr::GET('https://api.helium.io/v1/stats')
  data = jsonlite::fromJSON(rawToChar(res$content))
  return(data$data)
}

#-------------------------------------------------------------------------------
#-------------------------------HELIUM TOKEN SUPPLY-----------------------------
#-------------------------------------------------------------------------------
#' helium_token_supply
#'
#' @return returns the token supply of the Helium blockchain
#' @export
#'
#' @examples
#' \dontrun{
#' token_supply <- helium_token_supply()}

helium_token_supply <- function() {
  res = httr::GET('https://api.helium.io/v1/stats/token_supply')
  data = jsonlite::fromJSON(rawToChar(res$content))
  return(data$data$token_supply)
}

#-------------------------------------------------------------------------------
#----------------------------------HELIUM HEIGHT--------------------------------
#-------------------------------------------------------------------------------
#' helium_height
#'
#' @return returns the height of the Helium blockchain
#' @export
#'
#' @examples
#' \dontrun{
#' height <- helium_height()}

helium_height <- function() {
  res = httr::GET('https://api.helium.io/v1/blocks/height')
  data = jsonlite::fromJSON(rawToChar(res$content))
  return(data$data$height)
}

#-------------------------------------------------------------------------------
#--------------------------------HELIUM BLOCK STATS-----------------------------
#-------------------------------------------------------------------------------
#' helium_block_stats
#'
#' @return returns a list containing block production statistics
#' @export
#'
#' @examples
#' \dontrun{
#' block_stats <- helium_block_stats()}

helium_block_stats <- function() {
  res = httr::GET('https://api.helium.io/v1/blocks/stats')
  data = jsonlite::fromJSON(rawToChar(res$content))
  return(data$data)
}

#-------------------------------------------------------------------------------
#-----------------------------HELIUM BLOCK DESCRIPTIONS-------------------------
#-------------------------------------------------------------------------------
#' helium_block_descriptions
#'
#' @param cursor used to retrieve more results. Default value is NULL.
#'
#' @return returns a list contaning block descriptions. a cursor field will be returned if there are more results.
#' @export
#'
#' @examples
#' \dontrun{
#' block_descriptions <- helium_block_descriptions()
#'
#' cursor <- block_descriptions$cursor
#' block_descriptions <- helium_block_descriptions(cursor)}

helium_block_descriptions <- function(cursor = NULL) {
  res = httr::GET('https://api.helium.io/v1/blocks'
                  , query = list('cursor' = cursor))
  data = jsonlite::fromJSON(rawToChar(res$content))
  return(data)
}

#-------------------------------------------------------------------------------
#-----------------------------HELIUM BLOCK AT HEIGHT----------------------------
#-------------------------------------------------------------------------------
#' helium_block_at_height
#'
#' @param height the blockchain height
#'
#' @return returns a list containing descriptors for the block at specified height
#' @export
#'
#' @examples
#' \dontrun{
#' height <- '213787'
#' block <- helium_block_at_height(height)}

helium_block_at_height <- function(height) {
  res = httr::GET(paste('https://api.helium.io/v1/blocks/', height, sep = ''))
  data = jsonlite::fromJSON(rawToChar(res$content))
  return(data$data)
}

#-------------------------------------------------------------------------------
#---------------------------HELIUM TRANSACTIONS AT HEIGHT-----------------------
#-------------------------------------------------------------------------------
#' helium_transactions_at_height
#'
#' @param height the blockchain height
#' @param cursor used to retrieve more results. Default value is NULL.
#'
#' @return returns a list containing block production statistics
#' @export
#'
#' @examples
#' \dontrun{
#' height <- '213787'
#' block_stats <- helium_block_descriptions(height)
#'
#' cursor <- block_stats$cursor
#' block_stats <- helium_block_descriptions(height, cursor)}

helium_transactions_at_height <- function(height, cursor = NULL) {
  res = httr::GET(paste('https://api.helium.io/v1/blocks/', height, '/transactions', sep = '')
                  , query = list('cursor' = cursor))
  data = jsonlite::fromJSON(rawToChar(res$content))
  return(data$data)
}
