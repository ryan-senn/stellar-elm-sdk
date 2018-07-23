module Endpoints.PaymentsForAccount.RequestBuilder exposing (requestBuilder)

import HttpBuilder exposing (RequestBuilder)

import Form.Input as Input
import Form.IntInput as IntInput

import Stellar.Endpoint exposing (Endpoint)

import Stellar.Endpoints.PaymentsForAccount as PaymentsForAccount

import Endpoints.Helpers as Helpers

import Endpoints.PaymentsForAccount.Model exposing (Settings)


requestBuilder : Input.Model -> Settings -> RequestBuilder PaymentsForAccount.Response
requestBuilder endpoint settings =

    PaymentsForAccount.requestBuilder (Helpers.endpointFromInput endpoint) (Helpers.publicKeyFromInput settings.account)
        |> Helpers.setIfChanged PaymentsForAccount.setCursor Input.getIsChanged Input.getValue settings.cursor
        |> Helpers.setIfChangedMaybe PaymentsForAccount.setLimit IntInput.getIsChanged IntInput.getValue settings.limit
        |> Helpers.setIfJust PaymentsForAccount.setSorting settings.sorting