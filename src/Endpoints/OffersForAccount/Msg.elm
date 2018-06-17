module Endpoints.OffersForAccount.Msg exposing (Msg (..), SettingsMsg (..))

import Http

import Stellar.Endpoint exposing (Endpoint)
import Stellar.PublicKey exposing (PublicKey)
import Stellar.Sorting exposing (Sorting)

import Stellar.Endpoints.OffersForAccount as OffersForAccount

import Form.Input as Input
import Form.IntInput as IntInput

import Endpoints.OffersForAccount.Model exposing (Settings)


type Msg
    = SettingsMsg SettingsMsg
    | Request Input.Model Settings
    | Response (Result Http.Error OffersForAccount.Response)


type SettingsMsg
    = UpdateAccount Input.Msg
    | UpdateCursor Input.Msg
    | UpdateLimit IntInput.Msg
    | UpdateSorting Sorting