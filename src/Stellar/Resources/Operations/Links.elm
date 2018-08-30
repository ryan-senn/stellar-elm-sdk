module Stellar.Resources.Operations.Links exposing (Links)

{-| Links common to all Operations


# Type alias

@docs Links

-}

import Stellar.Link exposing (Link)


{-| Links
-}
type alias Links =
    { self : Link
    , succeeds : Link
    , precedes : Link
    , effects : Link
    , transaction : Link
    }
