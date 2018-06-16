module Endpoints.AllAssets.RequestBuilder exposing (requestBuilder)

import HttpBuilder exposing (RequestBuilder)

import Form.Input as Input
import Form.IntInput as IntInput

import Stellar.Endpoint exposing (Endpoint)
import Stellar.PublicKey as PublicKey

import Stellar.Endpoints.AllAssets as AllAssets

import Endpoints.Helpers as Helpers

import Endpoints.AllAssets.Model exposing (Settings)


requestBuilder : Endpoint -> Settings -> RequestBuilder AllAssets.Response
requestBuilder endpoint settings =

    AllAssets.requestBuilder endpoint
        |> Helpers.setIfChanged AllAssets.setAssetCode Input.getIsChanged Input.getValue settings.assetCode
        |> Helpers.setIfChanged AllAssets.setAssetIssuer Input.getIsChanged (Input.getValue >> PublicKey.fromString) settings.assetIssuer
        |> Helpers.setIfChanged AllAssets.setCursor Input.getIsChanged Input.getValue settings.cursor
        |> Helpers.setIfChangedMaybe AllAssets.setLimit IntInput.getIsChanged IntInput.getValue settings.limit
        |> Helpers.setIfJust AllAssets.setSorting settings.sorting