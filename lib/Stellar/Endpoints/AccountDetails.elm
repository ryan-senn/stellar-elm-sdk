module Stellar.Endpoints.AccountDetails exposing (requestBuilder, send, Response (..))

import Http
import HttpBuilder exposing (..)

import Json.Decode as Decode exposing (Decoder)

import Stellar.PublicKey as PublicKey exposing (PublicKey)
import Stellar.Endpoint as Endpoint exposing (Endpoint)

import Stellar.Resources.Account as Account exposing (Account)

import Stellar.Errors.Error as Error exposing (Error)


requestBuilder : Endpoint -> PublicKey -> RequestBuilder Response
requestBuilder endpoint publicKey =

    HttpBuilder.get (url endpoint publicKey)
        |> withExpect (Http.expectJson decoder)


send : (Result Http.Error Response -> msg) -> RequestBuilder Response -> Cmd msg
send =
    HttpBuilder.send


url : Endpoint -> PublicKey -> String
url endpoint publicKey =

    Endpoint.toString endpoint ++ "/accounts/" ++ PublicKey.toString publicKey


type Response
    = Error Error
    | Success Account


decoder : Decoder Response
decoder =
    Decode.oneOf
        [ Decode.map Error Error.decoder
        , Decode.map Success Account.decoder
        ]