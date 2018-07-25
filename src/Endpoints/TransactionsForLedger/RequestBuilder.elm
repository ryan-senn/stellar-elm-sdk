module Endpoints.TransactionsForLedger.RequestBuilder exposing (requestBuilder)

import HttpBuilder exposing (RequestBuilder)

import Form.Input as Input
import Form.IntInput as IntInput

import Stellar.Endpoints.TransactionsForLedger as TransactionsForLedger

import Endpoints.Helpers as Helpers

import Endpoints.TransactionsForLedger.Model exposing (Settings)


requestBuilder : Input.Model -> Settings -> RequestBuilder TransactionsForLedger.Response
requestBuilder endpoint settings =

    TransactionsForLedger.requestBuilder (Helpers.endpointFromInput endpoint) (IntInput.getValue settings.ledgerId |> Maybe.withDefault 0)
        |> Helpers.setIfChanged TransactionsForLedger.setCursor Input.getIsChanged Input.getValue settings.cursor
        |> Helpers.setIfChangedMaybe TransactionsForLedger.setLimit IntInput.getIsChanged IntInput.getValue settings.limit
        |> Helpers.setIfJust TransactionsForLedger.setSorting settings.sorting