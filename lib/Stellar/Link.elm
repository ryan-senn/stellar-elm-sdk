module Stellar.Link exposing (Link, decoder)

{-| Record to represent a Link

# Type alias and Decoder
@docs Link, decoder

-}

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode


{-| Type alias
-}
type alias Link =
    { href : String
    , templated : Bool
    }


{-| Decoder
-}
decoder : Decoder Link
decoder =
    Decode.decode Link
        |> Decode.required "href" Decode.string
        |> Decode.optional "templated" Decode.bool False