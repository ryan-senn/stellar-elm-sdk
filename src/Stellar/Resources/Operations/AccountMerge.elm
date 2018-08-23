module Stellar.Resources.Operations.AccountMerge exposing (AccountMerge)

{-| Account merge Operation

# Type alias
@docs AccountMerge

-}

import Date exposing (Date)

import Stellar.Resources.Operations.Links exposing (Links)


{-| Account Merge
-}
type alias AccountMerge =
    { id : String
    , pagingToken : String
    , sourceAccount : String
    , type_ : String
    , typeI : Int
    , createdAt : Date
    , transactionHash : String
    , account : String
    , into : String
    , links : Links
    }