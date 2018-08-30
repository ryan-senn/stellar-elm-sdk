module Stellar.Resources.Operations.AccountMerge exposing (AccountMerge)

{-| Account merge Operation


# Type alias

@docs AccountMerge

-}

import Time exposing (Posix)
import Stellar.Resources.Operations.Links exposing (Links)


{-| Account Merge
-}
type alias AccountMerge =
    { id : String
    , pagingToken : String
    , sourceAccount : String
    , type_ : String
    , typeI : Int
    , createdAt : Posix
    , transactionHash : String
    , account : String
    , into : String
    , links : Links
    }
