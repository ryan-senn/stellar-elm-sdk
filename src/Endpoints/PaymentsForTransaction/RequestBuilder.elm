module Endpoints.PaymentsForTransaction.RequestBuilder exposing (requestBuilder)

import HttpBuilder exposing (RequestBuilder)

import Form.Input as Input
import Form.IntInput as IntInput

import Stellar.Endpoints.PaymentsForTransaction as PaymentsForTransaction

import Endpoints.Helpers as Helpers

import Endpoints.PaymentsForTransaction.Model exposing (Settings)


requestBuilder : Input.Model -> Settings -> RequestBuilder PaymentsForTransaction.Response
requestBuilder endpoint settings =

    PaymentsForTransaction.requestBuilder (Helpers.endpointFromInput endpoint) (Input.getValue settings.transaction)
        |> Helpers.setIfChanged PaymentsForTransaction.setCursor Input.getIsChanged Input.getValue settings.cursor
        |> Helpers.setIfChangedMaybe PaymentsForTransaction.setLimit IntInput.getIsChanged IntInput.getValue settings.limit
        |> Helpers.setIfJust PaymentsForTransaction.setSorting settings.sorting