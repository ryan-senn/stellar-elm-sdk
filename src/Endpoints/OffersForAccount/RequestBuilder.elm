module Endpoints.OffersForAccount.RequestBuilder exposing (requestBuilder)

import HttpBuilder exposing (RequestBuilder)

import Form.Input as Input
import Form.IntInput as IntInput

import Stellar.Endpoint exposing (Endpoint)

import Stellar.Endpoints.OffersForAccount as OffersForAccount

import Endpoints.Helpers as Helpers

import Endpoints.OffersForAccount.Model exposing (Settings)


requestBuilder : Input.Model -> Settings -> RequestBuilder OffersForAccount.Response
requestBuilder endpoint settings =

    OffersForAccount.requestBuilder (Helpers.endpointFromInput endpoint) (Helpers.publicKeyFromInput settings.account)
        |> Helpers.setIfChanged OffersForAccount.setCursor Input.getIsChanged Input.getValue settings.cursor
        |> Helpers.setIfChangedMaybe OffersForAccount.setLimit IntInput.getIsChanged IntInput.getValue settings.limit
        |> Helpers.setIfJust OffersForAccount.setSorting settings.sorting