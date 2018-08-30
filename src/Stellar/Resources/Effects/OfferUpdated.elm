module Stellar.Resources.Effects.OfferUpdated exposing (OfferUpdated)

{-| Offer updated Effect


# Type alias

@docs OfferUpdated

-}

import Stellar.Resources.Effects.Links exposing (Links)


{-| Offer Updated
-}
type alias OfferUpdated =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : Int
    , account : String
    , links : Links
    }
