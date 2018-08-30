module Stellar.Resources.Trade exposing (Trade, Links)

{-| Trade Resource


# Type alias

@docs Trade, Links

-}

import Stellar.Link exposing (Link)
import Stellar.RationalNumber exposing (RationalNumber)
import Stellar.Resources.Asset exposing (Asset)


{-| Trade
-}
type alias Trade =
    { id : String
    , pagingToken : String
    , ledgerCloseTime : String
    , baseAccount : String
    , baseAmount : String
    , baseAssetType : String
    , baseAssetCode : String
    , baseAssetIssuer : String
    , counterAccount : String
    , counterAmount : String
    , counterAssetType : String
    , counterAssetCode : String
    , counterAssetIssuer : String
    , price : RationalNumber
    , baseIsSeller : Bool
    , links : Links
    }


{-| Links
-}
type alias Links =
    { base : Link
    , counter : Link
    , operation : Link
    }
