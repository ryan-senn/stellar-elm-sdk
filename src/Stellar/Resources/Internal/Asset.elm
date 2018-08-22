module Stellar.Resources.Internal.Asset exposing (decoder, assetTypeDecoder, linksDecoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.Resources.Asset exposing (Asset, AssetType (..), Links)

import Stellar.Internal.Flags as Flags
import Stellar.Internal.Link as Link


decoder : Decoder Asset
decoder =
    Decode.decode Asset
        |> Decode.required "asset_type" assetTypeDecoder
        |> Decode.required "asset_code" Decode.string
        |> Decode.required "asset_issuer" Decode.string
        |> Decode.required "amount" Decode.string
        |> Decode.required "num_accounts" Decode.int
        |> Decode.required "flags" Flags.decoder
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "_links" linksDecoder


assetTypeDecoder : Decoder AssetType
assetTypeDecoder =
    Decode.string
        |> Decode.andThen stringToAssetType


stringToAssetType : String -> Decoder AssetType
stringToAssetType string =

    case string of

        "credit_alphanum4" ->
            Decode.succeed CreditAlphanum4

        "credit_alphanum12" ->
            Decode.succeed CreditAlphanum12

        _ ->
            Decode.fail "Could not decode AssetType"


linksDecoder : Decoder Links
linksDecoder =
    Decode.decode Links
        |> Decode.required "toml" Link.decoder