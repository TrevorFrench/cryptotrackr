# Crypto.com

| Logo                                                                                                                     | Name                              | Code           | cryptotrackr Docs                                                                                        | Exchange Docs                                          | Source Code                                                                                      |
|--------------------------------------------------------------------------------------------------------------------------|-----------------------------------|----------------|----------------------------------------------------------------------------------------------------------|--------------------------------------------------------|--------------------------------------------------------------------------------------------------|
| ![crypto_dot_com](https://user-images.githubusercontent.com/1294454/147792121-38ed5e36-c229-48d6-b49a-48d05fc19ed4.jpeg) | [Crypto.com](https://crypto.com/) | crypto_dot_com | [/docs/crypto_dot_com.md](https://github.com/TrevorFrench/cryptotrackr/blob/main/docs/crypto_dot_com.md) | [🏢](https://exchange-docs.crypto.com/spot/index.html) | [/R/crypto_dot_com.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/crypto_dot_com.R) |

## Functions:

crypto_dot_com_instruments, crypto_dot_com_get_book, crypto_dot_com_get_candlestick, crypto_dot_com_get_ticker, crypto_dot_com_get_trades

### crypto_dot_com_instruments()

-   Returns a dataframe with information about instruments available on Crypto.com

-   The following example retrieves information about instruments available on Crypto.com and stores the data in a variable named "instruments".

``` r
instruments <- crypto_dot_com_instruments()
```

### crypto_dot_com_get_book(instrument, depth)

-   Returns a list containing the order book for your specified instrument.

-   instrument: the instrument name which you want to query

-   depth: the depth of the order book to retrieve. The maximum and default value is 50.

-   The following example retrieves the order book for the "BTC_USDT" instrument and stores it in a list named "book".

``` r
book <- crypto_dot_com_get_book("BTC_USDT")
```

### crypto_dot_com_get_candlestick(instrument, timeframe)

-   Returns a list which contains metadata about your query along with a dataframe containing your candlestick data.

-   instrument: the instrument name which you want to query

-   timeframe: the timeframe which each candle represents. You can choose from the following options: '1m', '5m', '15m', '30m', '1h', '4h', '6h', '12h', '1D', '7D', '14D', '1M'. The defailt option is '5m'.

-   The following example retrieves the candlestick data for the "BTC_USDT" instrument.

``` r
candlesticks <- crypto_dot_com_get_candlestick("BTC_USDT")
```

### crypto_dot_com_get_ticker(instrument)

-   Returns ticker data for specified instrument. Refer to Crypto.com for help interpreting response data: <https://exchange-docs.crypto.com/spot/index.html#public-get-ticker>

-   instrument: the instrument name which you want to query

-   The following example retrieves the ticker data for the "BTC_USDT" instrument.

``` r
ticker <- crypto_dot_com_get_ticker("BTC_USDT")
```

### crypto_dot_com_get_trades(instrument)

-   Rreturns trade data for specified instrument. Refer to Crypto.com for help interpreting response data: <https://exchange-docs.crypto.com/spot/index.html#public-get-trades>

-   instrument: the instrument name which you want to query

-   The following example retrieves the trade data for the "BTC_USDT" instrument.

``` r
trades <- crypto_dot_com_get_trades("BTC_USDT")
```
