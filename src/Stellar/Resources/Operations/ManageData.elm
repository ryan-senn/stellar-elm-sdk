module Stellar.Resources.Operations.ManageData exposing (ManageData)

{-| Manage Data Operation


# Type alias

@docs ManageData

-}

import Date exposing (Date)
import Stellar.Resources.Operations.Links exposing (Links)


{-| Manage Data
-}
type alias ManageData =
    { id : String
    , pagingToken : String
    , sourceAccount : String
    , type_ : String
    , typeI : Int
    , createdAt : Date
    , transactionHash : String
    , name : String
    , value : String
    , links : Links
    }
