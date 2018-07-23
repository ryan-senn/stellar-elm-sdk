module Endpoints.AllPayments.Msg exposing (Msg (..), SettingsMsg (..))

import Http

import Stellar.Endpoint exposing (Endpoint)
import Stellar.Sorting exposing (Sorting)

import Stellar.Endpoints.AllPayments as AllPayments

import Form.Input as Input
import Form.IntInput as IntInput

import Endpoints.AllPayments.Model exposing (Settings)


type Msg
    = SettingsMsg SettingsMsg
    | Request Endpoint Settings
    | Response (Result Http.Error AllPayments.Response)


type SettingsMsg
    = UpdateCursor Input.Msg
    | UpdateLimit IntInput.Msg
    | UpdateSorting Sorting