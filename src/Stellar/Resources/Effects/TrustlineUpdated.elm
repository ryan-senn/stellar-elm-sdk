module Stellar.Resources.Effects.TrustlineUpdated exposing (TrustlineUpdated)

{-| Trustline updated Effect

# Type alias
@docs TrustlineUpdated

-}

import Stellar.AssetType exposing (AssetType)

import Stellar.Resources.Effects.Links exposing (Links)


{-| Trustline Updated
-}
type alias TrustlineUpdated =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : Int
    , account : String
    , assetType : AssetType
    , limit : String
    , links : Links
    }