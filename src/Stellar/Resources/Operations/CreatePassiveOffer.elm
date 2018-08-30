module Stellar.Resources.Operations.CreatePassiveOffer exposing (CreatePassiveOffer)

{-| Create Passive Offer Operation


# Type alias

@docs CreatePassiveOffer

-}

import Date exposing (Date)
import Stellar.AssetType as AssetType exposing (AssetType)
import Stellar.Resources.Operations.Links exposing (Links)


{-| Create Passive Offer
-}
type alias CreatePassiveOffer =
    { id : String
    , pagingToken : String
    , sourceAccount : String
    , type_ : String
    , typeI : Int
    , createdAt : Date
    , transactionHash : String
    , offerId : Int
    , amount : String
    , price : String
    , priceR : String
    , buyingAssetType : AssetType
    , buyingAssetCode : String
    , buyingAssetIssuer : String
    , sellingAssetType : AssetType
    , sellingAssetCode : String
    , sellingAssetIssuer : String
    , links : Links
    }
