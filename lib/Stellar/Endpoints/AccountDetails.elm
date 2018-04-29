module Stellar.Http.AccountDetails exposing (request, Response (..))

import Http
import HttpBuilder exposing (..)

import Json.Decode as Decode exposing (Decoder)

import Stellar.PublicKey as PublicKey exposing (PublicKey)
import Stellar.Endpoint as Endpoint exposing (Endpoint)

import Stellar.Resources.Account as Account exposing (Account)

import Stellar.Error as Error exposing (Error)


request : Endpoint -> PublicKey -> (Result Http.Error Response -> msg) -> Cmd msg
request endpoint publicKey msg =

    HttpBuilder.get (url endpoint publicKey)
        |> withExpect (Http.expectJson decoder)
        |> send msg


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