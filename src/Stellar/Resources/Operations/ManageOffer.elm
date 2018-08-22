module Stellar.Resources.Operations.ManageOffer exposing (ManageOffer)

{-| Manage Offer Operation

# Type alias
@docs ManageOffer

-}

import Date exposing (Date)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Extra as Decode
import Json.Decode.Pipeline as Decode

import Stellar.AssetType as AssetType exposing (AssetType)

import Stellar.Resources.Operations.Links as Links exposing (Links)


{-| Type alias
-}
type alias ManageOffer =
    { id : String
    , pagingToken : String
    , sourceAccount : String
    , type_ : String
    , typeI : Int
    , createdAt : Date
    , transactionHash : String
    , offerId : Int
    , amount : String
    , price : String
    , priceR : String
    , buyingAssetType : AssetType
    , buyingAssetCode : String
    , buyingAssetIssuer : String
    , sellingAssetType : AssetType
    , sellingAssetCode : String
    , sellingAssetIssuer : String
    , links : Links
    }


{-| Decoder
-}
decoder : Decoder ManageOffer
decoder =
    Decode.decode ManageOffer
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "source_account" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "created_at" Decode.date
        |> Decode.required "transaction_hash" Decode.string
        |> Decode.required "offer_id" Decode.int
        |> Decode.required "amount" Decode.string
        |> Decode.required "price" Decode.string
        |> Decode.required "price_r" Decode.string
        |> Decode.required "buying_asset_type" AssetType.decoder
        |> Decode.required "buying_asset_code" Decode.string
        |> Decode.required "buying_asset_issuer" Decode.string
        |> Decode.required "selling_asset_type" AssetType.decoder
        |> Decode.required "selling_asset_code" Decode.string
        |> Decode.required "selling_asset_issuer" Decode.string
        |> Decode.required "_links" Links.decoder