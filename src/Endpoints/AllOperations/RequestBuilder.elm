module Endpoints.AllOperations.RequestBuilder exposing (requestBuilder)

import HttpBuilder exposing (RequestBuilder)

import Form.Input as Input
import Form.IntInput as IntInput

import Stellar.Endpoint exposing (Endpoint)

import Stellar.Endpoints.AllOperations as AllOperations

import Endpoints.Helpers as Helpers

import Endpoints.AllOperations.Model exposing (Settings)


requestBuilder : Endpoint -> Settings -> RequestBuilder AllOperations.Response
requestBuilder endpoint settings =

    AllOperations.requestBuilder endpoint
        |> Helpers.setIfChanged AllOperations.setCursor Input.getIsChanged Input.getValue settings.cursor
        |> Helpers.setIfChangedMaybe AllOperations.setLimit IntInput.getIsChanged IntInput.getValue settings.limit
        |> Helpers.setIfJust AllOperations.setSorting settings.sorting