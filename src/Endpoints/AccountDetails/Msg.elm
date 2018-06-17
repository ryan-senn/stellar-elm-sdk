module Endpoints.AccountDetails.Msg exposing (Msg (..), SettingsMsg (..))

import Http

import Form.Input as Input

import Stellar.Endpoints.AccountDetails as AccountDetails

import Endpoints.AccountDetails.Model exposing (Settings)


type Msg
    = SettingsMsg SettingsMsg
    | Request Input.Model Settings
    | Response (Result Http.Error AccountDetails.Response)


type SettingsMsg
    = UpdatePublicKey Input.Msg