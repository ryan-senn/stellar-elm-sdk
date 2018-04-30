module Stellar.RationalNumber exposing (RationalNumber, decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode


type alias RationalNumber =
    { n : Int
    , d : Int
    }


decoder : Decoder RationalNumber
decoder =
    Decode.decode RationalNumber
        |> Decode.required "n" Decode.int
        |> Decode.required "d" Decode.int