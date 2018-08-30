module Stellar.Resources.Effects.AccountDebited exposing (AccountDebited)

{-| Account Debited Effect


# Type alias

@docs AccountDebited

-}

import Time exposing (Posix)
import Stellar.AssetType exposing (AssetType)
import Stellar.Resources.Effects.Links exposing (Links)


{-| Account Debited
-}
type alias AccountDebited =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : Int
    , account : String
    , assetType : AssetType
    , amount : String
    , createdAt : Posix
    , links : Links
    }
