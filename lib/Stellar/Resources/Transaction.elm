module Stellar.Resources.Transaction exposing (Transaction, decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.Link as Link exposing (Link)


type alias Transaction =
    { id : String
    , pagingToken : String
    , hash : String
    , ledger : Int
    , account : String
    , accountSequence : Int
    , feePaid : Int
    , operationCount : Int
    , resultCode : Int
    , resultCodeS : String
    , envelopeXdr : String
    , resultXdr : String
    , resultMetaXdr : String
    , feeMetaXdr : String
    , links : Links
    }


decoder : Decoder Transaction
decoder =
    Decode.decode Transaction
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "hash" Decode.string
        |> Decode.required "ledger" Decode.int
        |> Decode.required "account" Decode.string
        |> Decode.required "account_sequence" Decode.int
        |> Decode.required "fee_paid" Decode.int
        |> Decode.required "operation_count" Decode.int
        |> Decode.required "result_code" Decode.int
        |> Decode.required "result_code_s" Decode.string
        |> Decode.required "envelope_xdr" Decode.string
        |> Decode.required "result_xdr" Decode.string
        |> Decode.required "result_meta_xdr" Decode.string
        |> Decode.required "fee_meta_xdr" Decode.string
        |> Decode.required "_links" linksDecoder


type alias Links =
    { self : Link
    , account : Link
    , ledger : Link
    , operations : Link
    , effects : Link
    , precedes : Link
    , succeeds : Link
    }


linksDecoder : Decoder Links
linksDecoder =
    Decode.decode Links
        |> Decode.required "self" Link.decoder
        |> Decode.required "account" Link.decoder
        |> Decode.required "ledger" Link.decoder
        |> Decode.required "operations" Link.decoder
        |> Decode.required "effects" Link.decoder
        |> Decode.required "precedes" Link.decoder
        |> Decode.required "succeeds" Link.decoder