module Stellar.Resources.Operations.PathPayment exposing (PathPayment, decoder)

import Date exposing (Date)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Extra as Decode
import Json.Decode.Pipeline as Decode

import Stellar.AssetType as AssetType exposing (AssetType)

import Stellar.Resources.Operations.Links as Links exposing (Links)


type alias PathPayment =
    { id : String
    , pagingToken : String
    , sourceAccount : String
    , type_ : String
    , typeI : Int
    , createdAt : Date
    , transactionHash : String
    , from : String
    , to : String
    , amount : String
    , assetCode : String
    , assetIssuer : String
    , assetType : AssetType
    , sourceMax : String
    , sourceAssetType : AssetType
    , sourceAssetCode : String
    , sourceAssetIssuer : String
    , links : Links
    }


decoder : Decoder PathPayment
decoder =
    Decode.decode PathPayment
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "source_account" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "created_at" Decode.date
        |> Decode.required "transaction_hash" Decode.string
        |> Decode.required "from" Decode.string
        |> Decode.required "to" Decode.string
        |> Decode.required "amount" Decode.string
        |> Decode.required "asset_code" Decode.string
        |> Decode.required "asset_issuer" Decode.string
        |> Decode.required "asset_type" AssetType.decoder
        |> Decode.required "source_max" Decode.string
        |> Decode.required "source_asset_type" AssetType.decoder
        |> Decode.required "source_asset_code" Decode.string
        |> Decode.required "source_asset_issuer" Decode.string
        |> Decode.required "_links" Links.decoder