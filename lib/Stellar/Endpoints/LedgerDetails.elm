module Stellar.Endpoints.LedgerDetails exposing (requestBuilder, send, Response (..))

import Http
import HttpBuilder exposing (..)

import Json.Decode as Decode exposing (Decoder)

import Stellar.Endpoint as Endpoint exposing (Endpoint)

import Stellar.Resources.Ledger as Ledger exposing (Ledger)

import Stellar.Error as Error exposing (Error)


requestBuilder : Endpoint -> Int -> RequestBuilder Response
requestBuilder endpoint sequence =

    HttpBuilder.get (url endpoint sequence)
        |> withExpect (Http.expectJson decoder)


send : (Result Http.Error Response -> msg) -> RequestBuilder Response -> Cmd msg
send =
    HttpBuilder.send


url : Endpoint -> Int -> String
url endpoint sequence =

    endpoint ++ "/ledgers/" ++ toString sequence


type Response
    = Error Error
    | Success Ledger


decoder : Decoder Response
decoder =
    Decode.oneOf
        [ Decode.map Error Error.decoder
        , Decode.map Success Ledger.decoder
        ]