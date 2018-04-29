module Stellar.Resources.Ledger exposing (Ledger, decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode


type alias Ledger =
    { id : String
    , pagingToken : String
    , hash : String
    , prevHash : String
    , sequence : Int
    , transactionCount : Int
    , operationCount : Int
    , closedAt : String
    , totalCoins : String
    , feePool : String
    , baseFee : Int
    , baseReverse : String
    , maxTxSetSize : Int
    , protocolVersion : Int
    , headerXdr : String
    , baseFeeInStroops : Int
    , baseReserveInStroops : Int
    }


decoder : Decoder Ledger
decoder =
    Decode.decode Ledger
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "hash" Decode.string
        |> Decode.required "prev_hash" Decode.string
        |> Decode.required "sequence" Decode.int
        |> Decode.required "transaction_count" Decode.int
        |> Decode.required "operation_count" Decode.int
        |> Decode.required "closed_at" Decode.string
        |> Decode.required "total_coins" Decode.string
        |> Decode.required "fee_pool" Decode.string
        |> Decode.required "base_fee" Decode.int
        |> Decode.required "base_reverse" Decode.string
        |> Decode.required "max_tx_set_size" Decode.int
        |> Decode.required "protocol_version" Decode.int
        |> Decode.required "header_xdr" Decode.string
        |> Decode.required "base_fee_in_stroops" Decode.int
        |> Decode.required "base_reserve_in_stroops" Decode.int