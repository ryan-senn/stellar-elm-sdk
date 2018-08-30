module Stellar.Resources.Operations.Internal.Inflation exposing (decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Extra as Decode
import Json.Decode.Pipeline as Decode
import Stellar.Resources.Operations.Inflation exposing (Inflation)
import Stellar.Resources.Operations.Internal.Links as Links


decoder : Decoder Inflation
decoder =
    Decode.succeed Inflation
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "source_account" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "created_at" Decode.datetime
        |> Decode.required "transaction_hash" Decode.string
        |> Decode.required "_links" Links.decoder
