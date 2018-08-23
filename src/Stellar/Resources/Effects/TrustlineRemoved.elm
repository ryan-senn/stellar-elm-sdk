module Stellar.Resources.Effects.TrustlineRemoved exposing (TrustlineRemoved)

{-| Trustline removed Effect

# Type alias
@docs TrustlineRemoved

-}

import Stellar.AssetType exposing (AssetType)

import Stellar.Resources.Effects.Links exposing (Links)


{-| Trustline Removed
-}
type alias TrustlineRemoved =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : Int
    , account : String
    , assetType : AssetType
    , limit : String
    , links : Links
    }