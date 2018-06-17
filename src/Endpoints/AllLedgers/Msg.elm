module Endpoints.AllLedgers.Msg exposing (Msg (..), SettingsMsg (..))

import Http

import Stellar.Sorting exposing (Sorting)

import Stellar.Endpoints.AllLedgers as AllLedgers

import Form.Input as Input
import Form.IntInput as IntInput

import Endpoints.AllLedgers.Model exposing (Settings)


type Msg
    = SettingsMsg SettingsMsg
    | Request Input.Model Settings
    | Response (Result Http.Error AllLedgers.Response)


type SettingsMsg
    = UpdateCursor Input.Msg
    | UpdateLimit IntInput.Msg
    | UpdateSorting Sorting