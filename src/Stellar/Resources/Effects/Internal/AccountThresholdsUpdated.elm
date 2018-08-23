module Stellar.Resources.Effects.Internal.AccountThresholdsUpdated exposing (decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.Resources.Effects.AccountThresholdsUpdated exposing (AccountThresholdsUpdated)

import Stellar.Resources.Effects.Internal.Links as Links


decoder : Decoder AccountThresholdsUpdated
decoder =
    Decode.decode AccountThresholdsUpdated
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "account" Decode.string
        |> Decode.required "low_threshold" Decode.int
        |> Decode.required "mid_threshold" Decode.int
        |> Decode.required "high_threshold" Decode.int
        |> Decode.required "_links" Links.decoder