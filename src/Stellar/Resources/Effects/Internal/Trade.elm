module Stellar.Resources.Effects.Internal.Trade exposing (decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.Resources.Effects.Trade exposing (Trade)

import Stellar.Internal.AssetType as AssetType

import Stellar.Resources.Effects.Internal.Links as Links


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
        |> Decode.required "sold_asset_type" AssetType.decoder
        |> Decode.optional "sold_asset_code" (Decode.maybe Decode.string) Nothing
        |> Decode.optional "sold_asset_issuer" (Decode.maybe Decode.string) Nothing
        |> Decode.required "bought_amount" Decode.string
        |> Decode.required "bought_asset_type" AssetType.decoder
        |> Decode.optional "bought_asset_code" (Decode.maybe Decode.string) Nothing
        |> Decode.optional "bought_asset_issuer" (Decode.maybe Decode.string) Nothing
        |> Decode.required "_links" Links.decoder