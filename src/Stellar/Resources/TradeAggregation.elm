module Stellar.Resources.TradeAggregation exposing (TradeAggregation)

{-| Trade Aggregation Resource

# Type alias
@docs TradeAggregation

-}

import Stellar.RationalNumber exposing (RationalNumber)


{-| Trade Aggregation
-}
type alias TradeAggregation =
    { timestamp : String
    , tradeCount : Int
    , baseVolume : String
    , counterVolume : String
    , avg : String
    , high : String
    , highR : RationalNumber
    , low : String
    , lowR : RationalNumber
    , open : String
    , openR : RationalNumber
    , close : String
    , closeR : RationalNumber
    }