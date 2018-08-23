module Stellar.Resources.Effects.AccountRemoved exposing (AccountRemoved)

{-| Account removed Effect

# Type alias
@docs AccountRemoved

-}

import Stellar.Resources.Effects.Links exposing (Links)


{-| Account Removed
-}
type alias AccountRemoved =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : Int
    , account : String
    , links : Links
    }