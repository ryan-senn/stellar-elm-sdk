module Stellar.Resources.Effects.Internal.OfferCreated exposing (decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode
import Stellar.Resources.Effects.Internal.Links as Links
import Stellar.Resources.Effects.OfferCreated exposing (OfferCreated)


decoder : Decoder OfferCreated
decoder =
    Decode.succeed OfferCreated
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "account" Decode.string
        |> Decode.required "_links" Links.decoder
