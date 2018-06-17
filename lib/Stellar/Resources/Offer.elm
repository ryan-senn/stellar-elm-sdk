module Stellar.Resources.Offer exposing (Offer, decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.Resources.Asset as Asset exposing (Asset)


type alias Offer =
    { id : Int
    , pagingToken : String
    , seller : String
    , selling : Asset
    , buying : Asset
    , amount : String
    , priceR : String
    , price : String
    }


decoder : Decoder Offer
decoder =
    Decode.decode Offer
        |> Decode.required "id" Decode.int
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "seller" Decode.string
        |> Decode.required "selling" Asset.decoder
        |> Decode.required "buying" Asset.decoder
        |> Decode.required "amount" Decode.string
        |> Decode.required "price_r" Decode.string
        |> Decode.required "price" Decode.string