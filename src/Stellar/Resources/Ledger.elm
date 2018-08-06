module Stellar.Resources.Ledger exposing (Ledger, decoder)

{-| Ledger Resource

# Type alias and decoder
@docs Ledger, decoder

-}

import Date exposing (Date)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Extra as Decode
import Json.Decode.Pipeline as Decode

import Stellar.Link as Link exposing (Link)


{-| Type alias
-}
type alias Ledger =
    { id : String
    , pagingToken : String
    , hash : String
    , prevHash : Maybe String
    , sequence : Int
    , transactionCount : Int
    , operationCount : Int
    , closedAt : Date
    , totalCoins : String
    , feePool : String
    , baseFee : Maybe Int
    , baseReverse : Maybe String
    , maxTxSetSize : Int
    , protocolVersion : Int
    , headerXdr : String
    , baseFeeInStroops : Int
    , baseReserveInStroops : Int
    , links_ : Links
    }


{-| Decoder
-}
decoder : Decoder Ledger
decoder =
    Decode.decode Ledger
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "hash" Decode.string
        |> Decode.optional "prev_hash" (Decode.maybe Decode.string) Nothing
        |> Decode.required "sequence" Decode.int
        |> Decode.required "transaction_count" Decode.int
        |> Decode.required "operation_count" Decode.int
        |> Decode.required "closed_at" Decode.date
        |> Decode.required "total_coins" Decode.string
        |> Decode.required "fee_pool" Decode.string
        |> Decode.optional "base_fee" (Decode.maybe Decode.int) Nothing
        |> Decode.optional "base_reverse" (Decode.maybe Decode.string) Nothing
        |> Decode.required "max_tx_set_size" Decode.int
        |> Decode.required "protocol_version" Decode.int
        |> Decode.required "header_xdr" Decode.string
        |> Decode.required "base_fee_in_stroops" Decode.int
        |> Decode.required "base_reserve_in_stroops" Decode.int
        |> Decode.required "_links" linksDecoder


{-| Links
-}
type alias Links =
    { effects : Link
    , operations : Link
    , payments : Link
    , self : Link
    , transactions : Link
    }


{-| Links decoder
-}
linksDecoder : Decoder Links
linksDecoder =
    Decode.decode Links
        |> Decode.required "effects" Link.decoder
        |> Decode.required "operations" Link.decoder
        |> Decode.required "payments" Link.decoder
        |> Decode.required "self" Link.decoder
        |> Decode.required "transactions" Link.decoder