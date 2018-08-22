module Stellar.Resources.Internal.Orderbook exposing (decoder, listingDecoder, offerDecoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.Resources.Orderbook exposing (Orderbook, Listing, Offer)

import Stellar.Internal.RationalNumber as RationalNumber
import Stellar.Internal.AssetType as AssetType


decoder : Decoder Orderbook
decoder =
    Decode.decode Orderbook
        |> Decode.required "bids" (Decode.list listingDecoder)
        |> Decode.required "asks" (Decode.list listingDecoder)
        |> Decode.required "base" offerDecoder
        |> Decode.required "counter" offerDecoder


listingDecoder : Decoder Listing
listingDecoder =
    Decode.decode Listing
        |> Decode.required "price" Decode.string
        |> Decode.required "priceR" RationalNumber.decoder
        |> Decode.required "amount" Decode.string


offerDecoder : Decoder Offer
offerDecoder =
    Decode.decode Offer
        |> Decode.required "asset_type" AssetType.decoder