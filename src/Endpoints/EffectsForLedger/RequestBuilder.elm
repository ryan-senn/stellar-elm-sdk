module Endpoints.EffectsForLedger.RequestBuilder exposing (requestBuilder)

import HttpBuilder exposing (RequestBuilder)

import Form.Input as Input
import Form.IntInput as IntInput

import Stellar.Endpoints.EffectsForLedger as EffectsForLedger

import Endpoints.Helpers as Helpers

import Endpoints.EffectsForLedger.Model exposing (Settings)


requestBuilder : Input.Model -> Settings -> RequestBuilder EffectsForLedger.Response
requestBuilder endpoint settings =

    EffectsForLedger.requestBuilder (Helpers.endpointFromInput endpoint) (IntInput.getValue settings.ledgerId |> Maybe.withDefault 0)
        |> Helpers.setIfChanged EffectsForLedger.setCursor Input.getIsChanged Input.getValue settings.cursor
        |> Helpers.setIfChangedMaybe EffectsForLedger.setLimit IntInput.getIsChanged IntInput.getValue settings.limit
        |> Helpers.setIfJust EffectsForLedger.setSorting settings.sorting