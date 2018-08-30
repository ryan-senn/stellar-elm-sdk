module Stellar.Resources.Operations.AllowTrust exposing (AllowTrust)

{-| Allow Trust Operation


# Type alias

@docs AllowTrust

-}

import Date exposing (Date)
import Stellar.AssetType as AssetType exposing (AssetType)
import Stellar.Resources.Operations.Links exposing (Links)


{-| Allow Trust
-}
type alias AllowTrust =
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
    , trustee : String
    , trustor : String
    , authorize : Bool
    , links : Links
    }
