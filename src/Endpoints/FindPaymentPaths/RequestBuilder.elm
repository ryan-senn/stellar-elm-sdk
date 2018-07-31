module Endpoints.FindPaymentPaths.RequestBuilder exposing (requestBuilder)

import HttpBuilder exposing (RequestBuilder)

import Form.Input as Input
import Form.IntInput as IntInput
import Form.Select as Select

import Stellar.AssetType as AssetType
import Stellar.Endpoints.FindPaymentPaths as FindPaymentPaths

import Endpoints.Helpers as Helpers

import Endpoints.FindPaymentPaths.Model exposing (Settings)


requestBuilder : Input.Model -> Settings -> RequestBuilder FindPaymentPaths.Response
requestBuilder endpoint settings =

    FindPaymentPaths.requestBuilder
        (Helpers.endpointFromInput endpoint)
        (Helpers.publicKeyFromInput settings.sourceAccount)
        (Helpers.publicKeyFromInput settings.destinationAccount)
        (Select.getSelectedOption settings.destinationAssetType |> Maybe.withDefault AssetType.Native)
        (IntInput.getValue settings.destinationAmount |> Maybe.withDefault 0)
            |> Helpers.setIfChanged FindPaymentPaths.setDestinationAssetCode Input.getIsChanged Input.getValue settings.destinationAssetCode
            |> Helpers.setIfChanged FindPaymentPaths.setDestinationAssetIssuer Input.getIsChanged Input.getValue settings.destinationAssetIssuer