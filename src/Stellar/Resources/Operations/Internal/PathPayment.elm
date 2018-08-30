module Stellar.Resources.Operations.Internal.PathPayment exposing (decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Extra as Decode
import Json.Decode.Pipeline as Decode
import Stellar.Internal.AssetType as AssetType
import Stellar.Resources.Operations.Internal.Links as Links
import Stellar.Resources.Operations.PathPayment exposing (PathPayment)


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
