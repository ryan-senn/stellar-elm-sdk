module Stellar.Resources.Operations.ChangeTrust exposing (ChangeTrust, decoder)

{-| Change Trust Operation

# Type alias and decoder
@docs ChangeTrust, decoder

-}

import Date exposing (Date)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Extra as Decode
import Json.Decode.Pipeline as Decode

import Stellar.AssetType as AssetType exposing (AssetType)

import Stellar.Resources.Operations.Links as Links exposing (Links)


{-| Type alias
-}
type alias ChangeTrust =
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
    , limit : String
    , trustee : String
    , trustor : String
    , links : Links
    }


{-| Decoder
-}
decoder : Decoder ChangeTrust
decoder =
    Decode.decode ChangeTrust
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
        |> Decode.required "limit" Decode.string
        |> Decode.required "trustee" Decode.string
        |> Decode.required "trustor" Decode.string
        |> Decode.required "_links" Links.decoder