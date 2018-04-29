module Stellar.Resources.Operation exposing (Operation)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.Resources.Asset as Asset exposing (Asset)


type Operation
    = CreateAccount
    | Payment
    | PathPayment
    | ManageOffer
    | CreatePassiveOffer
    | SetOptions
    | ChangeTrust
    | AllowTrust
    | AccountMerge
    | Inflation
    | ManageData