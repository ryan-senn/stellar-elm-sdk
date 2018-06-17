module Endpoints.AccountDetails.RequestBuilder exposing (requestBuilder)

import HttpBuilder exposing (RequestBuilder)

import Form.Input as Input

import Stellar.Endpoints.AccountDetails as AccountDetails

import Endpoints.Helpers as Helpers

import Endpoints.AccountDetails.Model exposing (Settings)


requestBuilder : Input.Model -> Settings -> RequestBuilder AccountDetails.Response
requestBuilder endpoint settings =

    AccountDetails.requestBuilder
        (Helpers.endpointFromInput endpoint)
        (Helpers.publicKeyFromInput settings.publicKey)