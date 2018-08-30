module Stellar.Resources.Effects.AccountThresholdsUpdated exposing (AccountThresholdsUpdated)

{-| Account Thresholds updated Effect


# Type alias

@docs AccountThresholdsUpdated

-}

import Stellar.Resources.Effects.Links exposing (Links)


{-| Account Thresholds Updated
-}
type alias AccountThresholdsUpdated =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : Int
    , account : String
    , lowThreshold : Int
    , medThreshold : Int
    , highThreshold : Int
    , links : Links
    }
