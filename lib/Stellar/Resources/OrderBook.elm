module Stellar.Resources.Offer exposing (Offer, decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode


type alias Offer =
    { bids : String
    , asks : String
    , selling : String
    , buying : String
    }


decoder : Decoder Offer
decoder =
    Decode.decode Offer
        |> Decode.required "bids" Decode.string
        |> Decode.required "asks" Decode.string
        |> Decode.required "selling" Decode.string
        |> Decode.required "buying" Decode.string