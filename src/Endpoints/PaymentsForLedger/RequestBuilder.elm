module Endpoints.PaymentsForLedger.RequestBuilder exposing (requestBuilder)

import HttpBuilder exposing (RequestBuilder)

import Form.Input as Input
import Form.IntInput as IntInput

import Stellar.Endpoints.PaymentsForLedger as PaymentsForLedger

import Endpoints.Helpers as Helpers

import Endpoints.PaymentsForLedger.Model exposing (Settings)


requestBuilder : Input.Model -> Settings -> RequestBuilder PaymentsForLedger.Response
requestBuilder endpoint settings =

    PaymentsForLedger.requestBuilder (Helpers.endpointFromInput endpoint) (IntInput.getValue settings.ledgerId |> Maybe.withDefault 0)
        |> Helpers.setIfChanged PaymentsForLedger.setCursor Input.getIsChanged Input.getValue settings.cursor
        |> Helpers.setIfChangedMaybe PaymentsForLedger.setLimit IntInput.getIsChanged IntInput.getValue settings.limit
        |> Helpers.setIfJust PaymentsForLedger.setSorting settings.sorting