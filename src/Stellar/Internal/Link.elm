module Stellar.Internal.Link exposing (decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode
import Stellar.Link exposing (Link)


decoder : Decoder Link
decoder =
    Decode.succeed Link
        |> Decode.required "href" Decode.string
        |> Decode.optional "templated" Decode.bool False
