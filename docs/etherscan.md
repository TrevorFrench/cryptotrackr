# Etherscan

| Logo                                                                           | Name                               | Code      | cryptotrackr Docs                                                                              | Exchange Docs                    | Source Code                                                                            |
|------------|------------|------------|------------|------------|------------|
| ![etherscan](https://etherscan.io/assets/svg/logos/logo-etherscan.svg?v=0.0.2) | [Etherscan](https://etherscan.io/) | etherscan | [/docs/etherscan.md](https://github.com/TrevorFrench/cryptotrackr/blob/main/docs/etherscan.md) | [🏢](https://docs.etherscan.io/) | [/R/etherscan.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/etherscan.R) |

## Functions:

etherscan_api_call, etherscan_account_balance, etherscan_contract_abi, etherscan_block_reward, etherscan_gas_oracle

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

-   address: the address for which you wish to retrieve the balance.

-   api_key: your Etherscan API key

-   tag: pre-defined block parameter, either earliest, pending or latest. Default is latest.

-   The following example checks the balance for the specified address and stores the balance in a variable named "account_balance".

``` r
address <- "0xde0b295669a9fd93d5f28d9ec85e40f4cb697bae"
api_key <- "..."
account_balance <- etherscan_account_balance(address, api_key)
```

### etherscan_contract_abi(address, api_key)

-   Returns the contract ABI for the specified address

-   address: the contract address for which you wish to retrieve the ABI.

-   api_key: your Etherscan API key

-   The following example retrieves the ABI for the specified contract and stores it in a variable named "abi".

``` r
address <- "0xfb6916095ca1df60bb79ce92ce3ea74c37c5d359"
api_key <- "..."
abi <- etherscan_contract_abi(address, api_key)
```

### etherscan_block_reward(block, api_key)

-   Returns the block and uncle reward for the specified block number as a list.

-   block: the numeric block number

-   api_key: your Etherscan API key

-   The following example retrieves the block and uncle rewards for block number 12697906 and stores the data in a list named "block_reward".

``` r
block <- 12697906
api_key <- "..."
block_reward <- etherscan_block_reward(block, api_key)
```

### etherscan_block_reward(api_key)

-   Returns current safe, proposed and fast gas prices as determined by Etherscan.

-   api_key: your Etherscan API key

-   The following example retrieves data from the Etherscan gas oracle and stores the response in a list named "gas_oracle".

``` r
api_key <- "..."
gas_oracle <- etherscan_gas_oracle(api_key)
# $LastBlock
# [1] "16278960"
# 
# $SafeGasPrice
# [1] "25"
# 
# $ProposeGasPrice
# [1] "25"
# 
# $FastGasPrice
# [1] "26"
# 
# $suggestBaseFee
# [1] "24.959953709"
# 
# $gasUsedRatio
# [1] "0.472567333333333,0.5293583,0.369716666666667,0.5435785,0.5312433"
```
