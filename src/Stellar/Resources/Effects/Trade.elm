module Stellar.Resources.Effects.Trade exposing (Trade)

{-| Trade Effect

# Type alias
@docs Trade

-}

import Stellar.AssetType exposing (AssetType)

import Stellar.Resources.Effects.Links exposing (Links)


{-| Trade
-}
type alias Trade =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : Int
    , account : String
    , seller : String
    , offerId : Int
    , soldAmount : String
    , soldAssetType : AssetType
    , soldAssetCode : Maybe String
    , soldAssetIssuer : Maybe String
    , boughtAmount : String
    , boughtAssetType : AssetType
    , boughtAssetCode : Maybe String
    , boughtAssetIssuer : Maybe String
    , links : Links
    }