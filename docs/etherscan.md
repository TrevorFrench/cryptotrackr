# Etherscan

| Logo                                                                           | Name                               | Code      | cryptotrackr Docs                                                                              | Exchange Docs                    | Source Code                                                                            |
|------------|------------|------------|------------|------------|------------|
| ![etherscan](https://etherscan.io/assets/svg/logos/logo-etherscan.svg?v=0.0.2) | [Etherscan](https://etherscan.io/) | etherscan | [/docs/etherscan.md](https://github.com/TrevorFrench/cryptotrackr/blob/main/docs/etherscan.md) | [🏢](https://docs.etherscan.io/) | [/R/etherscan.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/etherscan.R) |

## Functions:

etherscan_api_call, etherscan_account_balance

### etherscan_api_call(method, query)

-   Returns data from your Etherscan API call

-   method: "GET" or "POST"

-   query: your query parameters

-   The following example uses the etherscan_api_call function to make a request to the account balance endpoint and stores the resulting data in a variable named "data".

``` r
address <- "0xde0b295669a9fd93d5f28d9ec85e40f4cb697bae"
api_key <- "..."
tag <- "latest"
query_string <- list(
  module = 'account',
  action = 'balance',
  address = address,
  tag = tag,
  apikey = api_key
)

data <- etherscan_api_call('GET', query_string)
```

### etherscan_account_balance(address, api_key, tag)

-   Returns the balance for the specified address

-   address: the address you wish to retrieve the balance for

-   api_key: your Etherscan API key

-   tag: pre-defined block parameter, either earliest, pending or latest. Default is latest.

-   The following example checks the balance for the specified address and stores the balance in a variable named "account_balance".

``` r
address <- "0xde0b295669a9fd93d5f28d9ec85e40f4cb697bae"
api_key <- "..."
account_balance <- etherscan_account_balance(address, api_key)
```
