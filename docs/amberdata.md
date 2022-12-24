# Amberdata

| Logo                                                                  | Name                                   | Code      | cryptotrackr Docs                                                                              | Exchange Docs                    | Source Code                                                                            |
|------------|------------|------------|------------|------------|------------|
| ![amberdata](https://www.amberdata.io/hubfs/amberdata_logo_color.svg) | [Amberdata](https://www.amberdata.io/) | amberdata | [/docs/amberdata.md](https://github.com/TrevorFrench/cryptotrackr/blob/main/docs/amberdata.md) | [🏢](https://docs.amberdata.io/) | [/R/amberdata.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/amberdata.R) |

## Functions:

amberdata_api_call, amberdata_spot_exchanges

### amberdata_api_call(url, api_key, method, query)

-   Returns data from your Amberdata API call

-   url: the url for your Amberdata API call

-   api_key: your Amberdata API key

-   method: "GET" or "POST"

-   query: your query parameters. The default value is NULL.

-   The following example passes the API key, the request method, and the url into the function and stores the resulting data in a variable named "exchanges".

``` r
api_key <- "..."
url <- "https://web3api.io/api/v2/market/exchanges"
method <- "GET"
exchanges <- amberdata_api_call(url, api_key, method)
```

### amberdata_spot_exchanges(api_key, exchange, pair, include_dates, time_format)

-   Returns a list of spot exchanges and pairs supported on Amberdata with the option of including the dates each one was supported.

-   api_key: your Amberdata API key

-   exchange: choose a specific exchange or multiple exchanges (comma-separated) rather than all exchanges

-   pair: choose a specific pair or multiple pairs (comma-separated) rather than all pairs

-   include_dates: include a start date and an end date along with your data. Default is "false"

-   time_format: the format to return your times in. Chosse from: "milliseconds", "ms", "iso", "iso8601", "hr", and "human_readable". Default is "ms".

-   The following example calls the function twice. The first call accepts all defaults and stores the list in a variable named "exchanges". The second call tells the function to only return results related to "gdax" where the currency pair is "1inch_btc" or "ada_usd". It also tells the function to include the dates in "hr" (human readable) format. The response is stored in a list named "gdax".

``` r
api_key <- "..."
exchanges <- amberdata_spot_exchanges(api_key)
gdax <- amberdata_spot_exchanges(api_key, "gdax", "1inch_btc,ada_usd", "true", "hr")
```

### 
