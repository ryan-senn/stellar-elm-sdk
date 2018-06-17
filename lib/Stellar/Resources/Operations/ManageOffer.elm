module Stellar.Resources.Operations.ManageOffer exposing (ManageOffer, decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.AssetType as AssetType exposing (AssetType)
import Stellar.Link as Link exposing (Link)


type alias ManageOffer =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : Int
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


decoder : Decoder ManageOffer
decoder =
    Decode.decode ManageOffer
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
    { self : Link
    , succeeds : Link
    , precedes : Link
    , effects : Link
    , transaction : Link
    }


linksDecoder : Decoder Links
linksDecoder =
    Decode.decode Links
        |> Decode.required "self" Link.decoder
        |> Decode.required "succeeds" Link.decoder
        |> Decode.required "precedes" Link.decoder
        |> Decode.required "effects" Link.decoder
        |> Decode.required "transaction" Link.decoder