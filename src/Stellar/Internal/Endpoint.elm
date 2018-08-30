module Stellar.Internal.Endpoint exposing (decoder)

import Json.Decode as Decode exposing (Decoder)
import Stellar.Endpoint exposing (Endpoint)


decoder : Decoder Endpoint
decoder =
    Decode.string
