module Stellar.Resources.Orderbook exposing (Orderbook, decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.RationalNumber as RationalNumber exposing (RationalNumber)
import Stellar.Resources.Asset as Asset exposing (Asset)


type alias Orderbook =
    { bids : List Listing
    , asks : List Listing
    , selling : Asset
    , buying : Asset
    }


decoder : Decoder Orderbook
decoder =
    Decode.decode Orderbook
        |> Decode.required "bids" (Decode.list listingDecoder)
        |> Decode.required "asks" (Decode.list listingDecoder)
        |> Decode.required "selling" Asset.decoder
        |> Decode.required "buying" Asset.decoder


type alias Listing =
    { price : String
    , priceR : RationalNumber
    , amount : String
    }


listingDecoder : Decoder Listing
listingDecoder =
    Decode.decode Listing
        |> Decode.required "price" Decode.string
        |> Decode.required "priceR" RationalNumber.decoder
        |> Decode.required "amount" Decode.string