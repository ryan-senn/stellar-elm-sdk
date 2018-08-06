module Stellar.Resources.Transaction exposing
    ( Transaction, decoder
    , Links
    )

{-| Transaction Resource

# Type alias and decoder
@docs Transaction, decoder

-}

import Date exposing (Date)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Extra as Decode
import Json.Decode.Pipeline as Decode

import Stellar.Link as Link exposing (Link)


{-| Type alias
-}
type alias Transaction =
    { id : String
    , pagingToken : String
    , hash : String
    , ledger : Int
    , createdAt : Date
    , sourceAccount : String
    , sourceAccountSequence : String
    , feePaid : Int
    , operationCount : Int
    , envelopeXdr : String
    , resultXdr : String
    , resultMetaXdr : String
    , feeMetaXdr : String
    , memoType : String
    , signatures : List String
    , links : Links
    }


{-| Decoder
-}
decoder : Decoder Transaction
decoder =
    Decode.decode Transaction
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "hash" Decode.string
        |> Decode.required "ledger" Decode.int
        |> Decode.required "created_at" Decode.date
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


{-| Links
-}
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