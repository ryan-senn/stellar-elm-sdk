module Stellar.Resources.Operations.ManageOffer exposing (ManageOffer)

{-| Manage Offer Operation

# Type alias
@docs ManageOffer

-}

import Date exposing (Date)

import Stellar.AssetType as AssetType exposing (AssetType)

import Stellar.Resources.Operations.Links exposing (Links)


{-| Manage Offer
-}
type alias ManageOffer =
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