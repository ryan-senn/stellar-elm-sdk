module Stellar.RationalNumber exposing (RationalNumber)

{-| Record to represent Rational Numbers

# Type alias
@docs RationalNumber

-}


{-| Type alias
-}
type alias RationalNumber =
    { n : Int
    , d : Int
    }