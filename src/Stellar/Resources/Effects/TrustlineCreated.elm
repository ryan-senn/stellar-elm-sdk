module Stellar.Resources.Effects.TrustlineCreated exposing (TrustlineCreated)

{-| Trustline created Effect


# Type alias

@docs TrustlineCreated

-}

import Stellar.AssetType exposing (AssetType)
import Stellar.Resources.Effects.Links exposing (Links)


{-| Trustline Created
-}
type alias TrustlineCreated =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : Int
    , account : String
    , assetType : AssetType
    , limit : String
    , links : Links
    }
