module Stellar.Resources.Operations.CreatePassiveOffer exposing (CreatePassiveOffer, decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.AssetType as AssetType exposing (AssetType)
import Stellar.Href as Href exposing (Href)


type alias CreatePassiveOffer =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : String
    , offerId : Int
    , amount : String
    , buyingAssetCode : String
    , buyingAssetIssuer : String
    , buyingAssetType : AssetType
    , price : String
    , priceR : String
    , sellingAssetCode : String
    , sellingAssetIssuer : String
    , sellingAssetType : AssetType
    , links : Links
    }


decoder : Decoder CreatePassiveOffer
decoder =
    Decode.decode CreatePassiveOffer
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "offer_id" Decode.int
        |> Decode.required "amount" Decode.string
        |> Decode.required "buying_asset_code" Decode.string
        |> Decode.required "buying_asset_issuer" Decode.string
        |> Decode.required "buying_asset_type" AssetType.decoder
        |> Decode.required "price" Decode.string
        |> Decode.required "price_r" Decode.string
        |> Decode.required "selling_asset_code" Decode.string
        |> Decode.required "selling_asset_issuer" Decode.string
        |> Decode.required "selling_asset_type" AssetType.decoder
        |> Decode.required "_links" linksDecoder


type alias Links =
    { self : Href
    , succeeds : Href
    , precedes : Href
    , effects : Href
    , transaction : Href
    }


linksDecoder : Decoder Links
linksDecoder =
    Decode.decode Links
        |> Decode.required "self" Href.decoder
        |> Decode.required "succeeds" Href.decoder
        |> Decode.required "precedes" Href.decoder
        |> Decode.required "effects" Href.decoder
        |> Decode.required "transaction" Href.decoder