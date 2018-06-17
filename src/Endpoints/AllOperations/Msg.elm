module Endpoints.AllOperations.Msg exposing (Msg (..), SettingsMsg (..))

import Http

import Stellar.Endpoint exposing (Endpoint)
import Stellar.PublicKey exposing (PublicKey)
import Stellar.Sorting exposing (Sorting)

import Stellar.Endpoints.AllOperations as AllOperations

import Form.Input as Input
import Form.IntInput as IntInput

import Endpoints.AllOperations.Model exposing (Settings)


type Msg
    = SettingsMsg SettingsMsg
    | Request Endpoint Settings
    | Response (Result Http.Error AllOperations.Response)


type SettingsMsg
    = UpdateCursor Input.Msg
    | UpdateLimit IntInput.Msg
    | UpdateSorting Sorting