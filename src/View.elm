module View exposing (view)

import Html exposing (..)

import Msg exposing (Msg)
import Model exposing (Model)


view : Model -> Html Msg
view model =

    div
        []
        [ h1
            []
            [ text "Stellar Elm" ]
        , accountsSingleAccount
        ]


accountsSingleAccount : Html Msg
accountsSingleAccount =

    div
        []
        [ h3
            []
            [ text "Single Account" ]
        , button
            []
            [ text "Request" ]
        ]