module Stellar.RationalNumber exposing (RationalNumber, decoder)

{-| Record to represent Rational Numbers

# Type alias and Decoder
@docs RationalNumber, decoder

-}

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode


{-| Type alias
-}
type alias RationalNumber =
    { n : Int
    , d : Int
    }


{-| Decoder
-}
decoder : Decoder RationalNumber
decoder =
    Decode.decode RationalNumber
        |> Decode.required "n" Decode.int
        |> Decode.required "d" Decode.int