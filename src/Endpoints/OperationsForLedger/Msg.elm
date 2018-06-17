module Endpoints.OperationsForLedger.Msg exposing (Msg (..), SettingsMsg (..))

import Http

import Stellar.Sorting exposing (Sorting)

import Stellar.Endpoints.OperationsForLedger as OperationsForLedger

import Form.Input as Input
import Form.IntInput as IntInput

import Endpoints.OperationsForLedger.Model exposing (Settings)


type Msg
    = SettingsMsg SettingsMsg
    | Request Input.Model Settings
    | Response (Result Http.Error OperationsForLedger.Response)


type SettingsMsg
    = UpdateLedgerId IntInput.Msg
    | UpdateCursor Input.Msg
    | UpdateLimit IntInput.Msg
    | UpdateSorting Sorting