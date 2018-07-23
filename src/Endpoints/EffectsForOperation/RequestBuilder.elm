module Endpoints.EffectsForOperation.RequestBuilder exposing (requestBuilder)

import HttpBuilder exposing (RequestBuilder)

import Form.Input as Input
import Form.IntInput as IntInput

import Stellar.Endpoints.EffectsForOperation as EffectsForOperation

import Endpoints.Helpers as Helpers

import Endpoints.EffectsForOperation.Model exposing (Settings)


requestBuilder : Input.Model -> Settings -> RequestBuilder EffectsForOperation.Response
requestBuilder endpoint settings =

    EffectsForOperation.requestBuilder (Helpers.endpointFromInput endpoint) (IntInput.getValue settings.operationId |> Maybe.withDefault 0)
        |> Helpers.setIfChanged EffectsForOperation.setCursor Input.getIsChanged Input.getValue settings.cursor
        |> Helpers.setIfChangedMaybe EffectsForOperation.setLimit IntInput.getIsChanged IntInput.getValue settings.limit
        |> Helpers.setIfJust EffectsForOperation.setSorting settings.sorting