module Endpoints.View exposing (pageTitle, response)

import Html.Styled exposing (..)
import Html.Styled.Events exposing (..)
import Html.Styled.Attributes exposing (..)

import SyntaxHighlight
import Helpers.RecordFormatter as RecordFormatter

import Http

import Msg exposing (Msg)

import Endpoints.Styles as S


pageTitle : String -> String -> Html Msg
pageTitle title link =
    div
        [ S.pageTitleContainer ]
        [ h2
            [ S.pageTitle ]
            [ text title ]
        , span
            [ S.officialLink ]
            [ text "Link to the offial docs: " ]
        , a
            [ S.officialLink, href link, target "_blank" ]
            [ text title ]
        ]


response : Maybe (Result Http.Error record) -> Html Msg
response response =

    case response of

        Nothing ->
            text ""

        Just data ->
            div
                [ S.response ]
                [ SyntaxHighlight.useTheme SyntaxHighlight.monokai
                    |> Html.Styled.fromUnstyled
                , SyntaxHighlight.elm (RecordFormatter.toString data)
                    |> Result.map (SyntaxHighlight.toBlockHtml (Just 1) >> Html.Styled.fromUnstyled)
                    |> Result.withDefault
                        (div [] [ text "Displaying response failed" ])
                ]