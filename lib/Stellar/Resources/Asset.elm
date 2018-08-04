module Stellar.Resources.Asset exposing (Asset, decoder)

{-| Record to represent an Asset Resource

# Type alias and Decoder
@docs Asset, decoder

-}

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.Flags as Flags exposing (Flags)
import Stellar.Link as Link exposing (Link)


{-| Type alias
-}
type alias Asset =
    { assetType : AssetType
    , assetCode : String
    , assetIssuer : String
    , amount : String
    , numAccounts : Int
    , flags : Flags
    , pagingToken : String
    , links_ : Links
    }


{-| Decoder
-}
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


type AssetType
    = CreditAlphanum4
    | CreditAlphanum12


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


{-| Links
-}
type alias Links =
    { toml : Link
    }


{-| Links decoder
-}
linksDecoder : Decoder Links
linksDecoder =
    Decode.decode Links
        |> Decode.required "toml" Link.decoder