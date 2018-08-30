module Stellar.Signer exposing (Signer)

{-| Record to represent a Signer


# Type alias

@docs Signer

-}

import Stellar.PublicKey as PublicKey exposing (PublicKey)


{-| Type alias
-}
type alias Signer =
    { publicKey : PublicKey
    , weight : Int
    , key : PublicKey
    , type_ : String
    }
