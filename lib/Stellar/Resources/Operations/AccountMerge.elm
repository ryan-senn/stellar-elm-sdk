module Stellar.Resources.Operations.AccountMerge exposing (AccountMerge, decoder)

import Date exposing (Date)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Extra as Decode
import Json.Decode.Pipeline as Decode

import Stellar.Resources.Operations.Links as Links exposing (Links)


{-| Type alias
-}
type alias AccountMerge =
    { id : String
    , pagingToken : String
    , sourceAccount : String
    , type_ : String
    , typeI : Int
    , createdAt : Date
    , transactionHash : String
    , account : String
    , into : String
    , links : Links
    }


{-| Decoder
-}
decoder : Decoder AccountMerge
decoder =
    Decode.decode AccountMerge
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "source_account" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "created_at" Decode.date
        |> Decode.required "transaction_hash" Decode.string
        |> Decode.required "account" Decode.string
        |> Decode.required "into" Decode.string
        |> Decode.required "_links" Links.decoder