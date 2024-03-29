% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/crypto_dot_com.R
\name{crypto_dot_com_get_ticker}
\alias{crypto_dot_com_get_ticker}
\title{crypto_dot_com_get_ticker}
\usage{
crypto_dot_com_get_ticker(instrument)
}
\arguments{
\item{instrument}{the instrument name which you want to query}
}
\value{
returns ticker data for specified instrument. Refer to Crypto.com for
help interpreting response data:
https://exchange-docs.crypto.com/spot/index.html#public-get-ticker
}
\description{
crypto_dot_com_get_ticker
}
\examples{
crypto_dot_com_get_ticker("BTC_USDT")
}
