module Stellar.Balance exposing (Balance, decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.AssetType as AssetType exposing (AssetType)


type alias Balance =
    { balance : String
    , assetType : AssetType
    }


decoder : Decoder Balance
decoder =
    Decode.decode Balance
        |> Decode.required "balance" Decode.string
        |> Decode.required "asset_type" AssetType.decoder