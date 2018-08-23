module Stellar.Resources.Effects.AccountHomeDomainUpdated exposing (AccountHomeDomainUpdated)

{-| Account Home Domain updated Effect

# Type alias
@docs AccountHomeDomainUpdated

-}

import Stellar.Resources.Effects.Links exposing (Links)


{-| Account Home Domain Updated
-}
type alias AccountHomeDomainUpdated =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : Int
    , account : String
    , homeDomain : String
    , links : Links
    }