# Gemini

| Logo                                                                                                           | Name                              | Code   | cryptotrackr Docs                                                                        | Exchange Docs                           | Source Code                                                                      |
|------------|------------|------------|------------|------------|------------|
| ![gemini](https://user-images.githubusercontent.com/1294454/27816857-ce7be644-6096-11e7-82d6-3c257263229c.jpg) | [Gemini](https://www.gemini.com/) | gemini | [/docs/gemini.md](https://github.com/TrevorFrench/cryptotrackr/blob/main/docs/gemini.md) | [🏢](https://docs.gemini.com/rest-api/) | [/R/gemini.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/gemini.R) |

## Functions:

gemini_api_call, gemini_trades, gemini_symbols, gemini_price_feed

### gemini_api_call(key, secret, path, method)

-   Returns data from your Gemini API call

-   key: your API key for Gemini

-   secret: your secret key for Gemini

-   path: your API endpoint

-   method: "GET" or "POST"

-   The following example passes your key, secret, path, and method into the function and returns your historical trades in a dataframe named "data".

``` r
key <- "..."
secret <- "..."
path <- "/v1/mytrades"
method <- "POST"
data <- gemini_api_call(key, secret, path, method)
```

### gemini_trades(key, secret)

-   Returns a dataframe containing all of your historical trades.

-   key: your API key for Gemini

-   secret: your secret key for Gemini

-   The following example passes your secret and your key into the function and returns your historical trades in a dataframe named "df".

``` r
key <- "..."
secret <- "..."
df <- gemini_trades(secret, key)
```

### gemini_symbols()

-   Returns a vector containing all symbols available on Gemini

-   The following example gets all symbols available on Gemini and stores them in a vector named "symbols".

``` r
symbols <- gemini_symbols()
```

### gemini_price_feed()

-   Returns a dataframe containing pairs, their current price, and their 24 hour change in price

-   The following example gets a price feed from Gemini and stores it in a dataframe named "prices".

``` r
prices <- gemini_price_feed()
```
