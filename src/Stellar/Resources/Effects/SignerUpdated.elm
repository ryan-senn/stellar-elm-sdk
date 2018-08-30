module Stellar.Resources.Effects.SignerUpdated exposing (SignerUpdated)

{-| Signer updated Effect


# Type alias

@docs SignerUpdated

-}

import Stellar.PublicKey as PublicKey exposing (PublicKey)
import Stellar.Resources.Effects.Links exposing (Links)


{-| Type alias
-}
type alias SignerUpdated =
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
