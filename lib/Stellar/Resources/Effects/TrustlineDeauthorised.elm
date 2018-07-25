module Stellar.Resources.Effects.TrustlineDeauthorised exposing (TrustlineDeauthorised, decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.Resources.Effects.Links as Links exposing (Links)
import Stellar.AssetType as AssetType exposing (AssetType)


type alias TrustlineDeauthorised =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : Int
    , account : String
    , trustor : String
    , assetType : AssetType
    , assetCode : Maybe String
    , links : Links
    }


decoder : Decoder TrustlineDeauthorised
decoder =
    Decode.decode TrustlineDeauthorised
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "account" Decode.string
        |> Decode.required "trustor" Decode.string
        |> Decode.required "asset_type" AssetType.decoder
        |> Decode.optional "asset_code" (Decode.maybe Decode.string) Nothing
        |> Decode.required "_links" Links.decoder