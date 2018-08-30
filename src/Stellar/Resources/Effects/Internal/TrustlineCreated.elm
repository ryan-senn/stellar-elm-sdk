module Stellar.Resources.Effects.Internal.TrustlineCreated exposing (decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode
import Stellar.Internal.AssetType as AssetType
import Stellar.Resources.Effects.Internal.Links as Links
import Stellar.Resources.Effects.TrustlineCreated exposing (TrustlineCreated)


decoder : Decoder TrustlineCreated
decoder =
    Decode.succeed TrustlineCreated
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "account" Decode.string
        |> Decode.required "asset" AssetType.decoder
        |> Decode.required "limit" Decode.string
        |> Decode.required "_links" Links.decoder
