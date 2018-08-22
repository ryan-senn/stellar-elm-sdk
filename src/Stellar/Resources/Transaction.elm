module Stellar.Resources.Transaction exposing (Transaction , Links)

{-| Transaction Resource

# Type alias
@docs Transaction, Links

-}

import Date exposing (Date)

import Stellar.Link as Link exposing (Link)


{-| Transaction
-}
type alias Transaction =
    { id : String
    , pagingToken : String
    , hash : String
    , ledger : Int
    , createdAt : Date
    , sourceAccount : String
    , sourceAccountSequence : String
    , feePaid : Int
    , operationCount : Int
    , envelopeXdr : String
    , resultXdr : String
    , resultMetaXdr : String
    , feeMetaXdr : String
    , memoType : String
    , signatures : List String
    , links : Links
    }


{-| Links
-}
type alias Links =
    { self : Link
    , account : Link
    , ledger : Link
    , operations : Link
    , effects : Link
    , precedes : Link
    , succeeds : Link
    }