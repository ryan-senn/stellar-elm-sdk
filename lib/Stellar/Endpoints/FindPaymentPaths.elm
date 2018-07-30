module Stellar.Endpoints.FindPaymentPaths exposing (requestBuilder, send, Response (..))

import Http
import HttpBuilder exposing (..)

import Json.Decode as Decode exposing (Decoder)

import Stellar.Endpoint as Endpoint exposing (Endpoint)

import Stellar.Resources.Operation as Operation exposing (Operation)

import Stellar.Error as Error exposing (Error)


requestBuilder : Endpoint -> Int -> RequestBuilder Response
requestBuilder endpoint operationId =

    HttpBuilder.get (url endpoint operationId)
        |> withExpect (Http.expectJson decoder)


send : (Result Http.Error Response -> msg) -> RequestBuilder Response -> Cmd msg
send =
    HttpBuilder.send


url : Endpoint -> Int -> String
url endpoint operationId =

    endpoint ++ "/operations/" ++ toString operationId


type Response
    = Error Error
    | Success Operation


decoder : Decoder Response
decoder =
    Decode.oneOf
        [ Decode.map Error Error.decoder
        , Decode.map Success Operation.decoder
        ]