# Coinlist

| Logo                                                                                                                                    | Name                             | Code     | cryptotrackr Docs                                                                            | Exchange Docs                                      | Source Code                                                                          |
|-----------------------------------------------------------------------------------------------------------------------------------------|----------------------------------|----------|----------------------------------------------------------------------------------------------|----------------------------------------------------|--------------------------------------------------------------------------------------|
| ![coinlist](https://coinlist.co/assets/shared/coinlist_logo_black-0a6489d220c15f8f95242acb727bacbdd9d8b36ed91027ed7af138992dcbb4ce.svg) | [Coinlist](https://coinlist.co/) | coinlist | [/docs/coinlist.md](https://github.com/TrevorFrench/cryptotrackr/blob/main/docs/coinlist.md) | [🏢](https://trade-docs.coinlist.co/#introduction) | [/R/coinlist.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/coinlist.R) |

## Functions:

coinlist_symbols, coinlist_time, coinlist_signature, coinlist_api_call

### coinlist_symbols()

-   Returns a dataframe with information about symbols available on Coinlist Pro

-   The following example gets information about symbols available on Coinlist Pro and stores it in a dataframe named "symbols".

``` r
symbols <- coinlist_symbols()
```

### coinlist_time()

-   Returns a timestamp for use in your Coinlist API calls

-   The following example gets the time in the Coinlist format and stores it in a variable named "coinlist_time"

``` r
coinlist_time <- coinlist_time()
```

### coinlist_signature(api_secret, coinlist_time, method, path, body)

-   Returns a signature for use in your Coinlist API calls

-   api_secret: your Coinlist API secret

-   coinlist_time: a timestamp in the correct format according to Coinlist

-   method: "GET" or "POST"

-   path: the path of your API call

-   body: the body of your API call

-   The following example passes the api_secret, coinlist_time, method, path, and body into the function and returns your Coinlist signature into a variable named "coinlist_signature".

``` r
api_secret <- "..."
coinlist_time <- coinlist_time()
method <- "GET"
path <- "/v1/accounts"
body <- ""
coinlist_signature <- coinlist_signature(api_secret, coinlist_time, method, path, body)
```

### coinlist_api_call(api_key, api_secret, method, path, body)

-   Returns a the response from your Coinlist API call

-   api_key: your Coinlist API key

-   api_secret: your Coinlist API secret

-   method: "GET" or "POST"

-   path: the path of your API call

-   body: the body of your API call

-   The following example passes the path, method, api_key, api_secret, and body into the function and stores the resulting API data into a variable named "data".

``` r
path <- "/v1/accounts"
method <- "GET"
api_key <- "..."
api_secret <- "..."
body <- ""
data <- coinlist_api_call(api_key, api_secret, method, path, body)
```
