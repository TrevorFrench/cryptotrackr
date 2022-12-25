# CoinMarketCap

| Logo                                                                                      | Name                                        | Code          | cryptotrackr Docs                                                                                      | Exchange Docs                                         | Source Code                                                                                    |
|-------------------------------------------------------------------------------------------|---------------------------------------------|---------------|--------------------------------------------------------------------------------------------------------|-------------------------------------------------------|------------------------------------------------------------------------------------------------|
| ![coinmarketcap](https://jobboardio.s3.amazonaws.com/uploads/tenant/logo/10955/black.png) | [CoinMarketCap](https://coinmarketcap.com/) | coinmarketcap | [/docs/coinmarketcap.md](https://github.com/TrevorFrench/cryptotrackr/blob/main/docs/coinmarketcap.md) | [🏢](https://coinmarketcap.com/api/documentation/v1/) | [/R/coinmarketcap.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/coinmarketcap.R) |

## Functions:

coinmarketcap_api_call, coinmarketcap_id_map, coinmarketcap_metadata, coinmarketcap_airdrop, coinmarketcap_categories, coinmarketcap_category

### coinmarketcap_api_call(url, api_key, method, query)

-   Returns data from your CoinMarketCap API call

-   url: the url for your CoinMarketCap API call

-   api_key: your CoinMarketCap API key

-   method: "GET" or "POST"

-   query: your query parameters. The default value is NULL.

-   The following example uses the function to make an API call to CoinMarketCap's id map endpoint.

``` r
url <- "https://pro-api.coinmarketcap.com/v1/cryptocurrency/map"
api_key <- "..."
query_string <- list(
  listing_status = "active",
  start = "1",
  limit = NULL,
  sort = "id",
  symbol = NULL,
  aux = "platform,first_historical_data,last_historical_data,is_active,status"
)
data <- coinmarketcap_api_call(url, api_key, 'GET', query = query_string)
```

### coinmarketcap_id_map(api_key , listing_status, start, limit, sort, symbol, aux)

-   Returns a dataframe which includes the id mapping for CoinMarketCap cryptocurrencies along with other metadata related to the currencies.

-   api_key: your CoinMarketCap API key

-   listing_status: you can choose "active", "inactive", or "untracked". Multiple options can be passed if they are comma-separated. Choosing "active" will return only active cryptocurrencies. Choosing "inactive" will return cryptocurrencies which are inactive. Choosing "untracked" will return a list of cryptocurrencies which are listed by CoinMarketCap but do not yet meet their methodology requirements to have tracked markets available. The default is "active".

-   start: you can use this parameter to offset your first result. The default value is "1".

-   limit: an optional string value between 1 and 5000 which tells CoinMarketCap how many results to return. The default value is NULL.

-   sort: the field used to sort your results. The two acceptable values are "id" and "cmc_rank". The default value is "id".

-   symbol: Optionally pass a comma-separated list of cryptocurrency symbols to return CoinMarketCap IDs for. The default value is NULL.

-   aux: Optionally specify a comma-separated list of supplemental data fields to return. Pass "platform,first_historical_data,last_historical_data, is_active,status" to include all auxiliary fields. This function will include all auxiliary fields by default.

-   The following example uses the function to make an API call to CoinMarketCap's id map endpoint. All default values are accepted and the resulting data is stored in a dataframe named "id_map".

``` r
api_key <- "..."
id_map <- coinmarketcap_id_map(api_key)
```

### coinmarketcap_metadata(api_key, id, slug, symbol, address, aux)

-   Returns a list which includes a dataframe for each asset you requested. The dataframe will contain CoinMarketCap metadata for the asset.

-   api_key: your CoinMarketCap API key

-   id: the id of the asset you wish to query. The default value is NULL; however, each request must include either an id, slug, symbol, or contract address. You can also pass multiple comma-separated values.

-   slug: the slug of the asset you wish to query. The default value is NULL. You can also pass multiple comma-separated values.

-   symbol: the symbol of the asset you wish to query. The default value is NULL. You can also pass multiple comma-separated values.

-   address: the contract address of the asset you wish to query. The default calue is NULL. You can also pass multiple comma-separated values.

-   aux: Optionally specify a comma-separated list of supplemental data fields to return. Pass "urls,logo,description,tags,platform,date_added, notice,status" to include all auxiliary fields. This function will include all auxiliary fields by default.

-   The following example uses the function to make an API call to CoinMarketCap's metadata endpoint. "BTC" is used as the symbol. The resulting data is stored in a list named "metadata". The list contains a dataframe named "BTC" which contains all metadata relevant to Bitcoin.

``` r
api_key <- "..."
metadata <- coinmarketcap_metadata(api_key, symbol = "BTC")
```

### coinmarketcap_airdrop(api_key, id)

-   Returns information about the airdrop for the id you provided.

-   api_key: your CoinMarketCap API key

-   id: the unique airdrop id which can be found through the airdrops api.

-   The following example gets airdrop information for the airdrop with id "10744".

``` r
api_key <- "..."
id <- "10744"
airdrop <- coinmarketcap_airdrop(api_key, url)
```

### coinmarketcap_categories(api_key, start, limit, id, slug, symbol)

-   Returns a datafrane with information about CoinMarketCap asset categories.

-   api_key: your CoinMarketCap API key

-   start: you can use this parameter to offset your first result. The default value is "1".

-   limit: an optional string value between 1 and 5000 which tells CoinMarketCap how many results to return. The default value is NULL.

-   id: filter categories by one or more asset ids. The default value is NULL. Multiple values must be comma-separated.

-   slug: filter categories by one or more asset slugs. The default value is NULL. Multiple values must be comma-separated.

-   symbol: filter categories by one or more asset symbols. The default value is NULL. Multiple values must be comma-separated.

-   The following example gets asset categories available on CoinMarketCap and stores the data in a dataframe named "categories".

``` r
api_key <- "..."
categories <- coinmarketcap_categories(api_key)
```

### coinmarketcap_category(api_key, id, start, limit, convert, convert_id)

-   Returns a list with information about the specified category.

-   api_key: your CoinMarketCap API key

-   id: the category id you wish to query.

-   start: you can use this parameter to offset your first result. The default value is "1".

-   limit: an optional string value between 1 and 5000 which tells CoinMarketCap how many results to return. The default value is NULL.

-   convert: Optionally calculate market quotes in up to 120 currencies at once by passing a comma-separated list of cryptocurrency or fiat currency symbols.

-   convert_id: Optionally calculate market quotes by CoinMarketCap id instead of symbol.

-   The following example returns information about the CoinMarketCap category with the id "6363a6c9cd197958bb543bf0" and stores the data in a list named "category".

``` r
api_key <- "..."
id <- "6363a6c9cd197958bb543bf0"
category <- coinmarketcap_category(api_key, id)
```
