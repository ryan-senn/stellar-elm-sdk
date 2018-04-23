module Stellar.Links exposing (Links, decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.Link as Link exposing (Link)


type alias Links =
    { self : { href : String }
    , transactions : Link
    , operations : Link
    , payments : Link
    , effects: Link
    , offers : Link
    , trades : Link
    , data : Link
    }


decoder : Decoder Links
decoder =
    Decode.decode Links
        |> Decode.required "self" hrefDecoder
        |> Decode.required "transactions" Link.decoder
        |> Decode.required "operations" Link.decoder
        |> Decode.required "payments" Link.decoder
        |> Decode.required "effects" Link.decoder
        |> Decode.required "offers" Link.decoder
        |> Decode.required "trades" Link.decoder
        |> Decode.required "data" Link.decoder


type alias Href =
    { href : String
    }


hrefDecoder : Decoder Href
hrefDecoder =
    Decode.decode Href
        |> Decode.required "href" Decode.string