module Stellar.Resources.Effects.Internal.DataUpdated exposing (decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.Resources.Effects.DataUpdated exposing (DataUpdated)

import Stellar.Resources.Effects.Internal.Links as Links


decoder : Decoder DataUpdated
decoder =
    Decode.decode DataUpdated
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "account" Decode.string
        |> Decode.required "_links" Links.decoder