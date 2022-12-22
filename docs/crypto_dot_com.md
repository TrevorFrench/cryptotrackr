# Crypto.com

| Logo                                                                                                                     | Name                              | Code           | cryptotrackr Docs                                                                                        | Exchange Docs                                          | Source Code                                                                                  |
|------------|------------|------------|------------|------------|------------|
| ![crypto_dot_com](https://user-images.githubusercontent.com/1294454/147792121-38ed5e36-c229-48d6-b49a-48d05fc19ed4.jpeg) | [Crypto.com](https://crypto.com/) | crypto_dot_com | [/docs/crypto_dot_com.md](https://github.com/TrevorFrench/cryptotrackr/blob/main/docs/crypto_dot_com.md) | [🏢](https://exchange-docs.crypto.com/spot/index.html) | [/R/crypto_dot_com.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/crypto_com.R) |

## Functions:

crypto_dot_com_instruments

### crypto_dot_com_instruments()

-   Returns a dataframe with information about instruments available on Crypto.com

-   The following example retrieves information about instruments available on Crypto.com and stores the data in a variable named "instruments".

``` r
instruments <- crypto_dot_com_instruments()
```
