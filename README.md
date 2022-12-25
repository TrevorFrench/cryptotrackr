# cryptotrackr

![cryptotrackr](/man/figures/cryptotrackr.png)

## 📖 Description

cryptotrackr allows you to connect to data sources across the crypto ecosystem. This data can enable a range of activity such as portfolio tracking, programmatic trading, or industry analysis.

## ✍️ Author / Maintainer

Trevor French <https://trevorfrench.com>

## ⏬ Installation

Install the cryptotrackr package via CRAN:

``` r
#NOT YET AVAILABLE VIA CRAN
```

You can also install the package via the Github repository.

``` r
install.packages("remotes")
remotes::install_github("TrevorFrench/cryptotrackr")
```

## ⚓ Dependencies

cryptotrackr is dependent on the following packages: httr, jsonlite, stringi, openssl

## Supported Data Sources

| Logo                                                                                                                                    | Name                                             | Code               | cryptotrackr Docs                                                                                                | Exchange Docs                                                                                          | Source Code                                                                                              |
|------------|------------|------------|------------|------------|------------|
| ![amberdata](https://www.amberdata.io/hubfs/amberdata_logo_color.svg)                                                                   | [Amberdata](https://www.amberdata.io/)           | amberdata          | [/docs/amberdata.md](https://github.com/TrevorFrench/cryptotrackr/blob/main/docs/amberdata.md)                   | [🏢](https://docs.amberdata.io/)                                                                       | [/R/amberdata.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/amberdata.R)                   |
| ![binance_us](https://user-images.githubusercontent.com/1294454/65177307-217b7c80-da5f-11e9-876e-0b748ba0a358.jpg)                      | [Binance.US](https://binance.us/)                | binance_us         | [/docs/binance_us.md](https://github.com/TrevorFrench/cryptotrackr/blob/main/docs/binance_us.md)                 | [🏢](https://docs.binance.us/)                                                                         | [/R/binance_us.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/binance_us.R)                 |
| ![blockchain_dot_com](https://user-images.githubusercontent.com/1294454/147515585-1296e91b-7398-45e5-9d32-f6121538533f.jpeg)            | [Blockchain.com](https://www.blockchain.com/en/) | blockchain_dot_com | [/docs/blockchain_dot_com.md](https://github.com/TrevorFrench/cryptotrackr/blob/main/docs/blockchain_dot_com.md) | [🏢](https://api.blockchain.com/v3/#/)                                                                 | [/R/blockchain_dot_com.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/blockchain_dot_com.R) |
| ![cex_io](https://user-images.githubusercontent.com/1294454/27766442-8ddc33b0-5ed8-11e7-8b98-f786aef0f3c9.jpg)                          | [CEX.IO](https://cex.io/)                        | cex_io             | [/docs/cex_io.md](https://github.com/TrevorFrench/cryptotrackr/blob/main/docs/cex_io.md)                         | [🏢](https://docs.cex.io/#cex-io-api-introduction)                                                     | [/R/cex_io.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/cex_io.R)                         |
| ![coinbase](https://user-images.githubusercontent.com/1294454/40811661-b6eceae2-653a-11e8-829e-10bfadb078cf.jpg)                        | [Coinbase](https://www.coinbase.com/)            | coinbase           | [/docs/coinbase.md](https://github.com/TrevorFrench/cryptotrackr/blob/main/docs/coinbase.md)                     | [🏢](https://docs.cloud.coinbase.com/advanced-trade-api/reference)                                     | [/R/coinbase.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/coinbase.R)                     |
| ![coinlist](https://coinlist.co/assets/shared/coinlist_logo_black-0a6489d220c15f8f95242acb727bacbdd9d8b36ed91027ed7af138992dcbb4ce.svg) | [Coinlist](https://coinlist.co/)                 | coinlist           | [/docs/coinlist.md](https://github.com/TrevorFrench/cryptotrackr/blob/main/docs/coinlist.md)                     | [🏢](https://trade-docs.coinlist.co/#introduction)                                                     | [/R/coinlist.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/coinlist.R)                     |
| ![coinmarketcap](https://jobboardio.s3.amazonaws.com/uploads/tenant/logo/10955/black.png)                                               | [CoinMarketCap](https://coinmarketcap.com/)      | coinmarketcap      | [/docs/coinmarketcap.md](https://github.com/TrevorFrench/cryptotrackr/blob/main/docs/coinmarketcap.md)           | [🏢](https://coinmarketcap.com/api/documentation/v1/)                                                  | [/R/coinmarketcap.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/coinmarketcap.R)           |
| ![crypto_dot_com](https://user-images.githubusercontent.com/1294454/147792121-38ed5e36-c229-48d6-b49a-48d05fc19ed4.jpeg)                | [Crypto.com](https://crypto.com/)                | crypto_dot_com     | [/docs/crypto_dot_com.md](https://github.com/TrevorFrench/cryptotrackr/blob/main/docs/crypto_dot_com.md)         | [🏢](https://exchange-docs.crypto.com/spot/index.html)                                                 | [/R/crypto_dot_com.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/crypto_dot_com.R)         |
| ![etherscan](https://etherscan.io/assets/svg/logos/logo-etherscan.svg?v=0.0.2)                                                          | [Etherscan](https://etherscan.io/)               | etherscan          | [/docs/etherscan.md](https://github.com/TrevorFrench/cryptotrackr/blob/main/docs/etherscan.md)                   | [🏢](https://docs.etherscan.io/)                                                                       | [/R/etherscan.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/etherscan.R)                   |
| ![gemini](https://user-images.githubusercontent.com/1294454/27816857-ce7be644-6096-11e7-82d6-3c257263229c.jpg)                          | [Gemini](https://www.gemini.com/)                | gemini             | [/docs/gemini.md](https://github.com/TrevorFrench/cryptotrackr/blob/main/docs/gemini.md)                         | [🏢](https://docs.gemini.com/rest-api/)                                                                | [/R/gemini.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/gemini.R)                         |
| ![helium](https://docs.helium.com/img/icons/logoblack.svg)                                                                              | [Helium](https://www.helium.com/)                | helium             | [/docs/helium.md](https://github.com/TrevorFrench/cryptotrackr/blob/main/docs/helium.md)                         | [🏢](https://docs.helium.com/api/)                                                                     | [/R/helium.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/helium.R)                         |
| ![huobi](https://user-images.githubusercontent.com/1294454/85734211-85755480-b705-11ea-8b35-0b7f1db33a2f.jpg)                           | [Huobi](https://www.huobi.com/)                  | huobi              | [/docs/huobi.md](https://github.com/TrevorFrench/cryptotrackr/blob/main/docs/huobi.md)                           | [🏢](https://huobiapi.github.io/docs/spot/v1/en/)                                                      | [/R/huobi.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/huobi.R)                           |
| ![kraken](https://user-images.githubusercontent.com/51840849/76173629-fc67fb00-61b1-11ea-84fe-f2de582f58a3.jpg)                         | [Kraken](https://www.kraken.com/)                | kraken             | [/docs/kraken.md](https://github.com/TrevorFrench/cryptotrackr/blob/main/docs/kraken.md)                         | [🏢](https://docs.kraken.com/rest/)                                                                    | [/R/kraken.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/kraken.R)                         |
| ![magic_eden](https://dka575ofm4ao0.cloudfront.net/pages-transactional_logos/retina/271035/ME_Full_Gradient.png)                        | [Magic Eden](https://magiceden.io/)              | magic_eden         | [/docs/magic_eden.md](https://github.com/TrevorFrench/cryptotrackr/blob/main/docs/magic_eden.md)                 | [🏢](https://api.magiceden.dev/)                                                                       | [/R/magic_eden.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/magic_eden.R)                 |
| ![nifty_gateway](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrQfBZIOmocIpXpnQxeaKB2X81gSYfJ7X1Ww&usqp=CAU)                   | [Nifty Gateway](https://www.niftygateway.com/)   | nifty_gateway      | [/docs/nifty_gateway.md](https://github.com/TrevorFrench/cryptotrackr/blob/main/docs/nifty_gateway.md)           | [🏢](https://niftygateway.notion.site/Nifty-Gateway-OAuth-Public-API-12d0a73c3ca24ab096084fa0334ba895) | [/R/nifty_gateway.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/nifty_gateway.R)           |
| ![okcoin](https://user-images.githubusercontent.com/51840849/87295551-102fbf00-c50e-11ea-90a9-462eebba5829.jpg)                         | [OkCoin](https://www.okcoin.com/)                | okcoin             | [/docs/okcoin.md](https://github.com/TrevorFrench/cryptotrackr/blob/main/docs/okcoin.md)                         | [🏢](https://www.okcoin.com/docs/en/)                                                                  | [/R/okcoin.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/okcoin.R)                         |
| ![paxos](https://user-images.githubusercontent.com/1294454/27822159-66153620-60ad-11e7-89e7-005f6d7f3de0.jpg)                           | [Paxos (itBit)](https://paxos.com/itbit/)        | paxos              | [/docs/paxos.md](https://github.com/TrevorFrench/cryptotrackr/blob/main/docs/paxos.md)                           | [🏢](https://developer.paxos.com/docs/v2/api)                                                          | [/R/paxos.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/paxos.R)                           |

## 🔨 Contributing

Contributions are encouraged!

Feel free to add your own functionality or pick up an issue here: [Issue Board](https://github.com/TrevorFrench/cryptotrackr/issues)

Be sure to check out our contribution guide here: [Contribution Guide](https://github.com/TrevorFrench/cryptotrackr/blob/main/docs/contribution.md)

## License

TBD
