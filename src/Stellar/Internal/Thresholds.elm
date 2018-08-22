module Stellar.Internal.Thresholds exposing (decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.Thresholds exposing (Thresholds)


decoder : Decoder Thresholds
decoder =
    Decode.decode Thresholds
        |> Decode.required "low_threshold" Decode.int
        |> Decode.required "med_threshold" Decode.int
        |> Decode.required "high_threshold" Decode.int