# CEX.IO

| Logo                                                                                                           | Name                      | Code   | cryptotrackr Docs                                                                        | Exchange Docs                                      | Source Code                                                                      |
|----------------------------------------------------------------------------------------------------------------|---------------------------|--------|------------------------------------------------------------------------------------------|----------------------------------------------------|----------------------------------------------------------------------------------|
| ![cex_io](https://user-images.githubusercontent.com/1294454/27766442-8ddc33b0-5ed8-11e7-8b98-f786aef0f3c9.jpg) | [CEX.IO](https://cex.io/) | cex_io | [/docs/cex_io.md](https://github.com/TrevorFrench/cryptotrackr/blob/main/docs/cex_io.md) | [🏢](https://docs.cex.io/#cex-io-api-introduction) | [/R/cex_io.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/cex_io.R) |

## Functions:

cex_io_ticker, cex_io_currency_limits, cex_io_last_price, cex_io_convertor, cex_io_ohlcv, cex_io_nonce, cex_io_signature, cex_io_balance

### cex_io_ticker(symbol_1, symbol_2)

-   Returns a list with basic trading information about your specified currency pair for the last 24 hours.

-   symbol_1: the first currency in your pair

-   symbol_2: the second currency in your pair

-   The following example passes "btc" and "usd" into the function and returns trading information about the pair for the last 24 hours in a list named "ticker_info".

``` r
symbol_1 <- 'btc'
symbol_2 <- 'usd'
ticker_info <- cex_io_ticker(symbol_1, symbol_2)
```

### cex_io_currency_limits()

-   Returns a dataframe with information about currency limits on CEX.io.

-   The following example gets information about currency limits on CEX.IO and stores it in a dataframe named "currency_limits".

``` r
currency_limits <- cex_io_currency_limits()
```

### cex_io_last_price(symbol_1, symbol_2)

-   Returns a list with the last price of your specified currency pair.

-   symbol_1: the first currency in your pair

-   symbol_2: the second currency in your pair

-   The following example gets the price of "btc" denominated in "usd" and stores it in a list named "last_price".

``` r
symbol_1 <- 'btc'
symbol_2 <- 'usd'
last_price <- cex_io_last_price(symbol_1, symbol_2)
```

### cex_io_convertor(symbol_1, symbol_2, amount)

-   Returns the converted amount denominated in symbol_2

-   symbol_1: the first currency in your pair

-   symbol_2: the second currency in your pair

-   amount: the currency amount to convert denominated in symbol_1

-   The following example returns the value of 2.5 "btc" denominated in "usd".

``` r
symbol_1 <- 'btc'
symbol_2 <- 'usd'
amount <- '2.5'
converted <- cex_io_converter(symbol_1, symbol_2, amount)
```

### cex_io_ohlcv(date, symbol_1, symbol_2)

-   Returns a list containing open, high, low, close, volume data for the past minute, hour, and day

-   date: the date for which to retrieve data

-   symbol_1: the first currency in your pair

-   symbol_2: the second currency in your pair

-   The following example returns the ohlcv volume for the "btc"/"usd" trading pair on September 27, 2022 and stores it in a list named "ohlcv".

``` r
date <- '20220927'
symbol_1 <- 'btc'
symbol_2 <- 'usd'
ohlcv <- cex_io_ohlcv(date, symbol_1, symbol_2)
```

### cex_io_nonce()

-   Returns a nonce for use in your signature

-   The following example returns a nonce for use in your CEX.IO signature and stores it in a variable named "nonce".

``` r
nonce <- cex_io_nonce()
```

### cex_io_signature(username, api_key, api_secret, nonce)

-   Returns a signature for use in your API call

-   username: your cex.io username

-   api_key: your cex.io api_key

-   api_secret: your cex.io api_secret

-   nonce: a nonce to use in your signature and request body

-   The following example calls the nonce function and stores the result in a variable named "nonce" and then passes nonce, username, api_key, and api_secret into the function. The result of this function is then stored in a variable named "sig"

``` r
nonce <- cex_io_nonce()
username <- "..."
api_key <- "..."
api_secret <- "..."
sig <- cex_io_signature(username, api_key, api_secret, nonce)
```

### cex_io_balance(username, api_key, api_secret)

-   Returns a list with your balances for each currency

-   username: your cex.io username

-   api_key: your cex.io api_key

-   api_secret: your cex.io api_secret

-   The following example passes your username, api_secret, and api_key into the function and returns a list of your CEX.IO balances for each available currency. This list is then stored in a variable named "balances".

``` r
username <- "..."
api_key <- "..."
api_secret <- "..."
balances <- cex_io_balance(username, api_key, api_secret)
```

### 
