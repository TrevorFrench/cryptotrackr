# Magic Eden

| Logo                                                                                                             | Name                                | Code       | cryptotrackr Docs                                                                                | Exchange Docs                    | Source Code                                                                              |
|------------|------------|------------|------------|------------|------------|
| ![magic_eden](https://dka575ofm4ao0.cloudfront.net/pages-transactional_logos/retina/271035/ME_Full_Gradient.png) | [Magic Eden](https://magiceden.io/) | magic_eden | [/docs/magic_eden.md](https://github.com/TrevorFrench/cryptotrackr/blob/main/docs/magic_eden.md) | [🏢](https://api.magiceden.dev/) | [/R/magic_eden.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/magic_eden.R) |

## Functions:

magic_eden_transactions

### magic_eden_transactions(wallet)

-   Returns a dataframe containing all transactions for the specified wallet.

-   wallet: the address of the wallet you are trying to query

-   The following example retrieves the Magic Eden transactions for the specified wallet address and stores the data in a dataframe named "transactions".

``` r
wallet <- "72tXz6jhGVPFE8ZfAQocJPJU3HgxsdrRqKZoUdWUhs7o"
transactions <- magic_eden_transactions(wallet)
```
