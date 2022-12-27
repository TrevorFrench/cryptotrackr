# CoinGecko

| Logo                                     | Name                                    | Code      | cryptotrackr Docs                                                                              | Exchange Docs                                        | Source Code                                                                            |
|------------|------------|------------|------------|------------|------------|
| ![coingecko](/man/figures/coingecko.png) | [CoinGecko](https://www.coingecko.com/) | coingecko | [/docs/coingecko.md](https://github.com/TrevorFrench/cryptotrackr/blob/main/docs/coingecko.md) | [🏢](https://www.coingecko.com/en/api/documentation) | [/R/coingecko.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/coingecko.R) |

## Functions:

coingecko_ping, coingecko_vs_currencies

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
