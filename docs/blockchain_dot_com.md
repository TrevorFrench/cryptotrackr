# Blockchain.com

| Logo                                                                                                                         | Name                                             | Code               | cryptotrackr Docs                                                                                                | Exchange Docs                          | Source Code                                                                                              |
|------------|------------|------------|------------|------------|------------|
| ![blockchain_dot_com](https://user-images.githubusercontent.com/1294454/147515585-1296e91b-7398-45e5-9d32-f6121538533f.jpeg) | [Blockchain.com](https://www.blockchain.com/en/) | blockchain_dot_com | [/docs/blockchain_dot_com.md](https://github.com/TrevorFrench/cryptotrackr/blob/main/docs/blockchain_dot_com.md) | [🏢](https://api.blockchain.com/v3/#/) | [/R/blockchain_dot_com.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/blockchain_dot_com.R) |

## Functions:

blockchain_dot_com_l2_order_book, blockchain_dot_com_l3_order_book, blockchain_dot_com_tickers, blockchain_dot_com_ticker_symbol, blockchain_dot_com_symbols, blockchain_dot_com_symbol

### blockchain_dot_com_l2_order_book(symbol)

-   Returns a list containing a 'bids' and an 'asks' dataframe along with the specified symbol

-   symbol: the symbol for which to retrieve data

-   The following example passes the symbol "BTC-USD" into the function and returns the L2 order book data to a list named "l2_order_book". Then the "bids" and "asks" dataframes are stored as their own separate variables.

``` r
symbol <- 'BTC-USD'
l2_order_book <- blockchain_dot_com_l2_order_book(symbol)
bids <- l2_order_book$bids
asks <- l2_order_book$asks
```

### blockchain_dot_com_l3_order_book(symbol)

-   Returns a list containing a 'bids' and an 'asks' dataframe along with the specified symbol

-   symbol: the symbol for which to retrieve data

-   The following example passes the symbol "BTC-USD" into the function and returns the L3 order book data to a list named "l2_order_book". Then the "bids" and "asks" dataframes are stored as their own separate variables.

``` r
symbol <- 'BTC-USD'
l3_order_book <- blockchain_dot_com_l3_order_book(symbol)
bids <- l3_order_book$bids
asks <- l3_order_book$asks
```

### blockchain_dot_com_tickers()

-   Returns a dataframe with price and volume data for all symbols

-   The following example retrieves price and volume data for all tickers and stores it in a dataframe named "tickers"

``` r
tickers <- blockchain_dot_com_tickers()
```

### blockchain_dot_com_ticker_symbol(symbol)

-   Returns a list with price and volume data for specified symbol

-   symbol: the symbol for which to retrieve data

-   The following example retrieves the price and volume data for the "BTC-USD" symbol and stores it in a list named "ticker_data"

``` r
symbol <- 'BTC-USD'
ticker_data <- blockchain_dot_com_ticker_symbol(symbol)
```

### blockchain_dot_com_symbols()

-   Returns a list with various data for all symbols

-   The following example retrieves various data on Blockchain.com symbols and stores it in a list named "symbol_data"

``` r
symbol_data <- blockchain_dot_com_symbols()
```

### blockchain_dot_com_symbol(symbol)

-   Returns a list with various data for specified symbol

-   symbol: the symbol for which to retrieve data

-   The following example passes the symbol "BTC-USD" symbol into the function and stores it in a list named "symbol_data"

``` r
symbol <- 'BTC-USD'
symbol_data <- blockchain_dot_com_symbol(symbol)
```
