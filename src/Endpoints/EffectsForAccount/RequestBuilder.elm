module Endpoints.EffectsForAccount.RequestBuilder exposing (requestBuilder)

import HttpBuilder exposing (RequestBuilder)

import Form.Input as Input
import Form.IntInput as IntInput

import Stellar.Endpoint exposing (Endpoint)

import Stellar.Endpoints.EffectsForAccount as EffectsForAccount

import Endpoints.Helpers as Helpers

import Endpoints.EffectsForAccount.Model exposing (Settings)


requestBuilder : Input.Model -> Settings -> RequestBuilder EffectsForAccount.Response
requestBuilder endpoint settings =

    EffectsForAccount.requestBuilder (Helpers.endpointFromInput endpoint) (Helpers.publicKeyFromInput settings.account)
        |> Helpers.setIfChanged EffectsForAccount.setCursor Input.getIsChanged Input.getValue settings.cursor
        |> Helpers.setIfChangedMaybe EffectsForAccount.setLimit IntInput.getIsChanged IntInput.getValue settings.limit
        |> Helpers.setIfJust EffectsForAccount.setSorting settings.sorting