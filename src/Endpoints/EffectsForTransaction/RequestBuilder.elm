module Endpoints.EffectsForTransaction.RequestBuilder exposing (requestBuilder)

import HttpBuilder exposing (RequestBuilder)

import Form.Input as Input
import Form.IntInput as IntInput

import Stellar.Endpoints.EffectsForTransaction as EffectsForTransaction

import Endpoints.Helpers as Helpers

import Endpoints.EffectsForTransaction.Model exposing (Settings)


requestBuilder : Input.Model -> Settings -> RequestBuilder EffectsForTransaction.Response
requestBuilder endpoint settings =

    EffectsForTransaction.requestBuilder (Helpers.endpointFromInput endpoint) (Input.getValue settings.transaction)
        |> Helpers.setIfChanged EffectsForTransaction.setCursor Input.getIsChanged Input.getValue settings.cursor
        |> Helpers.setIfChangedMaybe EffectsForTransaction.setLimit IntInput.getIsChanged IntInput.getValue settings.limit
        |> Helpers.setIfJust EffectsForTransaction.setSorting settings.sorting