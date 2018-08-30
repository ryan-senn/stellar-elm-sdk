module Stellar.Resources.Operations.ManageData exposing (ManageData)

{-| Manage Data Operation


# Type alias

@docs ManageData

-}

import Time exposing (Posix)
import Stellar.Resources.Operations.Links exposing (Links)


{-| Manage Data
-}
type alias ManageData =
    { id : String
    , pagingToken : String
    , sourceAccount : String
    , type_ : String
    , typeI : Int
    , createdAt : Posix
    , transactionHash : String
    , name : String
    , value : String
    , links : Links
    }
