module Stellar.Resources.Effects.OfferCreated exposing (OfferCreated)

{-| Offer created Effect


# Type alias

@docs OfferCreated

-}

import Stellar.Resources.Effects.Links exposing (Links)


{-| Offer Created
-}
type alias OfferCreated =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : Int
    , account : String
    , links : Links
    }
