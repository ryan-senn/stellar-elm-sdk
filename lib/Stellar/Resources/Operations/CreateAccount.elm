module Stellar.Resources.Operations.CreateAccount exposing (CreateAccount, decoder)

import Date exposing (Date)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Extra as Decode
import Json.Decode.Pipeline as Decode

import Stellar.Resources.Operations.Links as Links exposing (Links)


type alias CreateAccount =
    { id : String
    , pagingToken : String
    , sourceAccount : String
    , type_ : String
    , typeI : Int
    , createdAt : Date
    , transactionHash : String
    , startingBalance : String
    , funder : String
    , account : String
    , links : Links
    }


decoder : Decoder CreateAccount
decoder =
    Decode.decode CreateAccount
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "source_account" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "created_at" Decode.date
        |> Decode.required "transaction_hash" Decode.string
        |> Decode.required "starting_balance" Decode.string
        |> Decode.required "funder" Decode.string
        |> Decode.required "account" Decode.string
        |> Decode.required "_links" Links.decoder