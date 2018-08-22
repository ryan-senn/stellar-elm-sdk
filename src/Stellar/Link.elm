module Stellar.Link exposing (Link)

{-| Record to represent a Link

# Type alias
@docs Link

-}


{-| Type alias
-}
type alias Link =
    { href : String
    , templated : Bool
    }