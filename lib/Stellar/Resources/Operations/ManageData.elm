module Stellar.Resources.Operations.ManageData exposing (ManageData, decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.Link as Link exposing (Link)
import Stellar.PublicKey as PublicKey exposing (PublicKey)


type alias ManageData =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : Int
    , sourceAccount : PublicKey
    , name : String
    , value : String
    , links : Links
    }


decoder : Decoder ManageData
decoder =
    Decode.decode ManageData
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "source_account" PublicKey.decoder
        |> Decode.required "name" Decode.string
        |> Decode.required "value" Decode.string
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