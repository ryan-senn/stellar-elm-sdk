module Stellar.Resources.PaymentPath exposing (PaymentPath, decoder)

{-| Payment Resource

# Type alias and decoder
@docs PaymentPath, decoder

-}

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.Resources.Asset as Asset exposing (Asset)


{-| Type alias
-}
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


{-| Decoder
-}
decoder : Decoder PaymentPath
decoder =
    Decode.decode PaymentPath
        |> Decode.required "path" (Decode.list Asset.decoder)
        |> Decode.required "source_amount" Decode.string
        |> Decode.required "destination_amount" Decode.string
        |> Decode.required "destination_asset_type" Decode.string
        |> Decode.optional "destination_asset_code" (Decode.maybe Decode.string) Nothing
        |> Decode.optional "destination_asset_issuer" (Decode.maybe Decode.string) Nothing
        |> Decode.required "source_asset_type" Decode.string
        |> Decode.optional "source_asset_code" (Decode.maybe Decode.string) Nothing
        |> Decode.optional "source_asset_issuer" (Decode.maybe Decode.string) Nothing