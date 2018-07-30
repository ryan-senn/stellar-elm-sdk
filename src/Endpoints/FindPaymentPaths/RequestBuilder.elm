module Endpoints.FindPaymentPaths.RequestBuilder exposing (requestBuilder)

import HttpBuilder exposing (RequestBuilder)

import Form.Input as Input
import Form.IntInput as IntInput

import Stellar.Endpoints.FindPaymentPaths as FindPaymentPaths

import Endpoints.Helpers as Helpers

import Endpoints.FindPaymentPaths.Model exposing (Settings)


requestBuilder : Input.Model -> Settings -> RequestBuilder FindPaymentPaths.Response
requestBuilder endpoint settings =

    FindPaymentPaths.requestBuilder
        (Helpers.endpointFromInput endpoint)
        (IntInput.getValue settings.operationId |> Maybe.withDefault 0)