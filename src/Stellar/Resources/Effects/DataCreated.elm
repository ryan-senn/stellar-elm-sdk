module Stellar.Resources.Effects.DataCreated exposing (DataCreated)

{-| Data created Effect


# Type alias

@docs DataCreated

-}

import Stellar.Resources.Effects.Links exposing (Links)


{-| Data Created
-}
type alias DataCreated =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : Int
    , account : String
    , links : Links
    }
