module Stellar.Resources.Asset exposing (Asset, AssetType (..), Links)

{-| Asset Resource

# Type alias
@docs Asset, Links

-}

import Stellar.Flags exposing (Flags)
import Stellar.Link exposing (Link)


{-| Asset
-}
type alias Asset =
    { assetType : AssetType
    , assetCode : String
    , assetIssuer : String
    , amount : String
    , numAccounts : Int
    , flags : Flags
    , pagingToken : String
    , links_ : Links
    }


{-| Asset Types
-}
type AssetType
    = CreditAlphanum4
    | CreditAlphanum12


{-| Links
-}
type alias Links =
    { toml : Link
    }