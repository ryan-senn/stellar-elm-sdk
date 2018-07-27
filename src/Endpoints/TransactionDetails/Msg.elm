module Endpoints.TransactionDetails.Msg exposing (Msg (..), SettingsMsg (..))

import Http

import Stellar.Endpoint exposing (Endpoint)

import Stellar.Endpoints.TransactionDetails as TransactionDetails

import Form.Input as Input


type Msg
    = SettingsMsg SettingsMsg
    | Request Endpoint String
    | Response (Result Http.Error TransactionDetails.Response)


type SettingsMsg
    = UpdateHash Input.Msg