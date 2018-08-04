module Stellar.Resources.Effects.AccountCredited exposing (AccountCredited, decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Extra as Decode
import Json.Decode.Pipeline as Decode

import Date exposing (Date)

import Stellar.AssetType as AssetType exposing (AssetType)
import Stellar.Resources.Effects.Links as Links exposing (Links)


{-| Type alias
-}
type alias AccountCredited =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : Int
    , account : String
    , assetType : AssetType
    , amount : String
    , createdAt : Date
    , links : Links
    }


{-| Decoder
-}
decoder : Decoder AccountCredited
decoder =
    Decode.decode AccountCredited
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "account" Decode.string
        |> Decode.required "asset_type" AssetType.decoder
        |> Decode.required "amount" Decode.string
        |> Decode.required "created_at" Decode.date
        |> Decode.required "_links" Links.decoder