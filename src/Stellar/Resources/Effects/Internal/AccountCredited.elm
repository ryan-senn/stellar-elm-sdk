module Stellar.Resources.Effects.Internal.AccountCredited exposing (decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Extra as Decode
import Json.Decode.Pipeline as Decode
import Stellar.Internal.AssetType as AssetType
import Stellar.Resources.Effects.AccountCredited exposing (AccountCredited)
import Stellar.Resources.Effects.Internal.Links as Links


decoder : Decoder AccountCredited
decoder =
    Decode.decode AccountCredited
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "account" Decode.string
        |> Decode.required "asset_type" AssetType.decoder
        |> Decode.required "amount" Decode.string
        |> Decode.required "created_at" Decode.date
        |> Decode.required "_links" Links.decoder
