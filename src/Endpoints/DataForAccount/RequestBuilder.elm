module Endpoints.DataForAccount.RequestBuilder exposing (requestBuilder)

import HttpBuilder exposing (RequestBuilder)

import Form.Input as Input
import Form.Select as Select

import Stellar.Endpoints.DataForAccount as DataForAccount

import Endpoints.Helpers as Helpers

import Endpoints.DataForAccount.Model exposing (Settings)


requestBuilder : Input.Model -> Settings -> RequestBuilder DataForAccount.Response
requestBuilder endpoint settings =

    DataForAccount.requestBuilder
        (Helpers.endpointFromInput endpoint)
        (Helpers.publicKeyFromInput settings.publicKey)
        (Select.getSelectedOption settings.dataKey |> Maybe.withDefault DataForAccount.UserId)