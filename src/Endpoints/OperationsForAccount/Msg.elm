module Endpoints.OperationsForAccount.Msg exposing (Msg (..), SettingsMsg (..))

import Http

import Stellar.Sorting exposing (Sorting)

import Stellar.Endpoints.OperationsForAccount as OperationsForAccount

import Form.Input as Input
import Form.IntInput as IntInput

import Endpoints.OperationsForAccount.Model exposing (Settings)


type Msg
    = SettingsMsg SettingsMsg
    | Request Input.Model Settings
    | Response (Result Http.Error OperationsForAccount.Response)


type SettingsMsg
    = UpdateAccount Input.Msg
    | UpdateCursor Input.Msg
    | UpdateLimit IntInput.Msg
    | UpdateSorting Sorting