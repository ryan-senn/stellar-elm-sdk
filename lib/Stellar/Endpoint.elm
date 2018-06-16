module Stellar.Endpoint exposing (Endpoint, toString, fromString)


type Endpoint
    = Endpoint String


toString : Endpoint -> String
toString (Endpoint string) =
    string


fromString : String -> Endpoint
fromString =
    Endpoint