module Stellar.Resources.Payment exposing (Payment (..))

{-| Payment Resource

# Union Type
@docs Payment

-}

import Stellar.Resources.Operations.CreateAccount exposing (CreateAccount)
import Stellar.Resources.Operations.Payment as PaymentOperation
import Stellar.Resources.Operations.PathPayment exposing (PathPayment)
import Stellar.Resources.Operations.AccountMerge exposing (AccountMerge)


{-| Payment
-}
type Payment
    = CreateAccount CreateAccount
    | Payment_ PaymentOperation.Payment
    | PathPayment PathPayment
    | AccountMerge AccountMerge