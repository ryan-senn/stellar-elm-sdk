module Stellar.Resources.Effects.Internal.TrustlineRemoved exposing (decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode
import Stellar.Internal.AssetType as AssetType
import Stellar.Resources.Effects.Internal.Links as Links
import Stellar.Resources.Effects.TrustlineRemoved exposing (TrustlineRemoved)


decoder : Decoder TrustlineRemoved
decoder =
    Decode.succeed TrustlineRemoved
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "account" Decode.string
        |> Decode.required "asset" AssetType.decoder
        |> Decode.required "limit" Decode.string
        |> Decode.required "_links" Links.decoder
