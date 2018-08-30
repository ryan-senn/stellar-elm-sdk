module Stellar.Resources.Effects.SignerCreated exposing (SignerCreated)

{-| Signer created Effect


# Type alias

@docs SignerCreated

-}

import Time exposing (Posix)
import Stellar.PublicKey as PublicKey exposing (PublicKey)
import Stellar.Resources.Effects.Links exposing (Links)


{-| Signer Created
-}
type alias SignerCreated =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : Int
    , account : String
    , weight : Int
    , publicKey : PublicKey
    , key : String
    , createdAt : Posix
    , links : Links
    }
