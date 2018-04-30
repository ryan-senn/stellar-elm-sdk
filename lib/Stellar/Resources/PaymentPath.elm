module Stellar.Resources.PaymentPath exposing (PaymentPath, decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.Resources.Asset as Asset exposing (Asset)


type alias PaymentPath =
    { path : List Asset
    , sourceAmount : String
    , destinationAmount : String
    , destinationAssetType : String
    , destinationAssetCode : Maybe String
    , destinationAssetIssuer : Maybe String
    , sourceAssetType : String
    , sourceAssetCode : Maybe String
    , sourceAssetIssuer : Maybe String
    }


decoder : Decoder PaymentPath
decoder =
    Decode.decode PaymentPath
        |> Decode.required "id" Decode.string
        |> Decode.required "source_amount" Decode.string
        |> Decode.required "destination_amount" Decode.string
        |> Decode.required "destination_asset_type" Decode.string
        |> Decode.optional "destination_asset_code" (Decode.maybe Decode.string) Nothing
        |> Decode.optional "destination_asset_issuer" (Decode.maybe Decode.string) Nothing
        |> Decode.required "source_asset_type" Decode.string
        |> Decode.optional "source_asset_code" (Decode.maybe Decode.string) Nothing
        |> Decode.optional "source_asset_issuer" (Decode.maybe Decode.string) Nothing