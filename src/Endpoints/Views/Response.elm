module Endpoints.Views.Response exposing (view)

import Html.Styled as Html exposing (..)
import Html.Styled.Events exposing (..)
import Html.Styled.Attributes exposing (..)
import Html.Styled.Lazy exposing (..)

import VirtualDom

import Http

import Helpers.RecordFormatter as RecordFormatter

import Msg exposing (Msg)

import Endpoints.Styles as Css


view : Maybe (Result Http.Error record) -> Bool -> Html Msg
view response isLoading =

    div
        []
        [ h2
            []
            [ text "Response" ]
        , lazy2 record response isLoading
        ]


record : Maybe (Result Http.Error record) -> Bool -> VirtualDom.Node Msg
record response isLoading =

    case (isLoading, response) of

        (True, _) ->
            p
                []
                [ text "Loading..." ]
                |> toUnstyled

        (_, Nothing) ->
            p
                []
                [ text "Not requested yet." ]
                |> toUnstyled

        (_, Just data) ->
            div
                []
                [ pre
                    []
                    [ code
                        [ class "elm" ]
                        [ text <| RecordFormatter.toString data ]
                    ]
                , node "script"
                    []
                    [ text "hljs.initHighlighting.called = false;hljs.initHighlighting();" ]
                ]
                |> toUnstyled