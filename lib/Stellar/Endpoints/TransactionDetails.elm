module Stellar.Endpoints.TransactionDetails exposing (requestBuilder, send, Response (..))

import Http
import HttpBuilder exposing (..)

import Json.Decode as Decode exposing (Decoder)

import Stellar.Endpoint as Endpoint exposing (Endpoint)

import Stellar.Resources.Transaction as Transaction exposing (Transaction)

import Stellar.Error as Error exposing (Error)


requestBuilder : Endpoint -> String -> RequestBuilder Response
requestBuilder endpoint hash =

    HttpBuilder.get (url endpoint hash)
        |> withExpect (Http.expectJson decoder)


send : (Result Http.Error Response -> msg) -> RequestBuilder Response -> Cmd msg
send =
    HttpBuilder.send


url : Endpoint -> String -> String
url endpoint hash =

    endpoint ++ "/transactions/" ++ toString hash


type Response
    = Error Error
    | Success Transaction


decoder : Decoder Response
decoder =
    Decode.oneOf
        [ Decode.map Error Error.decoder
        , Decode.map Success Transaction.decoder
        ]