module Stellar.Balance exposing (Balance)

{-| Record to represent a Balance


# Type alias

@docs Balance

-}

import Stellar.AssetType as AssetType exposing (AssetType)


{-| Type alias
-}
type alias Balance =
    { balance : String
    , assetType : AssetType
    }
