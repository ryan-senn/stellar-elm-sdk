module Stellar.Resources.TradeAggregation exposing (TradeAggregation, decoder)

{-| Trade Aggregation Resource

# Type alias and decoder
@docs TradeAggregation, decoder

-}

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.RationalNumber as RationalNumber exposing (RationalNumber)


{-| Type alias
-}
type alias TradeAggregation =
    { timestamp : String
    , tradeCount : Int
    , baseVolume : String
    , counterVolume : String
    , avg : String
    , high : String
    , highR : RationalNumber
    , low : String
    , lowR : RationalNumber
    , open : String
    , openR : RationalNumber
    , close : String
    , closeR : RationalNumber
    }


{-| Decoder
-}
decoder : Decoder TradeAggregation
decoder =
    Decode.decode TradeAggregation
        |> Decode.required "timestamp" Decode.string
        |> Decode.required "trade_count" Decode.int
        |> Decode.required "base_volume" Decode.string
        |> Decode.required "counter_volume" Decode.string
        |> Decode.required "avg" Decode.string
        |> Decode.required "high" Decode.string
        |> Decode.required "high_r" RationalNumber.decoder
        |> Decode.required "low" Decode.string
        |> Decode.required "low_r" RationalNumber.decoder
        |> Decode.required "open" Decode.string
        |> Decode.required "open_r" RationalNumber.decoder
        |> Decode.required "close" Decode.string
        |> Decode.required "close_r" RationalNumber.decoder