module Stellar.Resources.Operations.AllowTrust exposing (AllowTrust, decoder)

import Date exposing (Date)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Extra as Decode
import Json.Decode.Pipeline as Decode

import Stellar.AssetType as AssetType exposing (AssetType)

import Stellar.Resources.Operations.Links as Links exposing (Links)


type alias AllowTrust =
    { id : String
    , pagingToken : String
    , sourceAccount : String
    , type_ : String
    , typeI : Int
    , createdAt : Date
    , transactionHash : String
    , assetType : AssetType
    , assetCode : String
    , assetIssuer : String
    , trustee : String
    , trustor : String
    , authorize : Bool
    , links : Links
    }


decoder : Decoder AllowTrust
decoder =
    Decode.decode AllowTrust
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "source_account" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "created_at" Decode.date
        |> Decode.required "transaction_hash" Decode.string
        |> Decode.required "asset_type" AssetType.decoder
        |> Decode.required "asset_code" Decode.string
        |> Decode.required "asset_issuer" Decode.string
        |> Decode.required "trustee" Decode.string
        |> Decode.required "trustor" Decode.string
        |> Decode.required "authorize" Decode.bool
        |> Decode.required "_links" Links.decoder