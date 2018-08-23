module Stellar.Endpoints.PostTransaction exposing
    ( requestBuilder
    , send, Response (..)
    )

{-| Post Transaction Endpoint

# Build the Request with required fields
@docs requestBuilder

# Send the Request & catch Response
@docs send, Response

-}

import Http
import HttpBuilder exposing (..)

import Json.Decode as Decode exposing (Decoder)
import Json.Encode as Encode

import Stellar.Endpoint as Endpoint exposing (Endpoint)

import Stellar.Resources.Transaction exposing (Transaction)
import Stellar.Resources.Internal.Transaction as Transaction

import Stellar.Error exposing (Error)
import Stellar.Internal.Error as Error


{-| Request Builder. Takes the mandatory fields as arguments, the optional fields can be piped using setters.
-}
requestBuilder : Endpoint -> String -> RequestBuilder Response
requestBuilder endpoint transactionEnvelopeXdr =

    HttpBuilder.post (url endpoint)
        |> withJsonBody (Encode.object [("tx", Encode.string transactionEnvelopeXdr)])
        |> withHeader "Content-Type" "application/x-www-form-urlencoded"
        |> withExpect (Http.expectJson decoder)


{-| Send the request once configured.
-}
send : (Result Http.Error Response -> msg) -> RequestBuilder Response -> Cmd msg
send =
    HttpBuilder.send


url : Endpoint -> String
url endpoint =

    endpoint ++ "/transactions"


{-| The Response coming back from the server.
-}
type Response
    = Error Error
    | Success Transaction


decoder : Decoder Response
decoder =
    Decode.oneOf
        [ Decode.map Error Error.decoder
        , Decode.map Success Transaction.decoder
        ]