module Stellar.Endpoints.DataForAccount exposing (request, Response (..), Key (..))

import Http
import HttpBuilder exposing (..)

import Json.Decode as Decode exposing (Decoder)

import Stellar.PublicKey as PublicKey exposing (PublicKey)
import Stellar.Endpoint as Endpoint exposing (Endpoint)

import Stellar.Resources.Data as Data exposing (Data)

import Stellar.Errors.Error as Error exposing (Error)

import Helpers.String


request : Endpoint -> PublicKey -> Key -> (Result Http.Error Response -> msg) -> Cmd msg
request endpoint publicKey key msg =

    HttpBuilder.get (url endpoint publicKey key)
        |> withExpect (Http.expectJson decoder)
        |> send msg


url : Endpoint -> PublicKey -> Key -> String
url endpoint publicKey key =
    Endpoint.toString endpoint
    ++ "/accounts/"
    ++ PublicKey.toString publicKey
    ++ "/data/"
    ++ keyToString key


type Key
    = UserId


keyToString : Key -> String
keyToString =
    toString >> Helpers.String.toHyphen


type Response
    = Error Error
    | Success Data


decoder : Decoder Response
decoder =
    Decode.oneOf
        [ Decode.map Error Error.decoder
        , Decode.map Success Data.decoder
        ]