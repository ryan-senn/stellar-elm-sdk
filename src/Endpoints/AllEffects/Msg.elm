module Endpoints.AllEffects.Msg exposing (Msg (..), SettingsMsg (..))

import Http

import Stellar.Endpoint exposing (Endpoint)
import Stellar.Sorting exposing (Sorting)

import Stellar.Endpoints.AllEffects as AllEffects

import Form.Input as Input
import Form.IntInput as IntInput

import Endpoints.AllEffects.Model exposing (Settings)


type Msg
    = SettingsMsg SettingsMsg
    | Request Endpoint Settings
    | Response (Result Http.Error AllEffects.Response)


type SettingsMsg
    = UpdateCursor Input.Msg
    | UpdateLimit IntInput.Msg
    | UpdateSorting Sorting