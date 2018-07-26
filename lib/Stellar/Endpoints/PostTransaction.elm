module Stellar.Endpoints.PostTransaction exposing
    ( requestBuilder, send
    , setCursor, setLimit, setSorting
    , Response (..)
    )

import Http
import HttpBuilder exposing (..)

import Json.Decode as Decode exposing (Decoder)

import Stellar.Sorting as Sorting exposing (Sorting)
import Stellar.Endpoint as Endpoint exposing (Endpoint)
import Stellar.PublicKey as PublicKey exposing (PublicKey)
import Stellar.Resources.Page as Page exposing (Page)
import Stellar.Resources.Transaction as Transaction exposing (Transaction)

import Stellar.Errors.Error as Error exposing (Error)


requestBuilder : Endpoint -> String -> RequestBuilder Response
requestBuilder endpoint transactionEnvelopeXdr =

    HttpBuilder.post (url endpoint)
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


url : Endpoint -> PublicKey -> String
url endpoint publicKey =

    Endpoint.toString endpoint
    ++ "/accounts/"
    ++ PublicKey.toString publicKey
    ++ "/transactions"


type Response
    = Error Error
    | Success (Page Transaction)


decoder : Decoder Response
decoder =
    Decode.oneOf
        [ Decode.map Error Error.decoder
        , Decode.map Success (Page.decoder Transaction.decoder)
        ]