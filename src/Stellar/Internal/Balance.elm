module Stellar.Internal.Balance exposing (decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode
import Stellar.Balance exposing (Balance)
import Stellar.Internal.AssetType as AssetType


decoder : Decoder Balance
decoder =
    Decode.decode Balance
        |> Decode.required "balance" Decode.string
        |> Decode.required "asset_type" AssetType.decoder
