# Magic Eden

| Logo                                                                                                             | Name                                | Code       | cryptotrackr Docs                                                                                | Exchange Docs                    | Source Code                                                                              |
|------------|------------|------------|------------|------------|------------|
| ![magic_eden](https://dka575ofm4ao0.cloudfront.net/pages-transactional_logos/retina/271035/ME_Full_Gradient.png) | [Magic Eden](https://magiceden.io/) | magic_eden | [/docs/magic_eden.md](https://github.com/TrevorFrench/cryptotrackr/blob/main/docs/magic_eden.md) | [🏢](https://api.magiceden.dev/) | [/R/magic_eden.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/magic_eden.R) |

## Functions:

magic_eden_transactions, magic_eden_tokens_owned, magic_eden_token_metadata, magic_eden_token_listings

### magic_eden_transactions(wallet, offset, limit)

-   Returns a dataframe containing all transactions for the specified wallet.

-   wallet: the address of the wallet you are trying to query

-   offset: optionally provide a numeric value to specify number of transactions to skip.

-   limit: optionally provide a numeric limit to specify maximum number of results.

-   The following example retrieves the Magic Eden transactions for the specified wallet address and stores the data in a dataframe named "transactions".

``` r
wallet <- "72tXz6jhGVPFE8ZfAQocJPJU3HgxsdrRqKZoUdWUhs7o"
transactions <- magic_eden_transactions(wallet)
```

### magic_eden_tokens_owned(wallet, offset, limit, list_status)

-   Returns a dataframe containing all tokens owned by specified wallet.

-   wallet: the address of the wallet you are trying to query

-   offset: optionally provide a numeric value to specify number of results to skip.

-   limit: optionally provide a numeric limit to specify maximum number of results.

-   list_status: either "listed", "unlisted" or "both". The default is "both".

-   The following example retrieves the tokens owned by the specified wallet and stores the resulting data in a dataframe named "tokens".

``` r
wallet <- "72tXz6jhGVPFE8ZfAQocJPJU3HgxsdrRqKZoUdWUhs7o"
tokens <- magic_eden_tokens_owned(wallet)
```

### magic_eden_token_metadata(mint_address)

-   Returns a list containing the token metadata for the specified mint address.

-   mint_address: the mint address of the token you wish to query

-   The following example retrieves the token metadata for the specified mint address and stores the resulting data in a list named "metadata".

``` r
mint_address <- "Hd6sxFEEQQA5aURaWaDesi23AkM19bBkKave1hyWvnfS"
metadata <- magic_eden_token_metadata(mint_address)
```

### magic_eden_token_listings(mint_address)

-   Returns a dataframe containing the token listings for the specified mint address.

-   mint_address: the mint address of the token you wish to query

-   The following example retrieves the token listings for the specified mint address and stores the resulting data in a dataframe named "listings".

``` r
mint_address <- "Hd6sxFEEQQA5aURaWaDesi23AkM19bBkKave1hyWvnfS"
listings <- magic_eden_token_listings(mint_address)
```
