module Endpoints.AccountDetails.Msg exposing (Msg (..), SettingsMsg (..))

import Http

import Stellar.Endpoint exposing (Endpoint)
import Stellar.PublicKey exposing (PublicKey)

import Stellar.Endpoints.AccountDetails as AccountDetails

import Form.Input as Input


type Msg
    = SettingsMsg SettingsMsg
    | Request Endpoint PublicKey
    | Response (Result Http.Error AccountDetails.Response)


type SettingsMsg
    = UpdatePublicKey Input.Msg