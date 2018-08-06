module Stellar.Flags exposing (Flags, decoder)

{-| Record to represent Flags

# Type alias and Decoder
@docs Flags, decoder

-}

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode


{-| Type alias
-}
type alias Flags =
    { authRequired : Bool
    , authRevocable : Bool
    }


{-| Decoder
-}
decoder : Decoder Flags
decoder =
    Decode.decode Flags
        |> Decode.required "auth_required" Decode.bool
        |> Decode.required "auth_revocable" Decode.bool