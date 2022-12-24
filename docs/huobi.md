# Huobi

| Logo                                                                                                          | Name                            | Code  | cryptotrackr Docs                                                                      | Exchange Docs                                     | Source Code                                                                    |
|------------|------------|------------|------------|------------|------------|
| ![huobi](https://user-images.githubusercontent.com/1294454/85734211-85755480-b705-11ea-8b35-0b7f1db33a2f.jpg) | [Huobi](https://www.huobi.com/) | huobi | [/docs/huobi.md](https://github.com/TrevorFrench/cryptotrackr/blob/main/docs/huobi.md) | [🏢](https://huobiapi.github.io/docs/spot/v1/en/) | [/R/huobi.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/huobi.R) |

## Functions:

huobi_candles

### huobi_candles(period, size, symbol)

-   Returns a dataframe containing Huobi candle data.

-   period: the period of each candle. The following are acceptable options: "1min", "5min", "15min", "30min", "60min", "4hour", "1day", "1mon", "1week", "1year"

-   size: the number of datapoints to return. This should fall between 1 and 2000.

-   symbol: the trading symbol to query.

-   The following example retrieves 200 candle datapoints for "btcusdt" at a 1 day interval and stores it in a dataframe named "candles".

``` r
period <- '1day'
size <- '200'
symbol <- 'btcusdt'
candles <- huobi_candles(period, size, symbol)
```
