module Stellar.Resources.Effects.TrustlineDeauthorised exposing (TrustlineDeauthorised)

{-| Trustline deauthorised Effect


# Type alias

@docs TrustlineDeauthorised

-}

import Stellar.AssetType exposing (AssetType)
import Stellar.Resources.Effects.Links exposing (Links)


{-| Trustline Deauthorised
-}
type alias TrustlineDeauthorised =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : Int
    , account : String
    , trustor : String
    , assetType : AssetType
    , assetCode : Maybe String
    , links : Links
    }
