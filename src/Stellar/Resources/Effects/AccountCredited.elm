module Stellar.Resources.Effects.AccountCredited exposing (AccountCredited)

{-| Account Credited Effect


# Type alias

@docs AccountCredited

-}

import Date exposing (Date)
import Stellar.AssetType exposing (AssetType)
import Stellar.Resources.Effects.Links exposing (Links)


{-| Account Credited
-}
type alias AccountCredited =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : Int
    , account : String
    , assetType : AssetType
    , amount : String
    , createdAt : Date
    , links : Links
    }
