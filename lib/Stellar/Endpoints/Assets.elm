module Stellar.Http.Assets exposing (request, Response (..))

import Http
import HttpBuilder exposing (..)

import Json.Decode as Decode exposing (Decoder)

import Stellar.Endpoint as Endpoint exposing (Endpoint)
import Stellar.Page as Page exposing (Page)
import Stellar.Asset as Asset exposing (Asset)

import Stellar.Error as Error exposing (Error)


request : Endpoint -> (Result Http.Error Response -> msg) -> Cmd msg
request endpoint msg =

    HttpBuilder.get (url endpoint)
        |> withExpect (Http.expectJson decoder)
        |> send msg


url : Endpoint -> String
url endpoint =
    Endpoint.toString endpoint ++ "/assets"


type Response
    = Error Error
    | Success (Page Asset)


decoder : Decoder Response
decoder =
    Decode.oneOf
        [ Decode.map Error Error.decoder
        , Decode.map Success (Page.decoder Asset.decoder)
        ]