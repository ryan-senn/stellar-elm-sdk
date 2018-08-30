module Stellar.Resources.Effects.OfferRemoved exposing (OfferRemoved)

{-| Offer removed Effect


# Type alias

@docs OfferRemoved

-}

import Stellar.Resources.Effects.Links exposing (Links)


{-| Offer Removed
-}
type alias OfferRemoved =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : Int
    , account : String
    , links : Links
    }
