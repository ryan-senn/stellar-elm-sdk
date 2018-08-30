module Stellar.Resources.Effects.AccountFlagsUpdated exposing (AccountFlagsUpdated)

{-| Account Flags updated Effect


# Type alias

@docs AccountFlagsUpdated

-}

import Stellar.Resources.Effects.Links exposing (Links)


{-| Account Flags Updated
-}
type alias AccountFlagsUpdated =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : Int
    , account : String
    , authRequired : Bool
    , authRevokable : Bool
    , links : Links
    }
