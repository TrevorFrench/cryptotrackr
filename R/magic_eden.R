#' magic_eden_transactions
#'
#' @param wallet the address of the wallet you are trying to query
#' @param offset optionally provide a numeric value to specify number of
#' transactions to skip.
#' @param limit optionally provide a numeric limit to specify maximum number of
#' results.
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns a dataframe containing all transactions for the specified
#' wallet.
#' @export
#'
#' @examples
#' wallet <- "72tXz6jhGVPFE8ZfAQocJPJU3HgxsdrRqKZoUdWUhs7o"
#' magic_eden_transactions(wallet, timeout_seconds = 4.5)

magic_eden_transactions <- function(wallet, offset = NULL, limit = NULL, timeout_seconds = 60) {
  url <- paste('http://api-mainnet.magiceden.dev/v2/wallets/'
               , wallet
               , '/activities'
               , sep = '')
  query <- list(offset = offset, limit = limit)

  tryCatch({
    res <- httr::GET(url, query = query, httr::timeout(timeout_seconds))

    if (res$status_code == 200) {
      data <- jsonlite::fromJSON(rawToChar(res$content))
      return(data)
    } else {
      stop(paste("API call failed with status code", res$status_code))
    }

  }, error = function(e) {
    message <- paste("Error during API call:", e$message)
    warning(message)
    return(NULL)
  })
}

#' magic_eden_tokens_owned
#'
#' @param wallet the address of the wallet you are trying to query
#' @param offset optionally provide a numeric value to specify number of
#' results to skip.
#' @param limit optionally provide a numeric limit to specify maximum number of
#' results.
#' @param list_status either "listed", "unlisted" or "both". The default is
#' "both".
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns a dataframe containing all tokens owned by specified wallet.
#' @export
#'
#' @examples
#' wallet <- "72tXz6jhGVPFE8ZfAQocJPJU3HgxsdrRqKZoUdWUhs7o"
#' magic_eden_tokens_owned(wallet, timeout_seconds = 4.5)

magic_eden_tokens_owned <- function(wallet
                                    , offset = NULL
                                    , limit = NULL
                                    , list_status = NULL
                                    , timeout_seconds = 60) {
  url <- paste('http://api-mainnet.magiceden.dev/v2/wallets/'
               , wallet
               , '/tokens'
               , sep = '')
  query <- list(offset = offset, limit = limit, listStatus = list_status)

  tryCatch({
    res <- httr::GET(url, query = query, httr::timeout(timeout_seconds))

    if (res$status_code == 200) {
      data <- jsonlite::fromJSON(rawToChar(res$content))
      return(data)
    } else {
      stop(paste("API call failed with status code", res$status_code))
    }

  }, error = function(e) {
    message <- paste("Error during API call:", e$message)
    warning(message)
    return(NULL)
  })
}

#' magic_eden_token_metadata
#'
#' @param mint_address the mint address of the token you wish to query
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns a list containing the token metadata for the specified mint
#' address.
#' @export
#'
#' @examples
#' mint_address <- "Hd6sxFEEQQA5aURaWaDesi23AkM19bBkKave1hyWvnfS"
#' magic_eden_token_metadata(mint_address, timeout_seconds = 4.5)

magic_eden_token_metadata <- function(mint_address, timeout_seconds = 60) {
  url <- paste('http://api-mainnet.magiceden.dev/v2/tokens/'
               , mint_address
               , sep = '')

  tryCatch({
    res <- httr::GET(url, httr::timeout(timeout_seconds))

    if (res$status_code == 200) {
      data <- jsonlite::fromJSON(rawToChar(res$content))
      return(data)
    } else {
      stop(paste("API call failed with status code", res$status_code))
    }

  }, error = function(e) {
    message <- paste("Error during API call:", e$message)
    warning(message)
    return(NULL)
  })
}

#' magic_eden_token_listings
#'
#' @param mint_address the mint address of the token you wish to query
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns a dataframe containing the token listings for the specified
#' mint address.
#' @export
#'
#' @examples
#' mint_address <- "Hd6sxFEEQQA5aURaWaDesi23AkM19bBkKave1hyWvnfS"
#' magic_eden_token_listings(mint_address, timeout_seconds = 4.5)

magic_eden_token_listings <- function(mint_address, timeout_seconds = 60) {
  url <- paste('http://api-mainnet.magiceden.dev/v2/tokens/'
               , mint_address
               , '/listings'
               , sep = '')

  tryCatch({
    res <- httr::GET(url, httr::timeout(timeout_seconds))

    if (res$status_code == 200) {
      data <- jsonlite::fromJSON(rawToChar(res$content))
      return(data)
    } else {
      stop(paste("API call failed with status code", res$status_code))
    }

  }, error = function(e) {
    message <- paste("Error during API call:", e$message)
    warning(message)
    return(NULL)
  })
}

#' magic_eden_collection_stats
#'
#' @param symbol the collection symbol you are requesting data for
#' @param timeout_seconds seconds until the query times out. Default is 60.
#'
#' @return returns a list containing statistics about the specified collection.
#' @export
#'
#' @examples
#' symbol <- "gothic_degens"
#' magic_eden_collection_stats(symbol, timeout_seconds = 4.5)

magic_eden_collection_stats <- function(symbol, timeout_seconds = 60) {
  url <- paste('http://api-mainnet.magiceden.dev/v2/collections/'
               , symbol
               , '/stats'
               , sep = '')

  tryCatch({
    res <- httr::GET(url, httr::timeout(timeout_seconds))

    if (res$status_code == 200) {
      data <- jsonlite::fromJSON(rawToChar(res$content))
      return(data)
    } else {
      stop(paste("API call failed with status code", res$status_code))
    }

  }, error = function(e) {
    message <- paste("Error during API call:", e$message)
    warning(message)
    return(NULL)
  })
}
