module Endpoints.EffectsForOperation.Msg exposing (Msg (..), SettingsMsg (..))

import Http

import Stellar.Sorting exposing (Sorting)

import Stellar.Endpoints.EffectsForOperation as EffectsForOperation

import Form.Input as Input
import Form.IntInput as IntInput

import Endpoints.EffectsForOperation.Model exposing (Settings)


type Msg
    = SettingsMsg SettingsMsg
    | Request Input.Model Settings
    | Response (Result Http.Error EffectsForOperation.Response)


type SettingsMsg
    = UpdateOperationId IntInput.Msg
    | UpdateCursor Input.Msg
    | UpdateLimit IntInput.Msg
    | UpdateSorting Sorting