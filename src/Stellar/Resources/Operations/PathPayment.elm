module Stellar.Resources.Operations.PathPayment exposing (PathPayment)

{-| Path Payment Operation


# Type alias

@docs PathPayment

-}

import Time exposing (Posix)
import Stellar.AssetType as AssetType exposing (AssetType)
import Stellar.Resources.Operations.Links exposing (Links)


{-| Path Payment
-}
type alias PathPayment =
    { id : String
    , pagingToken : String
    , sourceAccount : String
    , type_ : String
    , typeI : Int
    , createdAt : Posix
    , transactionHash : String
    , from : String
    , to : String
    , amount : String
    , assetCode : String
    , assetIssuer : String
    , assetType : AssetType
    , sourceMax : String
    , sourceAssetType : AssetType
    , sourceAssetCode : String
    , sourceAssetIssuer : String
    , links : Links
    }
