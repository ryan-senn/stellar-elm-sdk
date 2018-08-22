module Stellar.Internal.Signer exposing (decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.Signer exposing (Signer)
import Stellar.Internal.PublicKey as PublicKey


decoder : Decoder Signer
decoder =
    Decode.decode Signer
        |> Decode.required "public_key" PublicKey.decoder
        |> Decode.required "weight" Decode.int
        |> Decode.required "key" PublicKey.decoder
        |> Decode.required "type" Decode.string