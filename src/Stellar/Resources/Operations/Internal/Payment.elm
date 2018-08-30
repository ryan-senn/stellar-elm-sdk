module Stellar.Resources.Operations.Internal.Payment exposing (decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Extra as Decode
import Json.Decode.Pipeline as Decode
import Stellar.Resources.Operations.Internal.Links as Links
import Stellar.Resources.Operations.Payment exposing (Payment)


decoder : Decoder Payment
decoder =
    Decode.decode Payment
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
        |> Decode.required "_links" Links.decoder
