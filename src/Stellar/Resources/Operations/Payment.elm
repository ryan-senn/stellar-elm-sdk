module Stellar.Resources.Operations.Payment exposing (Payment)

{-| Payment Operation

# Type alias
@docs Payment

-}

import Date exposing (Date)

import Stellar.Resources.Operations.Links exposing (Links)


{-| Payment
-}
type alias Payment =
    { id : String
    , pagingToken : String
    , sourceAccount : String
    , type_ : String
    , typeI : Int
    , createdAt : Date
    , transactionHash : String
    , from : String
    , to : String
    , amount : String
    , links : Links
    }