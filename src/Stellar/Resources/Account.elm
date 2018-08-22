module Stellar.Resources.Account exposing (Account, Links)

{-| Account Resource

# Type alias
@docs Account, Links

-}

import Stellar.PublicKey as PublicKey exposing (PublicKey)
import Stellar.Thresholds as Thresholds exposing (Thresholds)
import Stellar.Flags as Flags exposing (Flags)
import Stellar.Balance as Balance exposing (Balance)
import Stellar.Signer as Signer exposing (Signer)
import Stellar.Link as Link exposing (Link)

import Stellar.Resources.Data exposing (Data)


{-| Account
-}
type alias Account =
    { id : PublicKey
    , accountId : PublicKey
    , sequence : String
    , subentryCount : Int
    , balances : List Balance
    , thresholds : Thresholds
    , signers : List Signer
    , data : Data
    , flags : Flags
    , pagingToken : String
    , links : Links
    }


{-| Links
-}
type alias Links =
    { toml : Maybe Link
    , data : Maybe Link
    , effects : Maybe Link
    , offers : Maybe Link
    , operations : Maybe Link
    , payments : Maybe Link
    , self : Maybe Link
    , trades : Maybe Link
    , transactions : Maybe Link
    }