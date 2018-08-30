module Stellar.Resources.Internal.TradeAggregation exposing (decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode
import Stellar.Internal.RationalNumber as RationalNumber
import Stellar.Resources.TradeAggregation exposing (TradeAggregation)


decoder : Decoder TradeAggregation
decoder =
    Decode.succeed TradeAggregation
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
