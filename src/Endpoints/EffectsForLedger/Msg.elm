module Endpoints.EffectsForLedger.Msg exposing (Msg (..), SettingsMsg (..))

import Http

import Stellar.Sorting exposing (Sorting)

import Stellar.Endpoints.EffectsForLedger as EffectsForLedger

import Form.Input as Input
import Form.IntInput as IntInput

import Endpoints.EffectsForLedger.Model exposing (Settings)


type Msg
    = SettingsMsg SettingsMsg
    | Request Input.Model Settings
    | Response (Result Http.Error EffectsForLedger.Response)


type SettingsMsg
    = UpdateLedgerId IntInput.Msg
    | UpdateCursor Input.Msg
    | UpdateLimit IntInput.Msg
    | UpdateSorting Sorting