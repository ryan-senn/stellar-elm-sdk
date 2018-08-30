module Stellar.AssetType exposing
    ( AssetType(..)
    , asList, toString
    )

{-| Union Type of Asset Types


# Union Type

@docs AssetType


# Helpers

@docs asList, toString

-}


{-| Union Type of Asset Types
-}
type AssetType
    = Native
    | CreditAlphanum4
    | CreditAlphanum12


{-| List representation of the Union Type
-}
asList : List AssetType
asList =
    [ Native
    , CreditAlphanum4
    , CreditAlphanum12
    ]


{-| String representation of the Union Type
-}
toString : AssetType -> String
toString assetType =
    case assetType of
        Native ->
            "native"

        CreditAlphanum4 ->
            "credit_alphanum4"

        CreditAlphanum12 ->
            "credit_alphanum12"
