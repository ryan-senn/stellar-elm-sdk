module Stellar.Resources.Effects.Links exposing (Links)

{-| Links common to all Effects


# Type alias

@docs Links

-}

import Stellar.Link as Link exposing (Link)


{-| Links
-}
type alias Links =
    { operation : Link
    , succeeds : Link
    , precedes : Link
    }
