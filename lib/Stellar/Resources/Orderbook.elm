module Stellar.Resources.Orderbook exposing (Orderbook, decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.RationalNumber as RationalNumber exposing (RationalNumber)
import Stellar.AssetType as AssetType exposing (AssetType)


type alias Orderbook =
    { bids : List Listing
    , asks : List Listing
    , base : Offer
    , counter : Offer
    }


decoder : Decoder Orderbook
decoder =
    Decode.decode Orderbook
        |> Decode.required "bids" (Decode.list listingDecoder)
        |> Decode.required "asks" (Decode.list listingDecoder)
        |> Decode.required "base" offerDecoder
        |> Decode.required "counter" offerDecoder


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


type alias Offer =
    { assetType : AssetType
    }


offerDecoder : Decoder Offer
offerDecoder =
    Decode.decode Offer
        |> Decode.required "asset_type" AssetType.decoder