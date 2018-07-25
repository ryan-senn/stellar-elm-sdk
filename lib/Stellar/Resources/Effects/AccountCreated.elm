module Stellar.Resources.Effects.AccountCreated exposing (AccountCreated, decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Extra as Decode
import Json.Decode.Pipeline as Decode

import Date exposing (Date)

import Stellar.Resources.Effects.Links as Links exposing (Links)


type alias AccountCreated =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : Int
    , account : String
    , startingBalance : String
    , createdAt : Date
    , links : Links
    }


decoder : Decoder AccountCreated
decoder =
    Decode.decode AccountCreated
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "account" Decode.string
        |> Decode.required "starting_balance" Decode.string
        |> Decode.required "created_at" Decode.date
        |> Decode.required "_links" Links.decoder