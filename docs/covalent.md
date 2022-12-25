# Covalent

| Logo                                                                        | Name                                    | Code     | cryptotrackr Docs                                                                            | Exchange Docs                              | Source Code                                                                          |
|------------|------------|------------|------------|------------|------------|
| ![covalent](/man/figures/Covalent_Wordmark_Three_Color.png) | [Covalent](https://www.covalenthq.com/) | Covalent | [/docs/covalent.md](https://github.com/TrevorFrench/cryptotrackr/blob/main/docs/covalent.md) | [🏢](https://www.covalenthq.com/docs/api/) | [/R/covalent.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/covalent.R) |

## Functions:

covalent_api_call, covalent_balances

### covalent_api_call(url, method, query, csv)

-   Returns your Covalent API data

-   url: the Covalent URL for use in your API call

-   method: 'GET' or 'POST'

-   query: your query parameters formatted as a named list

-   csv: 'TRUE' will return csv data parsed as a dataframe while 'FALSE' will return json data. The default value is 'FALSE'.

-   The following example queries the account balances for "trevorfrench.eth" on chain "1" and stores the resulting data in a list named "balances".

``` r
url <- "https://api.covalenthq.com/v1/1/address/trevorfrench.eth/balances_v2/"
api_key <- "..."
query <- list(key = api_key, format = NULL)
method <- "GET"
balances <- covalent_api_call(url, method, api_key, method, query, csv = FALSE)
```

### covalent_balances(api_key, chain_id, address, csv)

-   Returns either a list or a dataframe with account balances

-   api_key: your Covalent API key

-   chain_id: the string id of the chain for which you wish to check balances.

-   address: the address you for which wish to check balances.

-   csv: 'TRUE' will return csv data parsed as a dataframe while 'FALSE' will return json data. The default value is 'FALSE'.

-   The following example queries the account balances for "trevorfrench.eth" on chain "1" and stores the resulting data in a list named "balances".

``` r
api_key <- "..."
balances <- covalent_balances(api_key, "1", "trevorfrench.eth", csv = FALSE)
```

### 
