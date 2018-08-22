module Stellar.Flags exposing (Flags)

{-| Record to represent Flags

# Type alias
@docs Flags

-}


{-| Type alias
-}
type alias Flags =
    { authRequired : Bool
    , authRevocable : Bool
    }