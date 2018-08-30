module Stellar.Resources.Effects.Internal.AccountRemoved exposing (decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode
import Stellar.Resources.Effects.AccountRemoved exposing (AccountRemoved)
import Stellar.Resources.Effects.Internal.Links as Links


decoder : Decoder AccountRemoved
decoder =
    Decode.succeed AccountRemoved
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "account" Decode.string
        |> Decode.required "_links" Links.decoder
