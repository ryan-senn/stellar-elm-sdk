module Endpoints.OperationsForAccount.RequestBuilder exposing (requestBuilder)

import HttpBuilder exposing (RequestBuilder)

import Form.Input as Input
import Form.IntInput as IntInput

import Stellar.Endpoints.OperationsForAccount as OperationsForAccount

import Endpoints.Helpers as Helpers

import Endpoints.OperationsForAccount.Model exposing (Settings)


requestBuilder : Input.Model -> Settings -> RequestBuilder OperationsForAccount.Response
requestBuilder endpoint settings =

    OperationsForAccount.requestBuilder (Helpers.endpointFromInput endpoint) (Helpers.publicKeyFromInput settings.account)
        |> Helpers.setIfChanged OperationsForAccount.setCursor Input.getIsChanged Input.getValue settings.cursor
        |> Helpers.setIfChangedMaybe OperationsForAccount.setLimit IntInput.getIsChanged IntInput.getValue settings.limit
        |> Helpers.setIfJust OperationsForAccount.setSorting settings.sorting