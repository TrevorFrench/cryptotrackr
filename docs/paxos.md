# Paxos (itBit)

| Logo                                                                                                          | Name                                      | Code  | cryptotrackr Docs                                                                      | Exchange Docs                                 | Source Code                                                                    |
|------------|------------|------------|------------|------------|------------|
| ![paxos](https://user-images.githubusercontent.com/1294454/27822159-66153620-60ad-11e7-89e7-005f6d7f3de0.jpg) | [Paxos (itBit)](https://paxos.com/itbit/) | paxos | [/docs/paxos.md](https://github.com/TrevorFrench/cryptotrackr/blob/main/docs/paxos.md) | [🏢](https://developer.paxos.com/docs/v2/api) | [/R/paxos.R](https://github.com/TrevorFrench/cryptotrackr/blob/main/R/paxos.R) |

## Functions:

paxos_bearer_token, paxos_list_profiles

### paxos_bearer_token(client_id, client_secret, scope)

-   Returns your Paxos bearer token

-   client_id: the client id you generated when you created your API key

-   client_secret: the client secret you generated when you created your API key

-   scope: the scope needed for your specific API call

-   The following example gets your Paxos bearer token and stores it in a variable named "token".

``` r
client_id <- "..."
client_secret <- "..."
scope <- 'funding:read_address'
token <- paxos_bearer_token(client_id, client_secret, scope)
```

### paxos_list_profiles(client_id, client_secret)

-   Returns a dataframe containing all user profiles

-   client_id: the client id you generated when you created your API key

-   client_secret: the client secret you generated when you created your API key

-   The following example gets all user profiles and stores them in a dataframe named "profiles".

``` r
client_id <- "..."
client_secret <- "..."
profiles <- paxos_list_profiles(client_id, client_secret)
```
