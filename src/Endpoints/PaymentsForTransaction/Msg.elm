module Endpoints.PaymentsForTransaction.Msg exposing (Msg (..), SettingsMsg (..))

import Http

import Stellar.Sorting exposing (Sorting)

import Stellar.Endpoints.PaymentsForTransaction as PaymentsForTransaction

import Form.Input as Input
import Form.IntInput as IntInput

import Endpoints.PaymentsForTransaction.Model exposing (Settings)


type Msg
    = SettingsMsg SettingsMsg
    | Request Input.Model Settings
    | Response (Result Http.Error PaymentsForTransaction.Response)


type SettingsMsg
    = UpdateTransaction Input.Msg
    | UpdateCursor Input.Msg
    | UpdateLimit IntInput.Msg
    | UpdateSorting Sorting