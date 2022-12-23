# Kraken

| Logo                                                                                                            | Name                              | Code   | cryptotrackr Docs                                                                        | Exchange Docs                       | Source Code                                                                      |
|------------|------------|------------|------------|------------|------------|
| ![kraken](https://user-images.githubusercontent.com/51840849/76173629-fc67fb00-61b1-11ea-84fe-f2de582f58a3.jpg) | [Kraken](https://www.kraken.com/) | kraken | [/docs/kraken.md](https://github.com/TrevorFrench/cryptotrackr/blob/main/docs/kraken.md) | [🏢](https://docs.kraken.com/rest/) | [/R/kraken.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/kraken.R) |

## Functions:

kraken_server_time, kraken_server_status

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
