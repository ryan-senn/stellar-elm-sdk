module Stellar.Resources.Orderbook exposing (Orderbook, Listing, Offer)

{-| Orderbook Resource

# Type alias
@docs Orderbook, Listing, Offer

-}

import Stellar.RationalNumber exposing (RationalNumber)
import Stellar.AssetType exposing (AssetType)


{-| Orderbook
-}
type alias Orderbook =
    { bids : List Listing
    , asks : List Listing
    , base : Offer
    , counter : Offer
    }


{-| Listing
-}
type alias Listing =
    { price : String
    , priceR : RationalNumber
    , amount : String
    }


{-| Offer
-}
type alias Offer =
    { assetType : AssetType
    }