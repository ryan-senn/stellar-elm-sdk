module Stellar.Resources.Effects.AccountCreated exposing (AccountCreated)

{-| Account Created Effect


# Type alias

@docs AccountCreated

-}

import Date exposing (Date)
import Stellar.Resources.Effects.Links exposing (Links)


{-| Account Created
-}
type alias AccountCreated =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : Int
    , account : String
    , startingBalance : String
    , createdAt : Date
    , links : Links
    }
