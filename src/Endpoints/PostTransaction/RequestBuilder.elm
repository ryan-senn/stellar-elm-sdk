module Endpoints.PostTransaction.RequestBuilder exposing (requestBuilder)

import HttpBuilder exposing (RequestBuilder)

import Form.Input as Input
import Form.TextArea as TextArea

import Stellar.PublicKey as PublicKey
import Stellar.AssetType as AssetType

import Stellar.Endpoints.PostTransaction as PostTransaction

import Endpoints.Helpers as Helpers

import Endpoints.PostTransaction.Model exposing (Settings)


requestBuilder : Input.Model -> Settings -> RequestBuilder PostTransaction.Response
requestBuilder endpoint settings =

    PostTransaction.requestBuilder (Helpers.endpointFromInput endpoint) (TextArea.getValue settings.transactionEnvelopeXdr)