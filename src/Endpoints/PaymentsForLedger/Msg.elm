module Endpoints.PaymentsForLedger.Msg exposing (Msg (..), SettingsMsg (..))

import Http

import Stellar.Sorting exposing (Sorting)

import Stellar.Endpoints.PaymentsForLedger as PaymentsForLedger

import Form.Input as Input
import Form.IntInput as IntInput

import Endpoints.PaymentsForLedger.Model exposing (Settings)


type Msg
    = SettingsMsg SettingsMsg
    | Request Input.Model Settings
    | Response (Result Http.Error PaymentsForLedger.Response)


type SettingsMsg
    = UpdateLedgerId IntInput.Msg
    | UpdateCursor Input.Msg
    | UpdateLimit IntInput.Msg
    | UpdateSorting Sorting