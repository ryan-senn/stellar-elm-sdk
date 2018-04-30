module Stellar.Resources.Operations.CreateAccount exposing (CreateAccount, decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.Link as Link exposing (Link)


type alias CreateAccount =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : String
    , account : String
    , funder : String
    , startingBalance : String
    , links : Links
    }


decoder : Decoder CreateAccount
decoder =
    Decode.decode CreateAccount
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "account" Decode.string
        |> Decode.required "funder" Decode.string
        |> Decode.required "starting_balance" Decode.string
        |> Decode.required "_links" linksDecoder


type alias Links =
    { self : Link
    , succeeds : Link
    , precedes : Link
    , effects : Link
    , transaction : Link
    }


linksDecoder : Decoder Links
linksDecoder =
    Decode.decode Links
        |> Decode.required "self" Link.decoder
        |> Decode.required "succeeds" Link.decoder
        |> Decode.required "precedes" Link.decoder
        |> Decode.required "effects" Link.decoder
        |> Decode.required "transaction" Link.decoder