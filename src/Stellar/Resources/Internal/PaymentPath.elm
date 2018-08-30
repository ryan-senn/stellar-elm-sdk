module Stellar.Resources.Internal.PaymentPath exposing (decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode
import Stellar.Resources.Internal.Asset as Asset
import Stellar.Resources.PaymentPath exposing (PaymentPath)


decoder : Decoder PaymentPath
decoder =
    Decode.succeed PaymentPath
        |> Decode.required "path" (Decode.list Asset.decoder)
        |> Decode.required "source_amount" Decode.string
        |> Decode.required "destination_amount" Decode.string
        |> Decode.required "destination_asset_type" Decode.string
        |> Decode.optional "destination_asset_code" (Decode.maybe Decode.string) Nothing
        |> Decode.optional "destination_asset_issuer" (Decode.maybe Decode.string) Nothing
        |> Decode.required "source_asset_type" Decode.string
        |> Decode.optional "source_asset_code" (Decode.maybe Decode.string) Nothing
        |> Decode.optional "source_asset_issuer" (Decode.maybe Decode.string) Nothing
