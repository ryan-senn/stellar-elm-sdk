module Stellar.Resources.Effects.Internal.SignerRemoved exposing (decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode
import Stellar.Internal.PublicKey as PublicKey
import Stellar.Resources.Effects.Internal.Links as Links
import Stellar.Resources.Effects.SignerRemoved exposing (SignerRemoved)


decoder : Decoder SignerRemoved
decoder =
    Decode.decode SignerRemoved
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "account" Decode.string
        |> Decode.required "weight" Decode.int
        |> Decode.required "public_key" PublicKey.decoder
        |> Decode.required "key" Decode.string
        |> Decode.required "_links" Links.decoder
