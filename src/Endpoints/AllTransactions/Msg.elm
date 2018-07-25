module Endpoints.AllTransactions.Msg exposing (Msg (..), SettingsMsg (..))

import Http

import Stellar.Endpoint exposing (Endpoint)
import Stellar.Sorting exposing (Sorting)

import Stellar.Endpoints.AllTransactions as AllTransactions

import Form.Input as Input
import Form.IntInput as IntInput

import Endpoints.AllTransactions.Model exposing (Settings)


type Msg
    = SettingsMsg SettingsMsg
    | Request Endpoint Settings
    | Response (Result Http.Error AllTransactions.Response)


type SettingsMsg
    = UpdateCursor Input.Msg
    | UpdateLimit IntInput.Msg
    | UpdateSorting Sorting