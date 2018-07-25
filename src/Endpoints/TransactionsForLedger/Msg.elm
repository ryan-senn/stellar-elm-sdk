module Endpoints.TransactionsForLedger.Msg exposing (Msg (..), SettingsMsg (..))

import Http

import Stellar.Sorting exposing (Sorting)

import Stellar.Endpoints.TransactionsForLedger as TransactionsForLedger

import Form.Input as Input
import Form.IntInput as IntInput

import Endpoints.TransactionsForLedger.Model exposing (Settings)


type Msg
    = SettingsMsg SettingsMsg
    | Request Input.Model Settings
    | Response (Result Http.Error TransactionsForLedger.Response)


type SettingsMsg
    = UpdateLedgerId IntInput.Msg
    | UpdateCursor Input.Msg
    | UpdateLimit IntInput.Msg
    | UpdateSorting Sorting