module Stellar.Resources.Effects.Trade exposing (Trade, decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.Link as Link exposing (Link)
import Stellar.AssetType as AssetType exposing (AssetType)


type alias Trade =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : Int
    , account : String
    , links : Links
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
    }


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
        |> Decode.required "sold_asset_type" Decode.string
        |> Decode.optional "sold_asset_code" Decode.string Nothing
        |> Decode.optional "sold_asset_issuer" Decode.string Nothing
        |> Decode.required "bought_amount" Decode.string
        |> Decode.required "bought_asset_type" Decode.string
        |> Decode.optional "bought_asset_code" Decode.string Nothing
        |> Decode.optional "bought_asset_issuer" Decode.string Nothing
        |> Decode.required "_links" linksDecoder


type alias Links =
    { operation : Link
    , succeeds : Link
    , precedes : Link
    }


linksDecoder : Decoder Links
linksDecoder =
    Decode.decode Links
        |> Decode.required "operation" Link.decoder
        |> Decode.required "succeeds" Link.decoder
        |> Decode.required "precedes" Link.decoder