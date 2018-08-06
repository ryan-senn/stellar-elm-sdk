module Stellar.Resources.Operation exposing (Operation (..), decoder)

{-| Operation Resource

# Union Type and decoder
@docs Operation, decoder

-}

import Json.Decode as Decode exposing (Decoder)

import Stellar.Resources.Operations.CreateAccount as CreateAccount exposing (CreateAccount)
import Stellar.Resources.Operations.Payment as Payment exposing (Payment)
import Stellar.Resources.Operations.PathPayment as PathPayment exposing (PathPayment)
import Stellar.Resources.Operations.ManageOffer as ManageOffer exposing (ManageOffer)
import Stellar.Resources.Operations.CreatePassiveOffer as CreatePassiveOffer exposing (CreatePassiveOffer)
import Stellar.Resources.Operations.SetOptions as SetOptions exposing (SetOptions)
import Stellar.Resources.Operations.ChangeTrust as ChangeTrust exposing (ChangeTrust)
import Stellar.Resources.Operations.AllowTrust as AllowTrust exposing (AllowTrust)
import Stellar.Resources.Operations.AccountMerge as AccountMerge exposing (AccountMerge)
import Stellar.Resources.Operations.Inflation as Inflation exposing (Inflation)
import Stellar.Resources.Operations.ManageData as ManageData exposing (ManageData)


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


{-| Decoder
-}
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