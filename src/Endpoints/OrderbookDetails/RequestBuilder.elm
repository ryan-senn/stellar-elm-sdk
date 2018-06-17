module Endpoints.OrderbookDetails.RequestBuilder exposing (requestBuilder)

import HttpBuilder exposing (RequestBuilder)

import Form.Input as Input
import Form.IntInput as IntInput
import Form.Select as Select

import Stellar.PublicKey as PublicKey
import Stellar.AssetType as AssetType

import Stellar.Endpoints.OrderbookDetails as OrderbookDetails

import Endpoints.Helpers as Helpers

import Endpoints.OrderbookDetails.Model exposing (Settings)


requestBuilder : Input.Model -> Settings -> RequestBuilder OrderbookDetails.Response
requestBuilder endpoint settings =

    OrderbookDetails.requestBuilder (Helpers.endpointFromInput endpoint) (Select.getSelectedOption settings.sellingAssetType |> Maybe.withDefault AssetType.Native) (Select.getSelectedOption settings.buyingAssetType |> Maybe.withDefault AssetType.Native)
        |> Helpers.setIfChanged OrderbookDetails.setSellingAssetCode Input.getIsChanged Input.getValue settings.sellingAssetCode
        |> Helpers.setIfChanged OrderbookDetails.setSellingAssetIssuer Input.getIsChanged (Input.getValue >> PublicKey.fromString) settings.sellingAssetIssuer
        |> Helpers.setIfChanged OrderbookDetails.setBuyingAssetCode Input.getIsChanged Input.getValue settings.buyingAssetCode
        |> Helpers.setIfChanged OrderbookDetails.setBuyingAssetIssuer Input.getIsChanged (Input.getValue >> PublicKey.fromString) settings.buyingAssetIssuer
        |> Helpers.setIfChangedMaybe OrderbookDetails.setLimit IntInput.getIsChanged IntInput.getValue settings.limit