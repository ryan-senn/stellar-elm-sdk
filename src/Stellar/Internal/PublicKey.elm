module Stellar.Internal.PublicKey exposing (decoder)

import Json.Decode as Decode exposing (Decoder)
import Stellar.PublicKey exposing (PublicKey)


decoder : Decoder PublicKey
decoder =
    Decode.string
