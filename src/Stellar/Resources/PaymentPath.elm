module Stellar.Resources.PaymentPath exposing (PaymentPath)

{-| Payment Path Resource

# Type alias
@docs PaymentPath

-}

import Stellar.Resources.Asset exposing (Asset)


{-| Payment Path
-}
type alias PaymentPath =
    { path : List Asset
    , sourceAmount : String
    , destinationAmount : String
    , destinationAssetType : String
    , destinationAssetCode : Maybe String
    , destinationAssetIssuer : Maybe String
    , sourceAssetType : String
    , sourceAssetCode : Maybe String
    , sourceAssetIssuer : Maybe String
    }