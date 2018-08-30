module Stellar.Resources.Operations.Internal.AllowTrust exposing (decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Extra as Decode
import Json.Decode.Pipeline as Decode
import Stellar.Internal.AssetType as AssetType
import Stellar.Resources.Operations.AllowTrust exposing (AllowTrust)
import Stellar.Resources.Operations.Internal.Links as Links


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
