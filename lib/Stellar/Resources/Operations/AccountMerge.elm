module Stellar.Resources.Operations.AccountMerge exposing (AccountMerge, decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.Href as Href exposing (Href)
import Stellar.PublicKey as PublicKey exposing (PublicKey)


type alias AccountMerge =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : String
    , into : String
    , links : Links
    }


decoder : Decoder AccountMerge
decoder =
    Decode.decode AccountMerge
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "into" Decode.string
        |> Decode.required "_links" linksDecoder


type alias Links =
    { self : Href
    , succeeds : Href
    , precedes : Href
    , effects : Href
    , transaction : Href
    }


linksDecoder : Decoder Links
linksDecoder =
    Decode.decode Links
        |> Decode.required "self" Href.decoder
        |> Decode.required "succeeds" Href.decoder
        |> Decode.required "precedes" Href.decoder
        |> Decode.required "effects" Href.decoder
        |> Decode.required "transaction" Href.decoder