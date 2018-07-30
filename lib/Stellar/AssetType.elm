module Stellar.AssetType exposing (AssetType (..), decoder, asList, toString)

{-| Union Type of Asset Types

# Union Type and Decoder
@docs AssetType, decoder, toString

# Helpers
@docs asList, toString

-}

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode


{-| Possible Asset Types
-}
type AssetType
    = Native
    | CreditAlphanum4
    | CreditAlphanum12


{-| Decoder
-}
decoder : Decoder AssetType
decoder =
    Decode.string
        |> Decode.andThen stringToAssetType


stringToAssetType : String -> Decoder AssetType
stringToAssetType string =

    case string of

        "native" ->
            Decode.succeed Native

        "credit_alphanum4" ->
            Decode.succeed CreditAlphanum4

        "credit_alphanum12" ->
            Decode.succeed CreditAlphanum12

        _ ->
            Decode.fail "Could not decode AssetType"


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