module Stellar.Resources.Internal.Payment exposing (decoder)

import Json.Decode as Decode exposing (Decoder)

import Stellar.Resources.Payment exposing (Payment (..))

import Stellar.Resources.Operations.Internal.CreateAccount as CreateAccount
import Stellar.Resources.Operations.Internal.Payment as PaymentOperation
import Stellar.Resources.Operations.Internal.PathPayment as PathPayment
import Stellar.Resources.Operations.Internal.AccountMerge as AccountMerge


decoder : Decoder Payment
decoder =
    Decode.field "type" Decode.string
        |> Decode.andThen operationFromType


operationFromType : String -> Decoder Payment
operationFromType type_ =

    case type_ of
        "create_account" ->
            Decode.map CreateAccount CreateAccount.decoder

        "payment" ->
            Decode.map Payment_ PaymentOperation.decoder

        "path_payment" ->
            Decode.map PathPayment PathPayment.decoder

        "account_merge" ->
            Decode.map AccountMerge AccountMerge.decoder

        _ ->
            Decode.fail "Could not decode Payment"