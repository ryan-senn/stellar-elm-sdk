module Stellar.Resources.Effects.TrustlineAuthorised exposing (TrustlineAuthorised)

{-| Trustline authorised Effect

# Type alias
@docs TrustlineAuthorised

-}

import Stellar.Resources.Effects.Links exposing (Links)
import Stellar.AssetType exposing (AssetType)


{-| Trustline Authorised
-}
type alias TrustlineAuthorised =
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