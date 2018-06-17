module Endpoints.OperationsForLedger.RequestBuilder exposing (requestBuilder)

import HttpBuilder exposing (RequestBuilder)

import Form.Input as Input
import Form.IntInput as IntInput

import Stellar.Endpoints.OperationsForLedger as OperationsForLedger

import Endpoints.Helpers as Helpers

import Endpoints.OperationsForLedger.Model exposing (Settings)


requestBuilder : Input.Model -> Settings -> RequestBuilder OperationsForLedger.Response
requestBuilder endpoint settings =

    OperationsForLedger.requestBuilder (Helpers.endpointFromInput endpoint) (IntInput.getValue settings.ledgerId |> Maybe.withDefault 0)
        |> Helpers.setIfChanged OperationsForLedger.setCursor Input.getIsChanged Input.getValue settings.cursor
        |> Helpers.setIfChangedMaybe OperationsForLedger.setLimit IntInput.getIsChanged IntInput.getValue settings.limit
        |> Helpers.setIfJust OperationsForLedger.setSorting settings.sorting