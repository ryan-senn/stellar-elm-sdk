module Stellar.Resources.Operations.Payment exposing (Payment)

{-| Payment Operation


# Type alias

@docs Payment

-}

import Time exposing (Posix)
import Stellar.Resources.Operations.Links exposing (Links)


{-| Payment
-}
type alias Payment =
    { id : String
    , pagingToken : String
    , sourceAccount : String
    , type_ : String
    , typeI : Int
    , createdAt : Posix
    , transactionHash : String
    , from : String
    , to : String
    , amount : String
    , links : Links
    }
