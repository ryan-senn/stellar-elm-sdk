module Stellar.Resources.Effects.OfferCreated exposing (OfferCreated)

{-| Offer created Effect

# Type alias
@docs OfferCreated

-}

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.Resources.Effects.Links as Links exposing (Links)


{-| Type alias
-}
type alias OfferCreated =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : Int
    , account : String
    , links : Links
    }


{-| Decoder
-}
decoder : Decoder OfferCreated
decoder =
    Decode.decode OfferCreated
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "account" Decode.string
        |> Decode.required "_links" Links.decoder