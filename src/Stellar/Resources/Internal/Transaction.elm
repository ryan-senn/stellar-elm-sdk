module Stellar.Resources.Internal.Transaction exposing (decoder, linksDecoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Extra as Decode
import Json.Decode.Pipeline as Decode
import Stellar.Internal.Link as Link
import Stellar.Resources.Transaction exposing (Links, Transaction)


decoder : Decoder Transaction
decoder =
    Decode.succeed Transaction
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "hash" Decode.string
        |> Decode.required "ledger" Decode.int
        |> Decode.required "created_at" Decode.datetime
        |> Decode.required "source_account" Decode.string
        |> Decode.required "source_account_sequence" Decode.string
        |> Decode.required "fee_paid" Decode.int
        |> Decode.required "operation_count" Decode.int
        |> Decode.required "envelope_xdr" Decode.string
        |> Decode.required "result_xdr" Decode.string
        |> Decode.required "result_meta_xdr" Decode.string
        |> Decode.required "fee_meta_xdr" Decode.string
        |> Decode.required "memo_type" Decode.string
        |> Decode.required "signatures" (Decode.list Decode.string)
        |> Decode.required "_links" linksDecoder


linksDecoder : Decoder Links
linksDecoder =
    Decode.succeed Links
        |> Decode.required "self" Link.decoder
        |> Decode.required "account" Link.decoder
        |> Decode.required "ledger" Link.decoder
        |> Decode.required "operations" Link.decoder
        |> Decode.required "effects" Link.decoder
        |> Decode.required "precedes" Link.decoder
        |> Decode.required "succeeds" Link.decoder
