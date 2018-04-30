module Stellar.Resources.Operation exposing (Operation)

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


decoder : Decoder Operation
decoder =
    Decode.oneOf
        [ CreateAccount.decoder
        , Payment.decoder
        , PathPayment.decoder
        , ManageOffer.decoder
        , CreatePassiveOffer.decoder
        , SetOptions.decoder
        , ChangeTrust.decoder
        , AllowTrust.decoder
        , AccountMerge.decoder
        , Inflation.decoder
        , ManageData.decoder
        ]