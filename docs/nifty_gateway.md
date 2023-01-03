# Nifty Gateway

| Logo                                                                                                                  | Name                                           | Code          | cryptotrackr Docs                                                                                      | Exchange Docs                                                                                          | Source Code                                                                                    |
|-----------------------------------------------------------------------------------------------------------------------|------------------------------------------------|---------------|--------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------|
| ![nifty_gateway](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrQfBZIOmocIpXpnQxeaKB2X81gSYfJ7X1Ww&usqp=CAU) | [Nifty Gateway](https://www.niftygateway.com/) | nifty_gateway | [/docs/nifty_gateway.md](https://github.com/TrevorFrench/cryptotrackr/blob/main/docs/nifty_gateway.md) | [🏢](https://niftygateway.notion.site/Nifty-Gateway-OAuth-Public-API-12d0a73c3ca24ab096084fa0334ba895) | [/R/nifty_gateway.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/nifty_gateway.R) |

## Functions:

nifty_gateway_user_nifties, nifty_gateway_creators

### nifty_gateway_user_nifties(username, limit, offset, contract_address)

-   Returns a dataframe containing information about the nifties owned by the specified user

-   username: the username you wish to query

-   limit: optionally provide the maximum number of results to return. This is a numeric parameter.

-   offset: optionally specify how many results to skip. This is a numeric parameter.

-   contract_address: optionally filter results by contract address.

-   The following example retrieves the nifties for the user named "tommy" and stores the resulting data in a dataframe named "nifties".

``` r
nifties <- nifty_gateway_user_nifties('tommy')
```

### nifty_gateway_creators(username, limit, offset)

-   Returns a dataframe containing ownership information for all nifties created by the given creator and currently stored on Nifty Gateway

-   username: the username you wish to query

-   limit: optionally provide the maximum number of results to return. This is a numeric parameter.

-   offset: optionally specify how many results to skip. This is a numeric parameter.

-   The following example retrieves the ownership information for nifties created by Beeple and stores the data in a dataframe named "creators".

``` r
creators <- nifty_gateway_creators('beeple')
```
