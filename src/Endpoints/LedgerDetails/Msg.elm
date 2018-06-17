module Endpoints.LedgerDetails.Msg exposing (Msg (..), SettingsMsg (..))

import Http

import Stellar.Endpoint exposing (Endpoint)

import Stellar.Endpoints.LedgerDetails as LedgerDetails

import Form.IntInput as IntInput


type Msg
    = SettingsMsg SettingsMsg
    | Request Endpoint Int
    | Response (Result Http.Error LedgerDetails.Response)


type SettingsMsg
    = UpdateSequence IntInput.Msg