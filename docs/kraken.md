# Kraken

| Logo                                                                                                            | Name                              | Code   | cryptotrackr Docs                                                                        | Exchange Docs                       | Source Code                                                                      |
|-----------------------------------------------------------------------------------------------------------------|-----------------------------------|--------|------------------------------------------------------------------------------------------|-------------------------------------|----------------------------------------------------------------------------------|
| ![kraken](https://user-images.githubusercontent.com/51840849/76173629-fc67fb00-61b1-11ea-84fe-f2de582f58a3.jpg) | [Kraken](https://www.kraken.com/) | kraken | [/docs/kraken.md](https://github.com/TrevorFrench/cryptotrackr/blob/main/docs/kraken.md) | [🏢](https://docs.kraken.com/rest/) | [/R/kraken.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/kraken.R) |

## Functions:

kraken_server_time, kraken_server_status, kraken_asset_info, kraken_asset_pairs, kraken_ticker_info

### kraken_server_time()

-   Returns a list with Kraken's server time in unix and rfc1123 formats

-   The following example retrieves the Kraken server time and stores it in a list named "time".

``` r
time <- kraken_server_time()
```

### kraken_server_status()

-   Returns a list with Kraken's server status along with a timestamp

-   The following example retrieves the Kraken server status and stores it in a variable named "status".

``` r
status <- kraken_server_status()
```

### kraken_asset_info(asset, aclass)

-   Returns a list containing asset information.

-   asset: optionally provide one or more comma-separated ticker symbols.

-   aclass: optionally provide asset categories to filter by.

-   The following example calls the function three times. The first call accept all defaults and stores the maximum amount of information in a list named "all_asset_info". The second example only pulls information for ETH and BTC and stores the information in a list named "eth_btc_info". The third example only pulls information for assets which are classified as currencies and stores the information in a list named "currency_info".

``` r
all_asset_info <- kraken_asset_info()
eth_btc_info <- kraken_asset_info("ETH,BTC")
currency_info <- kraken_asset_info(aclass = "currency")
```

### kraken_asset_pairs(pair, info)

-   Returns a list containing information on Kraken asset pairs.

-   pair: optionally provide one or more comma-separated asset pairs to query.

-   info: optionally select the information to return. You can choose from: "info" (all info), "leverage" (leverage info), "fees" (fee schedule), or "margin" (margin info).

-   The following example gets a list containing information on all asset pairs available to trade on Kraken and stores the data in a list named "asset_pairs".

``` r
asset_pairs <- kraken_asset_pairs()
```

### kraken_ticker_info(pair)

-   Returns a list containing ticker info for assets on Kraken. Refer to Kraken for help interpreting response data: <https://docs.kraken.com/rest/#tag/Market-Data/operation/getTickerInformation>

-   pair optionally provide one or more comma-separated asset pairs.

-   The following example gets a list containing ticker information for "ETHUSD" and stores the data in a list named "ticker_info".

``` r
ticker_info <- kraken_ticker_info("ETHUSD")
```
