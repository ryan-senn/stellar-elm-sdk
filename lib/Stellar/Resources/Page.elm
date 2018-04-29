module Stellar.Resources.Page exposing (Page, decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.Href as Href exposing (Href)


type alias Page a =
    { embedded_ : { records : List a }
    , links_ : Links
    }


decoder : Decoder record -> Decoder (Page record)
decoder recordDecoder =
    Decode.decode Page
        |> Decode.required "_embedded" (embeddedDecoder recordDecoder)
        |> Decode.required "_links" linksDecoder


type alias Embed a =
    { records : List a
    }


embeddedDecoder : Decoder record -> Decoder (Embed record)
embeddedDecoder recordDecoder =
    Decode.decode Embed
        |> Decode.required "records" (Decode.list recordDecoder)


type alias Links =
    { self : Href
    , prev : Href
    , next : Href
    }


linksDecoder : Decoder Links
linksDecoder =
    Decode.decode Links
        |> Decode.required "self" Href.decoder
        |> Decode.required "prev" Href.decoder
        |> Decode.required "next" Href.decoder