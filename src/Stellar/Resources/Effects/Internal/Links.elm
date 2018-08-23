module Stellar.Resources.Effects.Internal.Links exposing (decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.Resources.Effects.Links exposing (Links)

import Stellar.Internal.Link as Link


decoder : Decoder Links
decoder =
    Decode.decode Links
        |> Decode.required "operation" Link.decoder
        |> Decode.required "succeeds" Link.decoder
        |> Decode.required "precedes" Link.decoder