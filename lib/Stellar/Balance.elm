module Stellar.Balance exposing (Balance, decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode


type alias Balance =
    { balance : String
    , assetType : String
    }


decoder : Decoder Balance
decoder =
    Decode.decode Balance
        |> Decode.required "balance" Decode.string
        |> Decode.required "asset_type" Decode.string