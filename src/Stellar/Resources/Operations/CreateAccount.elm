module Stellar.Resources.Operations.CreateAccount exposing (CreateAccount)

{-| Create Account Operation


# Type alias

@docs CreateAccount

-}

import Date exposing (Date)
import Stellar.Resources.Operations.Links exposing (Links)


{-| Create Account
-}
type alias CreateAccount =
    { id : String
    , pagingToken : String
    , sourceAccount : String
    , type_ : String
    , typeI : Int
    , createdAt : Date
    , transactionHash : String
    , startingBalance : String
    , funder : String
    , account : String
    , links : Links
    }
