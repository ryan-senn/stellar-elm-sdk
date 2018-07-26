module Endpoints.PostTransaction.Msg exposing (Msg (..), SettingsMsg (..))

import Http

import Stellar.AssetType exposing (AssetType)

import Stellar.Endpoints.PostTransaction as PostTransaction

import Form.Input as Input
import Form.TextArea as TextArea

import Endpoints.PostTransaction.Model exposing (Settings)


type Msg
    = SettingsMsg SettingsMsg
    | Request Input.Model Settings
    | Response (Result Http.Error PostTransaction.Response)


type SettingsMsg
    = UpdateTransactionEnvelopeXdr TextArea.Msg