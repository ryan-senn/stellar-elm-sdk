module Stellar.Endpoints.PostTransaction exposing
    ( requestBuilder, send
    , Response (..)
    )

import Http
import HttpBuilder exposing (..)

import Json.Decode as Decode exposing (Decoder)
import Json.Encode as Encode

import Stellar.Endpoint as Endpoint exposing (Endpoint)
import Stellar.Resources.Transaction as Transaction exposing (Transaction)

import Stellar.Error as Error exposing (Error)


requestBuilder : Endpoint -> String -> RequestBuilder Response
requestBuilder endpoint transactionEnvelopeXdr =

    HttpBuilder.post (url endpoint)
        |> withJsonBody (Encode.object [("tx", Encode.string transactionEnvelopeXdr)])
        |> withHeader "Content-Type" "application/x-www-form-urlencoded"
        |> withExpect (Http.expectJson decoder)


send : (Result Http.Error Response -> msg) -> RequestBuilder Response -> Cmd msg
send =
    HttpBuilder.send


url : Endpoint -> String
url endpoint =

    endpoint ++ "/transactions"


type Response
    = Error Error
    | Success Transaction


decoder : Decoder Response
decoder =
    Decode.oneOf
        [ Decode.map Error Error.decoder
        , Decode.map Success Transaction.decoder
        ]