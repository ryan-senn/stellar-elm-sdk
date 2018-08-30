module Stellar.Resources.Effects.SignerRemoved exposing (SignerRemoved)

{-| Signer removed Effect


# Type alias

@docs SignerRemoved

-}

import Stellar.PublicKey as PublicKey exposing (PublicKey)
import Stellar.Resources.Effects.Links exposing (Links)


{-| Signer Removed
-}
type alias SignerRemoved =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : Int
    , account : String
    , weight : Int
    , publicKey : PublicKey
    , key : String
    , links : Links
    }
