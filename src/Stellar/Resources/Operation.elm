module Stellar.Resources.Operation exposing (Operation(..))

{-| Operation Resource


# Union Type

@docs Operation

-}

import Stellar.Resources.Operations.AccountMerge exposing (AccountMerge)
import Stellar.Resources.Operations.AllowTrust exposing (AllowTrust)
import Stellar.Resources.Operations.ChangeTrust exposing (ChangeTrust)
import Stellar.Resources.Operations.CreateAccount exposing (CreateAccount)
import Stellar.Resources.Operations.CreatePassiveOffer exposing (CreatePassiveOffer)
import Stellar.Resources.Operations.Inflation exposing (Inflation)
import Stellar.Resources.Operations.ManageData exposing (ManageData)
import Stellar.Resources.Operations.ManageOffer exposing (ManageOffer)
import Stellar.Resources.Operations.PathPayment exposing (PathPayment)
import Stellar.Resources.Operations.Payment exposing (Payment)
import Stellar.Resources.Operations.SetOptions exposing (SetOptions)


{-| Union Type of all possible Operations
-}
type Operation
    = CreateAccount CreateAccount
    | Payment Payment
    | PathPayment PathPayment
    | ManageOffer ManageOffer
    | CreatePassiveOffer CreatePassiveOffer
    | SetOptions SetOptions
    | ChangeTrust ChangeTrust
    | AllowTrust AllowTrust
    | AccountMerge AccountMerge
    | Inflation Inflation
    | ManageData ManageData
