module Stellar.Endpoints.OrderbookDetails exposing
    ( requestBuilder, send
    , setSellingAssetCode, setSellingAssetIssuer
    , setBuyingAssetCode, setBuyingAssetIssuer
    , setLimit
    , Response (..)
    )

import Http
import HttpBuilder exposing (..)

import Json.Decode as Decode exposing (Decoder)

import Stellar.Endpoint as Endpoint exposing (Endpoint)
import Stellar.PublicKey as PublicKey exposing (PublicKey)
import Stellar.AssetType as AssetType exposing (AssetType)

import Stellar.Resources.Orderbook as Orderbook exposing (Orderbook)

import Stellar.Error as Error exposing (Error)


requestBuilder : Endpoint -> AssetType -> AssetType -> RequestBuilder Response
requestBuilder endpoint sellingAssetType buyingAssetType =

    HttpBuilder.get (url endpoint)
        |> withExpect (Http.expectJson decoder)
        |> withQueryParams [("selling_asset_type", AssetType.toString sellingAssetType)]
        |> withQueryParams [("buying_asset_type", AssetType.toString buyingAssetType)]


send : (Result Http.Error Response -> msg) -> RequestBuilder Response -> Cmd msg
send =
    HttpBuilder.send


setSellingAssetCode : String -> RequestBuilder Response -> RequestBuilder Response
setSellingAssetCode sellingAssetCode requestBuilder =
    requestBuilder
        |> withQueryParams [("selling_asset_code", sellingAssetCode)]


setSellingAssetIssuer : PublicKey -> RequestBuilder Response -> RequestBuilder Response
setSellingAssetIssuer sellingAssetIssuer requestBuilder =
    requestBuilder
        |> withQueryParams [("selling_asset_issuer", sellingAssetIssuer)]


setBuyingAssetCode : String -> RequestBuilder Response -> RequestBuilder Response
setBuyingAssetCode buyingAssetCode requestBuilder =
    requestBuilder
        |> withQueryParams [("buying_asset_code", buyingAssetCode)]


setBuyingAssetIssuer : PublicKey -> RequestBuilder Response -> RequestBuilder Response
setBuyingAssetIssuer buyingAssetIssuer requestBuilder =
    requestBuilder
        |> withQueryParams [("buying_asset_issuer", buyingAssetIssuer)]


setLimit : Int -> RequestBuilder Response -> RequestBuilder Response
setLimit limit requestBuilder =
    requestBuilder
        |> withQueryParams [("limit", toString limit)]


url : Endpoint -> String
url endpoint =

    endpoint ++ "/order_book"


type Response
    = Error Error
    | Success Orderbook


decoder : Decoder Response
decoder =
    Decode.oneOf
        [ Decode.map Error Error.decoder
        , Decode.map Success Orderbook.decoder
        ]