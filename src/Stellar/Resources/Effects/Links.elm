module Stellar.Resources.Effects.Links exposing (Links)

{-| Links common to all Effects

# Type alias
@docs Links

-}

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.Link as Link exposing (Link)


{-| Links
-}
type alias Links =
    { operation : Link
    , succeeds : Link
    , precedes : Link
    }


{-| Decoder
-}
decoder : Decoder Links
decoder =
    Decode.decode Links
        |> Decode.required "operation" Link.decoder
        |> Decode.required "succeeds" Link.decoder
        |> Decode.required "precedes" Link.decoder