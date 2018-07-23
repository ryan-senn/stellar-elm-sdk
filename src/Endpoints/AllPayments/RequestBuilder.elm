module Endpoints.AllPayments.RequestBuilder exposing (requestBuilder)

import HttpBuilder exposing (RequestBuilder)

import Form.Input as Input
import Form.IntInput as IntInput

import Stellar.Endpoint exposing (Endpoint)

import Stellar.Endpoints.AllPayments as AllPayments

import Endpoints.Helpers as Helpers

import Endpoints.AllPayments.Model exposing (Settings)


requestBuilder : Endpoint -> Settings -> RequestBuilder AllPayments.Response
requestBuilder endpoint settings =

    AllPayments.requestBuilder endpoint
        |> Helpers.setIfChanged AllPayments.setCursor Input.getIsChanged Input.getValue settings.cursor
        |> Helpers.setIfChangedMaybe AllPayments.setLimit IntInput.getIsChanged IntInput.getValue settings.limit
        |> Helpers.setIfJust AllPayments.setSorting settings.sorting