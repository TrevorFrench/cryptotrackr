# Kucoin

| Logo                                                                                            | Name                              | Code   | cryptotrackr Docs                                                                        | Exchange Docs                  | Source Code                                                                      |
|-------------------------------------------------------------------------------------------------|-----------------------------------|--------|------------------------------------------------------------------------------------------|--------------------------------|----------------------------------------------------------------------------------|
| ![kucoin](https://assets.staticimg.com/cms/media/1lB3PkckFDyfxz6VudCEACBeRRBi6sQQ7DDjz0yWM.svg) | [Kucoin](https://www.kucoin.com/) | kucoin | [/docs/kucoin.md](https://github.com/TrevorFrench/cryptotrackr/blob/main/docs/kucoin.md) | [🏢](https://docs.kucoin.com/) | [/R/kucoin.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/kucoin.R) |

## Functions:

kucoin_time, kucoin_signature, kucoin_api_call, kucoin_subaccounts, kucoin_accounts, kucoin_symbols_list

### kucoin_time()

-   Returns a timestamp formatted in the way it is required in order to make an API call to Kucoin.

-   The following example gets a Kucoin timestamp string and stores it in a variable named "time".

``` r
time <- kucoin_time()
```

### kucoin_signature(api_secret, time, method, path, body)

-   Returns a signature for use in you Kucoin API calls.

-   api_secret: your Kucoin API secret

-   time: a timestamp string formatted the way Kucoin requires. This can be created with the "kucoin_time" function.

-   method: "GET" or "POST"

-   path: the endpoint you are using to make an API call.

-   body: needs to be a json string which matches url parameters. Use a blank string if not applicable.

-   The following example gets a signature for use in your Kucoin API call and stores it in a variable named "sig".

``` r
api_secret <- "..."
time <- kucoin_time()
method <- "GET"
path <- "/api/v1/sub/user"
body <- ""
sig <- kucoin_signature(api_secret, time, method, path, body)
```

### kucoin_api_call(url, method, api_key, sig, time, passphrase, version, api_secret, query)

-   Returns the data from your Kucoin API call.

-   url: the full url for your Kucoin API call

-   method: "GET" or "POST"

-   api_key: your Kucoin API key

-   sig: signature for use in your Kucoin API call. This can be generated with the "kucoin_signature" function.

-   time: a timestamp string formatted the way Kucoin requires. This can be created with the "kucoin_time" function.

-   passphrase: the passphrase you created when you created your Kucoin API key.

-   version: your API key version. This can be retrieved from your Kucoin API console.

-   api_secret: your Kucoin API secret.

-   query: a named list containing your query parameters.

-   The following example uses the function to create an api call to the subaccounts endpoint and stores the resulting data in a variable named "accounts".

``` r
url <- "https://api.kucoin.com/api/v1/sub/user"
api_key <- "..."
api_secret <- "..."
time <- kucoin_time()
method <- "GET"
path <- "/api/v1/sub/user"
body <- ""
sig <- kucoin_signature(api_secret, time, method, path, body)
passphrase <- "..."
version <- "2"

accounts <- kucoin_api_call(url, method, api_key, sig, time, passphrase, version, api_secret)
```

### kucoin_subaccounts(api_key, api_secret, passphrase, version)

-   Returns a list containing your Kucoin sub-accounts.

-   api_key: your Kucoin API key.

-   api_secret: your Kucoin API secret.

-   passphrase: the passphrase you created when you created your Kucoin API key.

-   version: your API key version. This can be retrieved from your Kucoin API console. The default value is "2".

-   The following example uses the function to create an api call to the subaccounts endpoint and stores the resulting data in a variable named "accounts".

``` r
api_key <- "..."
api_secret <- "..."
passphrase <- "..."
accounts <- kucoin_subaccounts(api_key, api_secret, passphrase)
```

### kucoin_accounts(api_key, api_secret, passphrase, version)

-   Returns a dataframe containing your Kucoin accounts and balances.

-   api_key: your Kucoin API key.

-   api_secret: your Kucoin API secret.

-   passphrase: the passphrase you created when you created your Kucoin API key.

-   version: your API key version. This can be retrieved from your Kucoin API console. The default value is "2".

-   The following example uses the function to create an api call to the accounts endpoint and stores the resulting data in a variable named "accounts".

``` r
api_key <- "..."
api_secret <- "..."
passphrase <- "..."
accounts <- kucoin_accounts(api_key, api_secret, passphrase)
```

### kucoin_symbols_list(market)

-   Returns a dataframe containing information about trading symbols

-   market: optionally provide a market to filter on. This function will return all markets by default.

-   The following example uses the function to create a dataframe named "symbols" which contains information about trading symbols.

``` r
symbols <- kucoin_symbols_list('btc')
```
