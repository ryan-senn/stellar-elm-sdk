module Endpoints.FindPaymentPaths.Msg exposing (Msg (..), SettingsMsg (..))

import Http

import Form.Input as Input
import Form.IntInput as IntInput
import Form.Select as Select

import Stellar.AssetType exposing (AssetType)

import Stellar.Endpoints.FindPaymentPaths as FindPaymentPaths

import Endpoints.FindPaymentPaths.Model exposing (Settings)


type Msg
    = SettingsMsg SettingsMsg
    | Request Input.Model Settings
    | Response (Result Http.Error FindPaymentPaths.Response)


type SettingsMsg
    = UpdateSourceAccount Input.Msg
    | UpdateDestinationAccount Input.Msg
    | UpdateDestinationAssetType (Select.Msg AssetType)
    | UpdateDestinationAssetCode Input.Msg
    | UpdateDestinationAssetIssuer Input.Msg
    | UpdateDestinationAmount IntInput.Msg