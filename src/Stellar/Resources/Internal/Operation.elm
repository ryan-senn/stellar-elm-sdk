module Stellar.Resources.Internal.Operation exposing (decoder)

import Json.Decode as Decode exposing (Decoder)

import Stellar.Resources.Operation exposing (Operation (..))

import Stellar.Resources.Operations.Internal.CreateAccount as CreateAccount
import Stellar.Resources.Operations.Internal.Payment as Payment
import Stellar.Resources.Operations.Internal.PathPayment as PathPayment
import Stellar.Resources.Operations.Internal.ManageOffer as ManageOffer
import Stellar.Resources.Operations.Internal.CreatePassiveOffer as CreatePassiveOffer
import Stellar.Resources.Operations.Internal.SetOptions as SetOptions
import Stellar.Resources.Operations.Internal.ChangeTrust as ChangeTrust
import Stellar.Resources.Operations.Internal.AllowTrust as AllowTrust
import Stellar.Resources.Operations.Internal.AccountMerge as AccountMerge
import Stellar.Resources.Operations.Internal.Inflation as Inflation
import Stellar.Resources.Operations.Internal.ManageData as ManageData


decoder : Decoder Operation
decoder =
    Decode.field "type" Decode.string
        |> Decode.andThen operationFromType


operationFromType : String -> Decoder Operation
operationFromType type_ =

    case type_ of
        "create_account" ->
            Decode.map CreateAccount CreateAccount.decoder

        "payment" ->
            Decode.map Payment Payment.decoder

        "path_payment" ->
            Decode.map PathPayment PathPayment.decoder

        "manage_offer" ->
            Decode.map ManageOffer ManageOffer.decoder

        "create_passive_offer" ->
            Decode.map CreatePassiveOffer CreatePassiveOffer.decoder

        "set_options" ->
            Decode.map SetOptions SetOptions.decoder

        "change_trust" ->
            Decode.map ChangeTrust ChangeTrust.decoder

        "allow_trust" ->
            Decode.map AllowTrust AllowTrust.decoder

        "account_merge" ->
            Decode.map AccountMerge AccountMerge.decoder

        "inflation" ->
            Decode.map Inflation Inflation.decoder

        "manage_data" ->
            Decode.map ManageData ManageData.decoder

        _ ->
            Decode.fail "Could not decode Operation"