module Stellar.AssetType exposing (AssetType (..), asList, decoder, toString)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode


type AssetType
    = Native
    | CreditAlphanum4
    | CreditAlphanum12


asList : List AssetType
asList =
    [ Native
    , CreditAlphanum4
    , CreditAlphanum12
    ]


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


toString : AssetType -> String
toString assetType =

    case assetType of
        Native ->
            "native"

        CreditAlphanum4 ->
            "credit_alphanum4"

        CreditAlphanum12 ->
            "credit_alphanum12"