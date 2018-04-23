module Stellar.Endpoint exposing (Endpoint, toString, dummy)


type Endpoint
    = Endpoint String


toString : Endpoint -> String
toString (Endpoint string) =
    string


dummy : Endpoint
dummy =
    Endpoint "https://horizon-testnet.stellar.org"