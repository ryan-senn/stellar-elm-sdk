module Stellar.Resources.Ledger exposing (Ledger, Links)

{-| Ledger Resource


# Type alias

@docs Ledger, Links

-}

import Date exposing (Date)
import Stellar.Link exposing (Link)


{-| Ledger
-}
type alias Ledger =
    { id : String
    , pagingToken : String
    , hash : String
    , prevHash : Maybe String
    , sequence : Int
    , transactionCount : Int
    , operationCount : Int
    , closedAt : Date
    , totalCoins : String
    , feePool : String
    , baseFee : Maybe Int
    , baseReverse : Maybe String
    , maxTxSetSize : Int
    , protocolVersion : Int
    , headerXdr : String
    , baseFeeInStroops : Int
    , baseReserveInStroops : Int
    , links_ : Links
    }


{-| Links
-}
type alias Links =
    { effects : Link
    , operations : Link
    , payments : Link
    , self : Link
    , transactions : Link
    }
