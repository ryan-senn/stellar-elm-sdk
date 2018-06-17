module Endpoints.OperationsForTransaction.Msg exposing (Msg (..), SettingsMsg (..))

import Http

import Stellar.Sorting exposing (Sorting)

import Stellar.Endpoints.OperationsForTransaction as OperationsForTransaction

import Form.Input as Input
import Form.IntInput as IntInput

import Endpoints.OperationsForTransaction.Model exposing (Settings)


type Msg
    = SettingsMsg SettingsMsg
    | Request Input.Model Settings
    | Response (Result Http.Error OperationsForTransaction.Response)


type SettingsMsg
    = UpdateTransaction Input.Msg
    | UpdateCursor Input.Msg
    | UpdateLimit IntInput.Msg
    | UpdateSorting Sorting