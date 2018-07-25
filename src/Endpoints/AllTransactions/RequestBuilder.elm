module Endpoints.AllTransactions.RequestBuilder exposing (requestBuilder)

import HttpBuilder exposing (RequestBuilder)

import Form.Input as Input
import Form.IntInput as IntInput

import Stellar.Endpoint exposing (Endpoint)

import Stellar.Endpoints.AllTransactions as AllTransactions

import Endpoints.Helpers as Helpers

import Endpoints.AllTransactions.Model exposing (Settings)


requestBuilder : Endpoint -> Settings -> RequestBuilder AllTransactions.Response
requestBuilder endpoint settings =

    AllTransactions.requestBuilder endpoint
        |> Helpers.setIfChanged AllTransactions.setCursor Input.getIsChanged Input.getValue settings.cursor
        |> Helpers.setIfChangedMaybe AllTransactions.setLimit IntInput.getIsChanged IntInput.getValue settings.limit
        |> Helpers.setIfJust AllTransactions.setSorting settings.sorting