# Binance.US

| Logo                                                                                                                                 | Name                              | Code       | cryptotrackr Docs                                                                                | Exchange Docs                  | Source Code                                                                              |
|------------|------------|------------|------------|------------|------------|
| ![binance_us](https://user-images.githubusercontent.com/1294454/65177307-217b7c80-da5f-11e9-876e-0b748ba0a358.jpg){alt="binance_us"} | [Binance.US](https://binance.us/) | binance_us | [/docs/binance_us.md](https://github.com/TrevorFrench/cryptotrackr/blob/main/docs/binance_us.md) | [🏢](https://docs.binance.us/) | [/R/binance_us.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/binance_us.R) |

## Functions:

binance_us_time, binance_us_signature, binance_us_api_call, binance_us_account_info, binance_us_recent_trades

### binance_us_time()

-   Returns a timestamp in the format that Binance.US expects

-   The following example retrieves the formatted Binance.US time for use in a Binance.US API call and stores it in a variable named "time"

``` r
time <- binance_us_time()
```

### binance_us_signature(data, secret)

-   Returns your Binance.US signature for use in API calls

-   data: your URL encoded query parameters

-   secret: your Binance.US secret key

-   The following example retrieves the formatted binance_us_time and puts it into the message data then passes the message data and the secret into the function to retrieve a signature for use in a Binance.US API call

``` r
time <- binance_us_time()
data <- paste('timestamp=', time, sep = '')
secret <- "..."
signature <- binance_us_signature(data, secret)
```

### binance_us_api_call(url, key, data, secret)

-   Executes an authenticated API call

-   url: the base url and endpoint followed by '?' for your API call

-   key: your Binance.US API key

-   data: your URL encoded query parameters

-   secret: your Binance.US secret key

-   The following example retrieves the formatted binance_us_time and puts it into the message data then passes the message data, the secret, the URL, and the key into the function to execute a Binance.US API call

``` r
key <- "..."
secret <- "..."
time <- binance_us_time()
data <- paste('timestamp=', time, sep = '')
url <- 'https://api.binance.us/api/v3/account'
data <- binance_us_api_call(url, key, data, secret)
```

### binance_us_account_info(url, key, data, secret)

-   Returns a list containing information about your account

-   key: your Binance.US API key

-   secret: your Binance.US secret key

-   The following example passes the key and the secret into the function and stores the account information in a variable named "account_info"

``` r
key <- "..."
secret <- "..."
account_info <- binance_us_account_info(key, secret)
```

### binance_us_recent_trades(symbol, limit)

-   Returns a dataframe containing the most recent trades executed for the designated currency pair on Binance.US

-   symbol: the trading pair for which you wish to retrieve data

-   limit: the number of results to return. The maximum is 1,000.

-   The following example passes the symbol "LTCBTC" and the limit of "1000" into the function and stores the recent trades in a variable named "recent_trades"

``` r
symbol <- 'LTCBTC'
limit <- '1000'
recent_trades <- binance_us_recent_trades(symbol, limit)
```
