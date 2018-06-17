module Endpoints.OperationsForTransaction.RequestBuilder exposing (requestBuilder)

import HttpBuilder exposing (RequestBuilder)

import Form.Input as Input
import Form.IntInput as IntInput

import Stellar.Endpoints.OperationsForTransaction as OperationsForTransaction

import Endpoints.Helpers as Helpers

import Endpoints.OperationsForTransaction.Model exposing (Settings)


requestBuilder : Input.Model -> Settings -> RequestBuilder OperationsForTransaction.Response
requestBuilder endpoint settings =

    OperationsForTransaction.requestBuilder (Helpers.endpointFromInput endpoint) (Input.getValue settings.transaction)
        |> Helpers.setIfChanged OperationsForTransaction.setCursor Input.getIsChanged Input.getValue settings.cursor
        |> Helpers.setIfChangedMaybe OperationsForTransaction.setLimit IntInput.getIsChanged IntInput.getValue settings.limit
        |> Helpers.setIfJust OperationsForTransaction.setSorting settings.sorting