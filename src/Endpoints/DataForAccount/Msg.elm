module Endpoints.DataForAccount.Msg exposing (Msg (..), SettingsMsg (..))

import Http

import Stellar.Endpoint exposing (Endpoint)
import Stellar.PublicKey exposing (PublicKey)

import Stellar.Endpoints.DataForAccount as DataForAccount

import Form.Input as Input
import Form.Select as Select


type Msg
    = SettingsMsg SettingsMsg
    | Request Endpoint PublicKey DataForAccount.DataKey
    | Response (Result Http.Error DataForAccount.Response)


type SettingsMsg
    = UpdatePublicKey Input.Msg
    | UpdateDataKey (Select.Msg DataForAccount.DataKey)