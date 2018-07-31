module Stellar.Endpoints.FindPaymentPaths exposing
    ( requestBuilder, send
    , setDestinationAssetCode, setDestinationAssetIssuer
    , Response (..)
    )

import Http
import HttpBuilder exposing (..)

import Json.Decode as Decode exposing (Decoder)

import Stellar.Endpoint exposing (Endpoint)
import Stellar.PublicKey exposing (PublicKey)
import Stellar.AssetType as AssetType exposing (AssetType)

import Stellar.Resources.Operation as Operation exposing (Operation)

import Stellar.Error as Error exposing (Error)


requestBuilder : Endpoint -> PublicKey -> PublicKey -> AssetType -> Int -> RequestBuilder Response
requestBuilder endpoint sourceAccount destinationAccount assetType amount =

    HttpBuilder.get (url endpoint)
        |> withExpect (Http.expectJson decoder)
        |> withQueryParams [("source_account", sourceAccount)]
        |> withQueryParams [("destination_account", destinationAccount)]
        |> withQueryParams [("destination_asset_type", AssetType.toString assetType)]
        |> withQueryParams [("destination_amount", toString amount)]


send : (Result Http.Error Response -> msg) -> RequestBuilder Response -> Cmd msg
send =
    HttpBuilder.send


setDestinationAssetCode : String -> RequestBuilder Response -> RequestBuilder Response
setDestinationAssetCode destinationAssetCode requestBuilder =
    requestBuilder
        |> withQueryParams [("destination_asset_code", destinationAssetCode)]


setDestinationAssetIssuer : PublicKey -> RequestBuilder Response -> RequestBuilder Response
setDestinationAssetIssuer destinationAssetIssuer requestBuilder =
    requestBuilder
        |> withQueryParams [("destination_asset_issuer", destinationAssetIssuer)]


url : Endpoint -> String
url endpoint =

    endpoint ++ "/paths"


type Response
    = Error Error
    | Success Operation


decoder : Decoder Response
decoder =
    Decode.oneOf
        [ Decode.map Error Error.decoder
        , Decode.map Success Operation.decoder
        ]