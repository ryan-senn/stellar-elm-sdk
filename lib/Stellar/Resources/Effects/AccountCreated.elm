module Stellar.Resources.Effects.AccountCreated exposing (AccountCreated, decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Extra as Decode
import Json.Decode.Pipeline as Decode

import Date exposing (Date)

import Stellar.Link as Link exposing (Link)


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
        |> Decode.required "_links" linksDecoder


type alias Links =
    { operation : Link
    , succeeds : Link
    , precedes : Link
    }


linksDecoder : Decoder Links
linksDecoder =
    Decode.decode Links
        |> Decode.required "operation" Link.decoder
        |> Decode.required "succeeds" Link.decoder
        |> Decode.required "precedes" Link.decoder