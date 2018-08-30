module Stellar.Resources.Operations.CreateAccount exposing (CreateAccount)

{-| Create Account Operation


# Type alias

@docs CreateAccount

-}

import Time exposing (Posix)
import Stellar.Resources.Operations.Links exposing (Links)


{-| Create Account
-}
type alias CreateAccount =
    { id : String
    , pagingToken : String
    , sourceAccount : String
    , type_ : String
    , typeI : Int
    , createdAt : Posix
    , transactionHash : String
    , startingBalance : String
    , funder : String
    , account : String
    , links : Links
    }
