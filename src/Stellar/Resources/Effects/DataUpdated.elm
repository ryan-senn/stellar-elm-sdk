module Stellar.Resources.Effects.DataUpdated exposing (DataUpdated)

{-| Data updated Effect


# Type alias

@docs DataUpdated

-}

import Stellar.Resources.Effects.Links exposing (Links)


{-| Type alias
-}
type alias DataUpdated =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : Int
    , account : String
    , links : Links
    }
