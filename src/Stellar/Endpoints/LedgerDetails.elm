module Stellar.Endpoints.LedgerDetails exposing
    ( requestBuilder
    , send, Response(..)
    )

{-| Ledger Details Endpoint


# Build the Request with required fields

@docs requestBuilder


# Send the Request & catch Response

@docs send, Response

-}

import Http
import HttpBuilder exposing (..)
import Json.Decode as Decode exposing (Decoder)
import Stellar.Endpoint as Endpoint exposing (Endpoint)
import Stellar.Error exposing (Error)
import Stellar.Internal.Error as Error
import Stellar.Resources.Internal.Ledger as Ledger
import Stellar.Resources.Ledger exposing (Ledger)


{-| Request Builder. Takes the mandatory fields as arguments, the optional fields can be piped using setters.
-}
requestBuilder : Endpoint -> Int -> RequestBuilder Response
requestBuilder endpoint sequence =
    HttpBuilder.get (url endpoint sequence)
        |> withExpect (Http.expectJson decoder)


{-| Send the request once configured.
-}
send : (Result Http.Error Response -> msg) -> RequestBuilder Response -> Cmd msg
send =
    HttpBuilder.send


url : Endpoint -> Int -> String
url endpoint sequence =
    endpoint ++ "/ledgers/" ++ toString sequence


{-| The Response coming back from the server.
-}
type Response
    = Error Error
    | Success Ledger


decoder : Decoder Response
decoder =
    Decode.oneOf
        [ Decode.map Error Error.decoder
        , Decode.map Success Ledger.decoder
        ]
