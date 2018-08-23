module Stellar.Resources.Operations.ChangeTrust exposing (ChangeTrust)

{-| Change Trust Operation

# Type alias
@docs ChangeTrust

-}

import Date exposing (Date)

import Stellar.AssetType as AssetType exposing (AssetType)

import Stellar.Resources.Operations.Links exposing (Links)


{-| Change Trust
-}
type alias ChangeTrust =
    { id : String
    , pagingToken : String
    , sourceAccount : String
    , type_ : String
    , typeI : Int
    , createdAt : Date
    , transactionHash : String
    , assetType : AssetType
    , assetCode : String
    , assetIssuer : String
    , limit : String
    , trustee : String
    , trustor : String
    , links : Links
    }