# Coinbase

| Logo                                                                                                             | Name                                  | Code     | cryptotrackr Docs                                                                            | Exchange Docs                                                      | Source Code                                                                          |
|------------|------------|------------|------------|------------|------------|
| ![coinbase](https://user-images.githubusercontent.com/1294454/40811661-b6eceae2-653a-11e8-829e-10bfadb078cf.jpg) | [Coinbase](https://www.coinbase.com/) | coinbase | [/docs/coinbase.md](https://github.com/TrevorFrench/cryptotrackr/blob/main/docs/coinbase.md) | [🏢](https://docs.cloud.coinbase.com/advanced-trade-api/reference) | [/R/coinbase.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/coinbase.R) |

## Functions:

coinbase_all_currencies, coinbase_single_currency, coinbase_time, coinbase_signature, coinbase_api_call, coinbase_accounts

### coinbase_all_currencies()

-   Returns a dataframe with information about all currencies known to Coinbase

-   The following example gets information about all currencies known to Coinbase and stores it in a dataframe named "currencies".

``` r
currencies <- coinbase_all_currencies()
```

### coinbase_single_currency(currency)

-   Returns a list with details related to the specified currency

-   currency: the currency id for the relevant asset

-   The following example gets information about 'btc' and stores the data in a list named "currency_data".

``` r
currency <- 'btc'
currency_data <- coinbase_single_currency(currency)
```

### coinbase_time()

-   Returns a timestamp for use in your Coinbase API calls

-   The following example gets a timestamp in the correct Coinbase format and stores it in a variable named "coinbase_time".

``` r
coinbase_time <- coinbase_time()
```

### coinbase_signature(api_secret, coinbase_time, method, path, body)

-   Returns a signature for use in your Coinbase API calls

-   api_secret: your Coinbase API secret

-   coinbase_time: a timestamp in the correct format according to Coinbase

-   method: "GET" or "POST"

-   path: the path of your API call

-   body: the body of your API call

-   The following example passes the api_secret, coinbase_time, method, path, and body into the function and stores the resulting signature data in a variable named "coinbase_signature".

``` r
api_secret <- "..."
coinbase_time <- coinbase_time()
method <- "GET"
path <- "/api/v3/brokerage/accounts"
body <- ""
coinbase_signature <- coinbase_signature(api_secret, coinbase_time, method, path, body)
```

### coinbase_api_call(api_key, api_secret, method, path, body)

-   Returns the response from your Coinbase API call

-   api_key: your Coinbase API key

-   api_secret: your Coinbase API secret

-   method: "GET" or "POST"

-   path: the path of your API call

-   body: the body of your API call

-   The following example passes the path, method, api_key, api_secret, and body into the function and stores the resulting API data in a variable named "data".

``` r
path <- "/api/v3/brokerage/accounts"
method <- "GET"
api_key <- "..."
api_secret <- "..."
body <- ""
data <- coinbase_api_call(api_key, api_secret, method, path, body)
```

### coinbase_accounts(api_key, api_secret)

-   Returns a dataframe with information about your Coinbase accounts

-   api_key: your Coinbase API key

-   api_secret: your Coinbase API secret

-   The following example passes the api_key and the api_secret into the function and stores the resulting account data in a dataframe named "accounts".

``` r
api_key <- "..."
api_secret <- "..."
accounts <- coinbase_accounts(api_key, api_secret)
```
