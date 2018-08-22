module Stellar.Resources.Effects.Trade exposing (Trade)

{-| Trade Effect

# Type alias
@docs Trade

-}

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.Resources.Effects.Links as Links exposing (Links)
import Stellar.AssetType as AssetType exposing (AssetType)


{-| Type alias
-}
type alias Trade =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : Int
    , account : String
    , seller : String
    , offerId : Int
    , soldAmount : String
    , soldAssetType : AssetType
    , soldAssetCode : Maybe String
    , soldAssetIssuer : Maybe String
    , boughtAmount : String
    , boughtAssetType : AssetType
    , boughtAssetCode : Maybe String
    , boughtAssetIssuer : Maybe String
    , links : Links
    }


{-| Decoder
-}
decoder : Decoder Trade
decoder =
    Decode.decode Trade
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "account" Decode.string
        |> Decode.required "seller" Decode.string
        |> Decode.required "offer_id" Decode.int
        |> Decode.required "sold_amount" Decode.string
        |> Decode.required "sold_asset_type" AssetType.decoder
        |> Decode.optional "sold_asset_code" (Decode.maybe Decode.string) Nothing
        |> Decode.optional "sold_asset_issuer" (Decode.maybe Decode.string) Nothing
        |> Decode.required "bought_amount" Decode.string
        |> Decode.required "bought_asset_type" AssetType.decoder
        |> Decode.optional "bought_asset_code" (Decode.maybe Decode.string) Nothing
        |> Decode.optional "bought_asset_issuer" (Decode.maybe Decode.string) Nothing
        |> Decode.required "_links" Links.decoder