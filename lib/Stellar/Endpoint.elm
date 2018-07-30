module Stellar.Endpoint exposing (Endpoint, decoder)

{-| String type alias for Endpoint, helping with the readability of type signatures

# String Formatting Helpers
@docs Endpoint, decoder

-}

import Json.Decode as Decode exposing (Decoder)


{-| Type alias
-}
type alias Endpoint =
    String


{-| Decoder
-}
decoder : Decoder Endpoint
decoder =
    Decode.string