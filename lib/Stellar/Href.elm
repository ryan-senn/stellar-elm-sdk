module Stellar.Href exposing (Href, decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode


type alias Href =
    { href : String
    , templated : Bool
    }


decoder : Decoder Href
decoder =
    Decode.decode Href
        |> Decode.required "href" Decode.string
        |> Decode.optional "templated" Decode.string False