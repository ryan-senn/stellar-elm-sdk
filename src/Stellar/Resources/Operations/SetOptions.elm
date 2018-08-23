module Stellar.Resources.Operations.SetOptions exposing (SetOptions)

{-| Set Options Operation

# Type alias
@docs SetOptions

-}

import Date exposing (Date)

import Stellar.PublicKey as PublicKey exposing (PublicKey)

import Stellar.Resources.Operations.Links exposing (Links)


{-| Set Options
-}
type alias SetOptions =
    { id : String
    , pagingToken : String
    , sourceAccount : String
    , type_ : String
    , typeI : Int
    , createdAt : Date
    , transactionHash : String
    , homeDomain : Maybe String
    , inflationDestination : Maybe String
    , masterKeyWeight : Maybe Int
    , signerKey : Maybe PublicKey
    , signerWeight : Maybe Int
    , setFlags : List Int
    , setFlagsS : List String
    , clearFlags : List Int
    , clearFlagsS : List String
    , lowThreshold : Maybe Int
    , medThreshold : Maybe Int
    , highThreshold : Maybe Int
    , links : Links
    }