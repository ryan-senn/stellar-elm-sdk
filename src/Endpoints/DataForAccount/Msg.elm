module Endpoints.DataForAccount.Msg exposing (Msg (..), SettingsMsg (..))

import Http

import Form.Input as Input
import Form.Select as Select

import Stellar.Endpoints.DataForAccount as DataForAccount

import Endpoints.DataForAccount.Model exposing (Settings)


type Msg
    = SettingsMsg SettingsMsg
    | Request Input.Model Settings
    | Response (Result Http.Error DataForAccount.Response)


type SettingsMsg
    = UpdatePublicKey Input.Msg
    | UpdateDataKey (Select.Msg DataForAccount.DataKey)