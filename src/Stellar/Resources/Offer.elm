module Stellar.Resources.Offer exposing (Offer)

{-| Offer Resource

# Type alias
@docs Offer

-}

import Stellar.Resources.Asset exposing (Asset)


{-| Offer
-}
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