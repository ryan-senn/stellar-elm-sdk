module Stellar.Flags exposing (Flags, decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode


type alias Flags =
    { authRequired : Bool
    , authRevocable : Bool
    }


decoder : Decoder Flags
decoder =
    Decode.decode Flags
        |> Decode.required "auth_required" Decode.bool
        |> Decode.required "auth_revocable" Decode.bool