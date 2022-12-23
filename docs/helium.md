# Helium

| Logo                                                       | Name                              | Code   | cryptotrackr Docs                                                                        | Exchange Docs                      | Source Code                                                                      |
|------------------------------------------------------------|-----------------------------------|--------|------------------------------------------------------------------------------------------|------------------------------------|----------------------------------------------------------------------------------|
| ![helium](https://docs.helium.com/img/icons/logoblack.svg) | [Helium](https://www.helium.com/) | helium | [/docs/helium.md](https://github.com/TrevorFrench/cryptotrackr/blob/main/docs/helium.md) | [🏢](https://docs.helium.com/api/) | [/R/helium.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/helium.R) |

## Functions:

helium_blockchain_stats, helium_token_supply, helium_height, helium_block_stats, helium_block_descriptions, helium_block_at_height, helium_transactions_at_height

### helium_blockchain_stats()

-   Returns a list containing statistics about the Helium blockchain.

-   The following example gets statistics about the Helium blockchain and stores them in a list named "stats".

``` r
stats <- helium_blockchain_stats()
```

### helium_token_supply()

-   Returns the token supply of the Helium blockchain.

-   The following example gets the token supply of the Helium blockchain and stores it in a variable named "token_supply".

``` r
token_supply <- helium_token_supply()
```

### helium_height()

-   Returns the height of the Helium blockchain

-   The following example gets the height of the Helium blockchain and stores it in a variable named "height".

``` r
height <- helium_height()
```

### helium_block_stats()

-   Returns a list containing block production statistics

-   The following example gets block production statistics and stores them in a list named "block_stats".

``` r
block_stats <- helium_block_stats()
```

### helium_block_descriptions(cursor)

-   Returns a list contaning block descriptions. a cursor field will be returned if there are more results.

-   cursor: used to retrieve more results. Default value is NULL.

-   The following example gets a list of block descriptions. A cursor is also returned. This cursor is then parsed and stored in a variable named "cursor". The cursor is then used to make another API call. These results are stored in a variable named "block_descriptions".

``` r
block_descriptions <- helium_block_descriptions()

cursor <- block_descriptions$cursor
block_descriptions <- helium_block_descriptions(cursor)
```

### helium_block_at_height(height)

-   Returns a list containing descriptors for the block at specified height

-   height: the blockchain height

-   The following example retrieves a list of block descriptors for the Helium blockchain at a height of "213787" and stores it in a variable named "block".

``` r
height <- '213787'
block <- helium_block_at_height(height)
```

### helium_transactions_at_height(height, cursor)

-   Returns a list containing block production statistics

-   height: the blockchain height

-   cursor: used to retrieve more results. Default value is NULL.

-   The following example retrieves a list of block production statistics for the Helium blockchain at a height of "213787" and stores it in a variable named "block_stats". A cursor is also returned. This cursor is then parsed and stored in a variable named "cursor". The cursor is then used to make another API call. These results are stored in a variable named "block_stats".

``` r
height <- '213787'
block_stats <- helium_block_descriptions(height)

cursor <- block_stats$cursor
block_stats <- helium_block_descriptions(height, cursor)
```
