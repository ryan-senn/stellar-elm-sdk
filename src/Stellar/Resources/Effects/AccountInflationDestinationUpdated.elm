module Stellar.Resources.Effects.AccountInflationDestinationUpdated exposing (AccountInflationDestinationUpdated)

{-| Account Inflation Destination updated Effect


# Type alias

@docs AccountInflationDestinationUpdated

-}

import Stellar.Resources.Effects.Links exposing (Links)


{-| Account Inflation Destination Updated
-}
type alias AccountInflationDestinationUpdated =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : Int
    , account : String
    , links : Links
    }
