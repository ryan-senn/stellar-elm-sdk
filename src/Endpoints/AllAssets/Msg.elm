module Endpoints.AllAssets.Msg exposing (Msg (..), SettingsMsg (..))

import Http

import Stellar.Endpoint exposing (Endpoint)
import Stellar.PublicKey exposing (PublicKey)
import Stellar.Sorting exposing (Sorting)

import Stellar.Endpoints.AllAssets as AllAssets

import Form.Input as Input
import Form.IntInput as IntInput

import Endpoints.AllAssets.Model exposing (Settings)


type Msg
    = SettingsMsg SettingsMsg
    | Request Endpoint Settings
    | Response (Result Http.Error AllAssets.Response)


type SettingsMsg
    = UpdateAssetCode Input.Msg
    | UpdateAssetIssuer Input.Msg
    | UpdateCursor Input.Msg
    | UpdateLimit IntInput.Msg
    | UpdateSorting Sorting