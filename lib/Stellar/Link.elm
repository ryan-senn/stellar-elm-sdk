module Stellar.Link exposing (Link, decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode


type alias Link =
    { href : String
    , templated : Bool
    }


decoder : Decoder Link
decoder =
    Decode.decode Link
        |> Decode.required "href" Decode.string
        |> Decode.optional "templated" Decode.bool False