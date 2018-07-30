module Endpoints.Helpers exposing (..)

import HttpBuilder exposing (RequestBuilder)

import Form.Input as Input

import Stellar.Endpoint as Endpoint exposing (Endpoint)
import Stellar.PublicKey as PublicKey exposing (PublicKey)


endpointFromInput : Input.Model -> Endpoint
endpointFromInput inputModel =

    Input.getValue inputModel


publicKeyFromInput : Input.Model -> PublicKey
publicKeyFromInput inputModel =

    Input.getValue inputModel


setIfChanged
    : (value -> RequestBuilder a -> RequestBuilder a)
    -> (formElement -> Bool)
    -> (formElement -> value)
    -> formElement
    -> RequestBuilder a
    -> RequestBuilder a
setIfChanged setter getIsChanged getValue formElement requestBuilder =

    if getIsChanged formElement then
        setter (getValue formElement) requestBuilder
    else
        requestBuilder


setIfChangedMaybe
    : (value -> RequestBuilder a -> RequestBuilder a)
    -> (formElement -> Bool)
    -> (formElement -> Maybe value)
    -> formElement
    -> RequestBuilder a
    -> RequestBuilder a
setIfChangedMaybe setter getIsChanged getValue formElement requestBuilder =

    case (getIsChanged formElement, getValue formElement) of

        (True, Just value) ->
            setter value requestBuilder

        _ ->
            requestBuilder


setIfJust : (value -> RequestBuilder a -> RequestBuilder a) -> Maybe value -> RequestBuilder a -> RequestBuilder a
setIfJust setter mValue requestBuilder =

    case mValue of
        Just value ->
            setter value requestBuilder

        Nothing ->
            requestBuilder