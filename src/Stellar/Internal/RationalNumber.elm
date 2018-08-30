module Stellar.Internal.RationalNumber exposing (decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode
import Stellar.RationalNumber exposing (RationalNumber)


decoder : Decoder RationalNumber
decoder =
    Decode.succeed RationalNumber
        |> Decode.required "n" Decode.int
        |> Decode.required "d" Decode.int
