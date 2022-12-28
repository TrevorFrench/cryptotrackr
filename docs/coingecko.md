# CoinGecko

| Logo                                     | Name                                    | Code      | cryptotrackr Docs                                                                              | Exchange Docs                                        | Source Code                                                                            |
|------------|------------|------------|------------|------------|------------|
| ![coingecko](/man/figures/coingecko.png) | [CoinGecko](https://www.coingecko.com/) | coingecko | [/docs/coingecko.md](https://github.com/TrevorFrench/cryptotrackr/blob/main/docs/coingecko.md) | [🏢](https://www.coingecko.com/en/api/documentation) | [/R/coingecko.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/coingecko.R) |

## Functions:

coingecko_ping, coingecko_vs_currencies, coingecko_coins, coingecko_price, coingecko_categories

### coingecko_ping()

-   Returns the Coingecko API server status

-   The following example pings the CoinGecko API and stores the resulting list in a variable named "status".

``` r
status <- coingecko_ping()
```

### coingecko_vs_currencies()

-   Returns a character vector containg all supported currencies on Coingecko.

-   The following example gets all vs_currencies supported on CoinGecko and stores them in a character vector named "vs_currencies".

``` r
vs_currencies <- coingecko_vs_currencies()
```

### coingecko_coins(include_platform)

-   Returns a dataframe containing all coins on CoinGecko and their respective ids, symbols, and names.

-   include_platform: optionally select either "true" or "false" to include platform contract tokens.

-   The following example gets information on all coins on CoinGecko and stores the data in a dataframe named "coins".

``` r
coins <- coingecko_coins()
```

### coingecko_price(id, vs_currency, include_market_cap, include_24hr_vol, include_24hr_change, include_last_updated_at, precision)

-   Returns a list of currency prices

-   id: one or more comma-separated asset ids to query

-   vs_currency: one or more comma-separated vs_currencies to query

-   include_market_cap: optionally provide a 'true' or 'false' value to include/exclude market cap. The default is 'false'.

-   include_24hr_vol: optionally provide a 'true' or 'false' value to include/exclude 24-hour volume. The default is 'false'.

-   include_24hr_change: optionally provide a 'true' or 'false' value to include/exclude the 24-hour price change. The default is 'false'.

-   include_last_updated_at: optionally provide a 'true' or 'false' value to include/exclude the last updated information. The default is 'false'.

-   precision: optionally specify the decimal precision to return. Choose either 'full' or any number between 0 and 18.

-   The following example gets the price of Bitcoin denominated in USD and stores the data in a list named "prices" .

``` r
prices <- coingecko_price(id = 'bitcoin', vs_currency = 'usd')
```

### coingecko_categories()

-   Returns a dataframe of all categories on CoinGecko.

-   The following example gets all categories on CoinGecko and stores the resulting data in a dataframe named "categories".

``` r
categories <- coingecko_categories()
```
