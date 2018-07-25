module Stellar.Resources.Payment exposing (Payment (..), decoder)

import Json.Decode as Decode exposing (Decoder)

import Stellar.Resources.Operations.CreateAccount as CreateAccount exposing (CreateAccount)
import Stellar.Resources.Operations.Payment as PaymentOperation
import Stellar.Resources.Operations.PathPayment as PathPayment exposing (PathPayment)
import Stellar.Resources.Operations.AccountMerge as AccountMerge exposing (AccountMerge)


type Payment
    = CreateAccount CreateAccount
    | Payment_ PaymentOperation.Payment
    | PathPayment PathPayment
    | AccountMerge AccountMerge


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