module Endpoints.Views.Response exposing (view)

import Html.Styled as Html exposing (..)
import Html.Styled.Events exposing (..)
import Html.Styled.Attributes exposing (..)

import SyntaxHighlight
import Helpers.RecordFormatter as RecordFormatter

import Http

import Msg exposing (Msg)

import Endpoints.Styles as Css


view : Maybe (Result Http.Error record) -> Bool -> Html Msg
view response isLoading =

    div
        []
        [ h2
            []
            [ text "Response" ]
        , record response isLoading
        ]


record : Maybe (Result Http.Error record) -> Bool -> Html Msg
record response isLoading =

    case (isLoading, response) of

        (True, _) ->
            p
                []
                [ text "Loading..." ]

        (_, Nothing) ->
            p
                []
                [ text "Not requested yet." ]

        (_, Just data) ->
            div
                [ Css.response ]
                [ SyntaxHighlight.useTheme SyntaxHighlight.monokai
                    |> Html.fromUnstyled
                , SyntaxHighlight.elm (RecordFormatter.toString data)
                    |> Result.map (SyntaxHighlight.toBlockHtml (Just 1) >> Html.fromUnstyled)
                    |> Result.withDefault (div [] [ text "Displaying response failed" ])
                ]