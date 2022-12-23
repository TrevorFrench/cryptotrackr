# OkCoin

| Logo                                                                                                            | Name                              | Code   | cryptotrackr Docs                                                                        | Exchange Docs                         | Source Code                                                                      |
|------------|------------|------------|------------|------------|------------|
| ![okcoin](https://user-images.githubusercontent.com/51840849/87295551-102fbf00-c50e-11ea-90a9-462eebba5829.jpg) | [OkCoin](https://www.okcoin.com/) | okcoin | [/docs/okcoin.md](https://github.com/TrevorFrench/cryptotrackr/blob/main/docs/okcoin.md) | [🏢](https://www.okcoin.com/docs/en/) | [/R/okcoin.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/okcoin.R) |

## Functions:

okcoin_trading_pairs, okcoin_orders, okcoin_spot_account_info, okcoin_time, okcoin_signature, okcoin_api_call

### okcoin_trading_pairs()

-   Returns a dataframe containing information about all trading pairs on Okcoin.

-   The following example gets information about OkCoin trading pairs and stores the result in a dataframe named "trading_pairs".

``` r
trading_pairs <- okcoin_trading_pairs()
```

### okcoin_orders(secret, key, passphrase, instrument_id, state)

-   Returns a dataframe containing your orders from the most recent 3 months.

-   secret: your secret key for Okcoin

-   key: your API key for Okcoin

-   passphrase: the passphrase which you created when generating your Okcoin API key

-   instrument_id: the trading pair symbol

-   state: Order Status: -1: Canceled, 0: Open, 1: Partially Filled, 2: Fully Filled, 3: Submitting, 4: Canceling, 6: Incomplete (open + partially filled), 7: Complete (canceled + fully filled)

-   The following example retrieves all "Fully Filled" orders related to the "BTC-USDT" trading pair for the user and stores the resulting data in a dataframe named "orders".

``` r
secret <- "..."
key <- "..."
passphrase <- "..."
instrument_id <- "BTC-USDT"
state <- '2'
orders <- okcoin_orders(secret, key, passphrase, instrument_id, state)
```

### okcoin_spot_account_info(secret, key, passphrase)

-   Returns a dataframe containing your spot account balances.

-   secret: your secret key for Okcoin

-   key: your API key for Okcoin

-   passphrase: the passphrase which you created when generating your Okcoin API key

-   The following example retrieves spot account balances for the user and stores the resulting data in a dataframe named "balances".

``` r
secret <- "..."
key <- "..."
passphrase <- "..."
balances <- okcoin_spot_account_info(secret, key, passphrase)
```

### okcoin_time()

-   Returns a string with the current timestamp in ISO 8601 format.

-   The following example generates a string with the current timestamp in ISO 8601 format and stores it in a variable named "formatted_time".

``` r
formatted_time <- okcoin_time()
```

### okcoin_signature(path, secret, formatted_time, method)

-   Returns a base64 encoded SHA256 signature for signing Okcoin API calls.

-   path: the API endpoint

-   secret: your Okcoin secret key

-   formatted_time: a string containing the currrent timestamp in ISO 8601 format

-   method: 'POST' or 'GET'

-   The following example generates a signature for use in your OkCoin API call and stores it in a variable named "signature".

``` r
path <- "..."
secret <- "..."
formatted_time <- okcoin_time()
method <- "GET"
signature <- okcoin_signature(path, secret, formatted_time, method)
```

### okcoin_api_call(url, key, signature, formatted_time, passphrase)

-   Returns a dataframe containing the results of your API call.

-   url: the full URL for the API call

-   key: your API key for Okcoin

-   signature: your hashed and encoded signature for Okcoin API calls

-   formatted_time: a string containing the currrent timestamp in ISO 8601 format

-   passphrase: the passphrase which you created when generating your Okcoin API key

-   The following example makes an OkCoin API call and stores the resulting data in a variable named "data".

``` r
url <- "..."
key <- "..."
path <- "..."
secret <- "..."
formatted_time <- okcoin_time()
method <- "GET"
signature <- okcoin_signature(path, secret, formatted_time, method)
passphrase <- "..."
data <- okcoin_api_call()
```
