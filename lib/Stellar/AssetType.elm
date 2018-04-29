module Stellar.AssetType exposing (AssetType, decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode


type AssetType
    = Native
    | CreditAlphanum4
    | CreditAlphanum12


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