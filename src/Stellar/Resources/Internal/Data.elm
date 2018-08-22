module Stellar.Resources.Internal.Data exposing (decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.Resources.Data exposing (Data)


decoder : Decoder Data
decoder =
    Decode.decode Data
        |> Decode.optional "value" (Decode.maybe Decode.string) Nothing