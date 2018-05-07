module Stellar.Resources.Data exposing (Data, decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode


type alias Data =
    { value : Maybe String
    }


decoder : Decoder Data
decoder =
    Decode.decode Data
        |> Decode.optional "value" (Decode.maybe Decode.string) Nothing