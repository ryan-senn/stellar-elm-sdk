module Endpoints.AllLedgers.RequestBuilder exposing (requestBuilder)

import HttpBuilder exposing (RequestBuilder)

import Form.Input as Input
import Form.IntInput as IntInput

import Stellar.Endpoint exposing (Endpoint)

import Stellar.Endpoints.AllLedgers as AllLedgers

import Endpoints.Helpers as Helpers

import Endpoints.AllLedgers.Model exposing (Settings)


requestBuilder : Input.Model -> Settings -> RequestBuilder AllLedgers.Response
requestBuilder endpoint settings =

    AllLedgers.requestBuilder (Helpers.endpointFromInput endpoint)
        |> Helpers.setIfChanged AllLedgers.setCursor Input.getIsChanged Input.getValue settings.cursor
        |> Helpers.setIfChangedMaybe AllLedgers.setLimit IntInput.getIsChanged IntInput.getValue settings.limit
        |> Helpers.setIfJust AllLedgers.setSorting settings.sorting