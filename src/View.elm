module View exposing (view)

import Html exposing (..)
import Html.Events exposing (..)

import Stellar.Endpoint as Endpoint
import Stellar.PublicKey as PublicKey

import Msg exposing (Msg (AccountRequest))
import Model exposing (Model)


view : Model -> Html Msg
view model =

    div
        []
        [ h1
            []
            [ text "Stellar Elm" ]
        , accountsSingleAccount model
        ]


accountsSingleAccount : Model -> Html Msg
accountsSingleAccount model =

    div
        []
        [ h3
            []
            [ text "Single Account" ]
        , button
            [ onClick <| AccountRequest Endpoint.dummy PublicKey.dummy ]
            [ text "Request" ]
        , h4
            []
            [ text "response" ]
        , div
            []
            [ text <| toString model.accountResponse ]
        ]