module Endpoints.TransactionsForAccount.RequestBuilder exposing (requestBuilder)

import HttpBuilder exposing (RequestBuilder)

import Form.Input as Input
import Form.IntInput as IntInput

import Stellar.Endpoint exposing (Endpoint)

import Stellar.Endpoints.TransactionsForAccount as TransactionsForAccount

import Endpoints.Helpers as Helpers

import Endpoints.TransactionsForAccount.Model exposing (Settings)


requestBuilder : Input.Model -> Settings -> RequestBuilder TransactionsForAccount.Response
requestBuilder endpoint settings =

    TransactionsForAccount.requestBuilder (Helpers.endpointFromInput endpoint) (Helpers.publicKeyFromInput settings.account)
        |> Helpers.setIfChanged TransactionsForAccount.setCursor Input.getIsChanged Input.getValue settings.cursor
        |> Helpers.setIfChangedMaybe TransactionsForAccount.setLimit IntInput.getIsChanged IntInput.getValue settings.limit
        |> Helpers.setIfJust TransactionsForAccount.setSorting settings.sorting