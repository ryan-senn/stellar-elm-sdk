module Stellar.Resources.Effects.Internal.AccountDebited exposing (decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Extra as Decode
import Json.Decode.Pipeline as Decode

import Stellar.Resources.Effects.AccountDebited exposing (AccountDebited)

import Stellar.Internal.AssetType as AssetType

import Stellar.Resources.Effects.Internal.Links as Links


decoder : Decoder AccountDebited
decoder =
    Decode.decode AccountDebited
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "account" Decode.string
        |> Decode.required "asset_type" AssetType.decoder
        |> Decode.required "amount" Decode.string
        |> Decode.required "created_at" Decode.date
        |> Decode.required "_links" Links.decoder