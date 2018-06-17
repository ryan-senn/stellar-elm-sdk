module Endpoints.OperationDetails.Msg exposing (Msg (..), SettingsMsg (..))

import Http

import Form.Input as Input
import Form.IntInput as IntInput

import Stellar.Endpoints.OperationDetails as OperationDetails

import Endpoints.OperationDetails.Model exposing (Settings)


type Msg
    = SettingsMsg SettingsMsg
    | Request Input.Model Settings
    | Response (Result Http.Error OperationDetails.Response)


type SettingsMsg
    = UpdatePublicKey IntInput.Msg