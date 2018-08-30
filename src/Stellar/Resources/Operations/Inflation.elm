module Stellar.Resources.Operations.Inflation exposing (Inflation)

{-| Inflation Operation


# Type alias

@docs Inflation

-}

import Time exposing (Posix)
import Stellar.Resources.Operations.Links exposing (Links)


{-| Inflation
-}
type alias Inflation =
    { id : String
    , pagingToken : String
    , sourceAccount : String
    , type_ : String
    , typeI : Int
    , createdAt : Posix
    , transactionHash : String
    , links : Links
    }
