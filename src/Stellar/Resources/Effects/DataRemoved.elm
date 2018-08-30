module Stellar.Resources.Effects.DataRemoved exposing (DataRemoved)

{-| Data removed Effect


# Type alias

@docs DataRemoved

-}

import Stellar.Resources.Effects.Links exposing (Links)


{-| Data Removed
-}
type alias DataRemoved =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : Int
    , account : String
    , links : Links
    }
