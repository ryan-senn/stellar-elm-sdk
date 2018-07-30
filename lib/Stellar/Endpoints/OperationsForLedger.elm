module Stellar.Endpoints.OperationsForLedger exposing
    ( requestBuilder, send
    , setCursor, setLimit, setSorting
    , Response (..)
    )

import Http
import HttpBuilder exposing (..)

import Json.Decode as Decode exposing (Decoder)

import Stellar.Sorting as Sorting exposing (Sorting)
import Stellar.Endpoint as Endpoint exposing (Endpoint)
import Stellar.Resources.Page as Page exposing (Page)
import Stellar.Resources.Operation as Operation exposing (Operation)

import Stellar.Error as Error exposing (Error)


requestBuilder : Endpoint -> Int -> RequestBuilder Response
requestBuilder endpoint ledgerId =

    HttpBuilder.get (url endpoint ledgerId)
        |> withExpect (Http.expectJson decoder)


send : (Result Http.Error Response -> msg) -> RequestBuilder Response -> Cmd msg
send =
    HttpBuilder.send


setCursor : String -> RequestBuilder Response -> RequestBuilder Response
setCursor cursor requestBuilder =
    requestBuilder
        |> withQueryParams [("cursor", cursor)]


setLimit : Int -> RequestBuilder Response -> RequestBuilder Response
setLimit limit requestBuilder =
    requestBuilder
        |> withQueryParams [("limit", toString limit)]


setSorting : Sorting -> RequestBuilder Response -> RequestBuilder Response
setSorting sorting requestBuilder =
    requestBuilder
        |> withQueryParams [("order", Sorting.toString sorting)]


url : Endpoint -> Int -> String
url endpoint ledgerId =

    endpoint
    ++ "/ledgers/"
    ++ toString ledgerId
    ++ "/operations"


type Response
    = Error Error
    | Success (Page Operation)


decoder : Decoder Response
decoder =
    Decode.oneOf
        [ Decode.map Error Error.decoder
        , Decode.map Success (Page.decoder Operation.decoder)
        ]