module Stellar.Resources.Internal.Offer exposing (decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode
import Stellar.Resources.Internal.Asset as Asset
import Stellar.Resources.Offer exposing (Offer)


decoder : Decoder Offer
decoder =
    Decode.succeed Offer
        |> Decode.required "id" Decode.int
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "seller" Decode.string
        |> Decode.required "selling" Asset.decoder
        |> Decode.required "buying" Asset.decoder
        |> Decode.required "amount" Decode.string
        |> Decode.required "price_r" Decode.string
        |> Decode.required "price" Decode.string
