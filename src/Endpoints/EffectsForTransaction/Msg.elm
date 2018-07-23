module Endpoints.EffectsForTransaction.Msg exposing (Msg (..), SettingsMsg (..))

import Http

import Stellar.Sorting exposing (Sorting)

import Stellar.Endpoints.EffectsForTransaction as EffectsForTransaction

import Form.Input as Input
import Form.IntInput as IntInput

import Endpoints.EffectsForTransaction.Model exposing (Settings)


type Msg
    = SettingsMsg SettingsMsg
    | Request Input.Model Settings
    | Response (Result Http.Error EffectsForTransaction.Response)


type SettingsMsg
    = UpdateTransaction Input.Msg
    | UpdateCursor Input.Msg
    | UpdateLimit IntInput.Msg
    | UpdateSorting Sorting