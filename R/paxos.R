#' paxos_bearer_token
#'
#' @param client_id the client id you generated when you created your API key
#' @param client_secret the client secret you generated when you created your
#' API key
#' @param scope the scope needed for your specific API call
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns your Paxos bearer token
#' @export
#'
#' @examples
#' \dontrun{
#' client_id <- "..."
#' client_secret <- "..."
#' scope <- 'funding:read_address'
#' token <- paxos_bearer_token(client_id, client_secret, scope)}

paxos_bearer_token <- function(client_id, client_secret, scope, timeout_seconds = 60) {
  request_body <- list('grant_type' = 'client_credentials'
                      , 'client_id' = client_id
                      , 'client_secret' = client_secret
                      , 'scope' = scope)
  res <- httr::POST('https://oauth.paxos.com/oauth2/token'
                    , body = request_body
                    , httr::timeout(timeout_seconds))
  data <- jsonlite::fromJSON(rawToChar(res$content))
  return(data$access_token)
}

#' paxos_list_profiles
#'
#' @param client_id the client id you generated when you created your API key
#' @param client_secret the client secret you generated when you created your
#' API key
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns a dataframe containing all user profiles
#' @export
#'
#' @examples
#' \dontrun{
#' client_id <- "..."
#' client_secret <- "..."
#' profiles <- paxos_list_profiles(client_id, client_secret)}

paxos_list_profiles <- function(client_id, client_secret, timeout_seconds = 60) {
  token <- paxos_bearer_token(client_id, client_secret, 'funding:read_profile')
  res <- httr::GET('https://api.paxos.com/v2/profiles',
                  httr::add_headers('Content-Type' = 'application/json'
                                    , 'accept' = 'application/json'
                                    , 'Authorization' = paste('Bearer ', token, sep = '')
                  )
                  , httr::timeout(timeout_seconds))
  data <- jsonlite::fromJSON(rawToChar(res$content))
  return(data$items)
}
