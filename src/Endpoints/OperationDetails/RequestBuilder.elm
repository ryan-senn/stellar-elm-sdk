module Endpoints.OperationDetails.RequestBuilder exposing (requestBuilder)

import HttpBuilder exposing (RequestBuilder)

import Form.Input as Input
import Form.IntInput as IntInput

import Stellar.Endpoints.OperationDetails as OperationDetails

import Endpoints.Helpers as Helpers

import Endpoints.OperationDetails.Model exposing (Settings)


requestBuilder : Input.Model -> Settings -> RequestBuilder OperationDetails.Response
requestBuilder endpoint settings =

    OperationDetails.requestBuilder
        (Helpers.endpointFromInput endpoint)
        (IntInput.getValue settings.operationId |> Maybe.withDefault 0)