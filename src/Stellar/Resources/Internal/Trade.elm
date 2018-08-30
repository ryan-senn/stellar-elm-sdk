module Stellar.Resources.Internal.Trade exposing (Trade, Links)

{-| Trade Resource


# Type alias

@docs Trade, Links

-}

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode
import Stellar.Link as Link exposing (Link)
import Stellar.RationalNumber as RationalNumber exposing (RationalNumber)
import Stellar.Resources.Asset as Asset exposing (Asset)


{-| Type alias
-}
type alias Trade =
    { id : String
    , pagingToken : String
    , ledgerCloseTime : String
    , baseAccount : String
    , baseAmount : String
    , baseAssetType : String
    , baseAssetCode : String
    , baseAssetIssuer : String
    , counterAccount : String
    , counterAmount : String
    , counterAssetType : String
    , counterAssetCode : String
    , counterAssetIssuer : String
    , price : RationalNumber
    , baseIsSeller : Bool
    , links : Links
    }


{-| Decoder
-}
decoder : Decoder Trade
decoder =
    Decode.decode Trade
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "ledger_close_time" Decode.string
        |> Decode.required "base_account" Decode.string
        |> Decode.required "base_amount" Decode.string
        |> Decode.required "base_asset_type" Decode.string
        |> Decode.required "base_asset_code" Decode.string
        |> Decode.required "base_asset_issuer" Decode.string
        |> Decode.required "counter_account" Decode.string
        |> Decode.required "counter_amount" Decode.string
        |> Decode.required "counter_asset_type" Decode.string
        |> Decode.required "counter_asset_code" Decode.string
        |> Decode.required "counter_asset_issuer" Decode.string
        |> Decode.required "price" RationalNumber.decoder
        |> Decode.required "base_is_seller" Decode.bool
        |> Decode.required "links" linksDecoder


{-| Links
-}
type alias Links =
    { base : Link
    , counter : Link
    , operation : Link
    }


linksDecoder : Decoder Links
linksDecoder =
    Decode.decode Links
        |> Decode.required "base" Link.decoder
        |> Decode.required "counter" Link.decoder
        |> Decode.required "operation" Link.decoder
