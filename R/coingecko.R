#-------------------------------------------------------------------------------
#------------------------------------ACTION LIST--------------------------------
#-------------------------------------------------------------------------------
# -

#-------------------------------------------------------------------------------
#----------------------------------COINGECKO PING-------------------------------
#-------------------------------------------------------------------------------
#' coingecko_ping
#'
#' @return returns the Coingecko API server status
#' @export
#'
#' @examples
#' \dontrun{
#' status <- coingecko_ping()}

coingecko_ping <- function() {
  res <- httr::VERB('GET'
                    , 'https://api.coingecko.com/api/v3/ping'
                    , httr::accept("application/json")
                    )
  data = jsonlite::fromJSON(rawToChar(res$content))
  return(data)
}

#-------------------------------------------------------------------------------
#------------------------------COINGECKO VS CURRENCIES--------------------------
#-------------------------------------------------------------------------------
#' coingecko_vs_currencies
#'
#' @return returns a character vector containg all supported currencies on
#' Coingecko.
#' @export
#'
#' @examples
#' \dontrun{
#' vs_currencies <- coingecko_vs_currencies()}

coingecko_vs_currencies <- function() {
  url <- 'https://api.coingecko.com/api/v3/simple/supported_vs_currencies'
  res <- httr::VERB('GET'
                    , url
                    , httr::accept("application/json")
  )
  data = jsonlite::fromJSON(rawToChar(res$content))
  return(data)
}
