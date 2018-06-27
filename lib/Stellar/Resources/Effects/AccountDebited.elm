module Stellar.Resources.Effects.AccountDebited exposing (AccountDebited, decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.AssetType as AssetType exposing (AssetType)
import Stellar.Link as Link exposing (Link)


type alias AccountDebited =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : Int
    , account : String
    , asset : AssetType
    , amount : String
    , links : Links
    }


decoder : Decoder AccountDebited
decoder =
    Decode.decode AccountDebited
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "account" Decode.string
        |> Decode.required "starting_balance" Decode.string
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