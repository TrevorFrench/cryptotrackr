% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/solana.R
\name{solana_get_version}
\alias{solana_get_version}
\title{solana_get_version}
\usage{
solana_get_version(url)
}
\arguments{
\item{url}{the RPC url for your API call}
}
\value{
Returns the current Solana version running on the node
}
\description{
solana_get_version
}
\examples{
url <- "https://api.devnet.solana.com"
data <- solana_get_version(url)
}