<a href='https://github.com/TrevorFrench/cryptotrackr'><img src="https://raw.githubusercontent.com/TrevorFrench/cryptotrackr/main/man/figures/cryptotrackr.png" align="right" height="300"/></a>

[![CRAN status](https://www.r-pkg.org/badges/version/cryptotrackr)](https://cran.r-project.org/package=cryptotrackr) [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.10775699.svg)](https://doi.org/10.5281/zenodo.10775699) [![CRAN RStudio mirror downloads](https://cranlogs.r-pkg.org/badges/grand-total/cryptotrackr?color=blue)](https://r-pkg.org/pkg/cryptotrackr)

# cryptotrackr

## 📖 Description

cryptotrackr allows you to connect to data sources across the crypto ecosystem. This data can enable a range of activity such as portfolio tracking, programmatic trading, or industry analysis.

## ✍️ Author / Maintainer

Trevor French <https://trevorfrench.com>

## ⏬ Installation

Install the cryptotrackr package via CRAN:

``` r
install.packages("cryptotrackr")
```

You can also install the package via the Github repository.

``` r
install.packages("remotes")
remotes::install_github("TrevorFrench/cryptotrackr")
```

## ⚓ Dependencies

cryptotrackr is dependent on the following packages: httr, jsonlite, stringi, openssl, utils, digest

## Supported Data Sources

| Logo                                                                                                                                    | Name                                             | Code               | [cryptotrackr Docs](https://github.com/TrevorFrench/cryptotrackr/wiki) | Exchange Docs                                                                                          | Source Code                                                                                              |
|------------|------------|------------|------------|------------|------------|
| ![amberdata](https://www.amberdata.io/hubfs/amberdata_logo_color.svg)                                                                   | [Amberdata](https://www.amberdata.io/)           | amberdata          | [📜](https://github.com/TrevorFrench/cryptotrackr/wiki/Amberdata)      | [🏢](https://docs.amberdata.io/)                                                                       | [/R/amberdata.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/amberdata.R)                   |
| ![binance_us](https://user-images.githubusercontent.com/1294454/65177307-217b7c80-da5f-11e9-876e-0b748ba0a358.jpg)                      | [Binance.US](https://www.binance.us/)            | binance_us         | [📜](https://github.com/TrevorFrench/cryptotrackr/wiki/Binance-US)     | [🏢](https://docs.binance.us/)                                                                         | [/R/binance_us.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/binance_us.R)                 |
| ![blockchain_dot_com](https://user-images.githubusercontent.com/1294454/147515585-1296e91b-7398-45e5-9d32-f6121538533f.jpeg)            | [Blockchain.com](https://www.blockchain.com/en/) | blockchain_dot_com | [📜](https://github.com/TrevorFrench/cryptotrackr/wiki/Blockchain.com) | [🏢](https://api.blockchain.com/v3/#/)                                                                 | [/R/blockchain_dot_com.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/blockchain_dot_com.R) |
| ![cex_io](https://user-images.githubusercontent.com/1294454/27766442-8ddc33b0-5ed8-11e7-8b98-f786aef0f3c9.jpg)                          | [CEX.IO](https://cex.io/)                        | cex_io             | [📜](https://github.com/TrevorFrench/cryptotrackr/wiki/CEX.io)         | [🏢](https://docs.cex.io/#cex-io-api-introduction)                                                     | [/R/cex_io.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/cex_io.R)                         |
| ![coinbase](https://user-images.githubusercontent.com/1294454/40811661-b6eceae2-653a-11e8-829e-10bfadb078cf.jpg)                        | [Coinbase](https://www.coinbase.com/)            | coinbase           | [📜](https://github.com/TrevorFrench/cryptotrackr/wiki/Coinbase)       | [🏢](https://docs.cdp.coinbase.com/advanced-trade/docs/welcome/)                                     | [/R/coinbase.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/coinbase.R)                     |
| ![coingecko](/man/figures/coingecko.png)                                                                                                | [CoinGecko](https://www.coingecko.com/)          | coingecko          | [📜](https://github.com/TrevorFrench/cryptotrackr/wiki/Coingecko)      | [🏢](https://docs.coingecko.com)                                                      | [/R/coingecko.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/coingecko.R)                   |
| ![coinlist](https://coinlist.co/assets/shared/coinlist_logo_black-0a6489d220c15f8f95242acb727bacbdd9d8b36ed91027ed7af138992dcbb4ce.svg) | [Coinlist](https://coinlist.co/)                 | coinlist           | [📜](https://github.com/TrevorFrench/cryptotrackr/wiki/Coinlist)       | [🏢](https://trade-docs.coinlist.co/#introduction)                                                     | [/R/coinlist.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/coinlist.R)                     |
| ![coinmarketcap](https://jobboardio.s3.amazonaws.com/uploads/tenant/logo/10955/black.png)                                               | [CoinMarketCap](https://coinmarketcap.com/)      | coinmarketcap      | [📜](https://github.com/TrevorFrench/cryptotrackr/wiki/CoinMarketCap)  | [🏢](https://coinmarketcap.com/api/documentation/v1/)                                                  | [/R/coinmarketcap.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/coinmarketcap.R)           |
| ![covalent](/man/figures/Covalent_Wordmark_Three_Color.png)                                                                             | [Covalent](https://www.covalenthq.com/)          | Covalent           | [📜](https://github.com/TrevorFrench/cryptotrackr/wiki/Covalent)       | [🏢](https://www.covalenthq.com/docs/api/)                                                             | [/R/covalent.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/covalent.R)                     |
| ![crypto_dot_com](https://user-images.githubusercontent.com/1294454/147792121-38ed5e36-c229-48d6-b49a-48d05fc19ed4.jpeg)                | [Crypto.com](https://crypto.com/)                | crypto_dot_com     | [📜](https://github.com/TrevorFrench/cryptotrackr/wiki/Crypto.com)     | [🏢](https://exchange-docs.crypto.com/spot/index.html)                                                 | [/R/crypto_dot_com.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/crypto_dot_com.R)         |
| ![etherscan](https://etherscan.io/assets/svg/logos/logo-etherscan.svg?v=0.0.2)                                                          | [Etherscan](https://etherscan.io/)               | etherscan          | [📜](https://github.com/TrevorFrench/cryptotrackr/wiki/Etherscan)      | [🏢](https://docs.etherscan.io/)                                                                       | [/R/etherscan.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/etherscan.R)                   |
| ![gemini](https://user-images.githubusercontent.com/1294454/27816857-ce7be644-6096-11e7-82d6-3c257263229c.jpg)                          | [Gemini](https://www.gemini.com/)                | gemini             | [📜](https://github.com/TrevorFrench/cryptotrackr/wiki/Gemini)         | [🏢](https://docs.gemini.com/rest-api/)                                                                | [/R/gemini.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/gemini.R)                         |
| ![huobi](https://user-images.githubusercontent.com/1294454/85734211-85755480-b705-11ea-8b35-0b7f1db33a2f.jpg)                           | [Huobi](https://www.huobi.com/)                  | huobi              | [📜](https://github.com/TrevorFrench/cryptotrackr/wiki/Huobi)          | [🏢](https://huobiapi.github.io/docs/spot/v1/en/)                                                      | [/R/huobi.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/huobi.R)                           |
| ![kraken](https://user-images.githubusercontent.com/51840849/76173629-fc67fb00-61b1-11ea-84fe-f2de582f58a3.jpg)                         | [Kraken](https://www.kraken.com/)                | kraken             | [📜](https://github.com/TrevorFrench/cryptotrackr/wiki/Kraken)         | [🏢](https://docs.kraken.com/rest/)                                                                    | [/R/kraken.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/kraken.R)                         |
| ![kucoin](https://assets.staticimg.com/cms/media/1lB3PkckFDyfxz6VudCEACBeRRBi6sQQ7DDjz0yWM.svg)                                         | [Kucoin](https://www.kucoin.com/)                | kucoin             | [📜](https://github.com/TrevorFrench/cryptotrackr/wiki/Kucoin)         | [🏢](https://www.kucoin.com/docs/beginners/introduction)                                               | [/R/kucoin.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/kucoin.R)                         |
| ![magic_eden](https://dka575ofm4ao0.cloudfront.net/pages-transactional_logos/retina/271035/ME_Full_Gradient.png)                        | [Magic Eden](https://magiceden.io/)              | magic_eden         | [📜](https://github.com/TrevorFrench/cryptotrackr/wiki/Magic-Eden)     | [🏢](https://api.magiceden.dev/)                                                                       | [/R/magic_eden.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/magic_eden.R)                 |
| ![nifty_gateway](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrQfBZIOmocIpXpnQxeaKB2X81gSYfJ7X1Ww&usqp=CAU)                   | [Nifty Gateway](https://www.niftygateway.com/)   | nifty_gateway      | [📜](https://github.com/TrevorFrench/cryptotrackr/wiki/Nifty-Gateway)  | [🏢](https://help.niftygateway.com/hc/en-us/articles/13518900199571-Nifty-Gateway-OAuth-Public-API) | [/R/nifty_gateway.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/nifty_gateway.R)           |
| ![okcoin](https://user-images.githubusercontent.com/51840849/87295551-102fbf00-c50e-11ea-90a9-462eebba5829.jpg)                         | [OkCoin](https://www.okcoin.com/)                | okcoin             | [📜](https://github.com/TrevorFrench/cryptotrackr/wiki/OkCoin)         | [🏢](https://www.okcoin.com/docs-v5/en/)                                                               | [/R/okcoin.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/okcoin.R)                         |
| ![paxos](https://user-images.githubusercontent.com/1294454/27822159-66153620-60ad-11e7-89e7-005f6d7f3de0.jpg)                           | [Paxos (itBit)](https://paxos.com/itbit/)        | paxos              | [📜](https://github.com/TrevorFrench/cryptotrackr/wiki/Paxos-(itBit))  | [🏢](https://docs.paxos.com/api/v2)                                                                    | [/R/paxos.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/paxos.R)                           |
| ![solana](/man/figures/solana.png)                                                                                           | [Solana](https://solana.com/)                    | solana             | [📜](https://github.com/TrevorFrench/cryptotrackr/wiki/Solana)         | [🏢](https://docs.solana.com/)                                                                         | [/R/solana.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/solana.R)                         |

## 🔨 Contributing

Contributions are encouraged!

Feel free to add your own functionality, report an issue, or pick up an issue here: [Issue Board](https://github.com/TrevorFrench/cryptotrackr/issues)

Be sure to check out our contribution guide here: [Contribution Guide](https://github.com/TrevorFrench/cryptotrackr/wiki/Contribution-Guide)

## License

### MIT License

Copyright (c) 2022 Trevor French

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
