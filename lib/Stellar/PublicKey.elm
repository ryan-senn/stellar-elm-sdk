module Stellar.PublicKey exposing (PublicKey, decoder)

{-| String type alias for PublicKey, helping with the readability of type signatures

# String Formatting Helpers
@docs PublicKey, decoder

-}

import Json.Decode as Decode exposing (Decoder)


{-| Type alias
-}
type alias PublicKey =
    String


{-| Decoder
-}
decoder : Decoder PublicKey
decoder =
    Decode.string