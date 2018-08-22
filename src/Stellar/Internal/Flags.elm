module Stellar.Internal.Flags exposing (decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.Flags exposing (Flags)


{-| Decoder
-}
decoder : Decoder Flags
decoder =
    Decode.decode Flags
        |> Decode.required "auth_required" Decode.bool
        |> Decode.required "auth_revocable" Decode.bool