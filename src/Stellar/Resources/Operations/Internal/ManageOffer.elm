module Stellar.Resources.Operations.Internal.ManageOffer exposing (decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Extra as Decode
import Json.Decode.Pipeline as Decode
import Stellar.Internal.AssetType as AssetType
import Stellar.Resources.Operations.Internal.Links as Links
import Stellar.Resources.Operations.ManageOffer exposing (ManageOffer)


decoder : Decoder ManageOffer
decoder =
    Decode.succeed ManageOffer
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "source_account" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "created_at" Decode.datetime
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
