module Stellar.Resources.Effects.Internal.SignerCreated exposing (decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Extra as Decode
import Json.Decode.Pipeline as Decode
import Stellar.Internal.PublicKey as PublicKey
import Stellar.Resources.Effects.Internal.Links as Links
import Stellar.Resources.Effects.SignerCreated exposing (SignerCreated)


decoder : Decoder SignerCreated
decoder =
    Decode.decode SignerCreated
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "account" Decode.string
        |> Decode.required "weight" Decode.int
        |> Decode.required "public_key" PublicKey.decoder
        |> Decode.required "key" Decode.string
        |> Decode.required "created_at" Decode.date
        |> Decode.required "_links" Links.decoder
