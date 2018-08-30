module Stellar.Resources.Effects.Internal.TrustlineDeauthorised exposing (decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode
import Stellar.Internal.AssetType as AssetType
import Stellar.Resources.Effects.Internal.Links as Links
import Stellar.Resources.Effects.TrustlineDeauthorised exposing (TrustlineDeauthorised)


decoder : Decoder TrustlineDeauthorised
decoder =
    Decode.succeed TrustlineDeauthorised
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "account" Decode.string
        |> Decode.required "trustor" Decode.string
        |> Decode.required "asset_type" AssetType.decoder
        |> Decode.optional "asset_code" (Decode.maybe Decode.string) Nothing
        |> Decode.required "_links" Links.decoder
