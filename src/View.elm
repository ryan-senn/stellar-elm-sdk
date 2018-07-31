module View exposing (view)

import Html.Styled exposing (..)
import Html.Styled.Events exposing (..)
import Html.Styled.Attributes exposing (..)
import Styles as Css

import String.Extra as String

import Routes exposing (Route)
import Endpoints exposing (Endpoint)

import Msg exposing (Msg (EndpointMsg))
import Model exposing (Model)

import Endpoints.Model as Endpoints
import Endpoints.View as Endpoints


view : Model -> Html Msg
view model =
    div
        [ Css.layout ]
        [ header
        , body model
        ]


header : Html Msg
header =
    div
        [ Css.header ]
        [ h1
            [ Css.title ]
            [ a
                [ Css.stellarTitle
                , Routes.href Routes.Home
                ]
                [ text "stellar" ]
            , a
                [ Css.elmTitle
                , Routes.href Routes.Home
                ]
                [ text "elm api" ]
            ]
        ]


body : Model -> Html Msg
body model =
    div
        [ Css.body ]
        [ sidebar model.route
        , content model
        ]


sidebar : Maybe Route -> Html Msg
sidebar mRoute =
    div
        [ Css.sidebar ]
        [ h4
            [ Css.sidebarTitle ]
            [ text "Endpoints" ]
        , ul
            [ Css.sidebarList
            ]
            ( List.map (menuItem mRoute) Endpoints.asList )
        ]


menuItem : Maybe Route -> Endpoint -> Html Msg
menuItem mRoute endpoint =
    li
        [ Css.sidebarItem <| Routes.isActiveRoute mRoute (Routes.Endpoints endpoint) ]
        [ a
            [ Css.sidebarItemLink, Routes.href <| Routes.Endpoints endpoint ]
            [ toString endpoint |> String.humanize |> String.toTitleCase |> text  ]
        ]


content : Model -> Html Msg
content model =

    case model.route of

        Nothing ->
            div
                [ Css.content ]
                [ text "Page not found D:" ]

        Just route ->
            div
                [ Css.content ]
                [ page model.endpoints route ]


page : Endpoints.Model -> Route -> Html Msg
page endpoints route =

    case route of

        Routes.Home ->
            home

        Routes.Endpoints endpoint ->
            Endpoints.view endpoints endpoint


home : Html Msg
home =
    div
        [ Css.home ]
        [ h1
            []
            [ text "Stellar Elm Api Examples" ]
        , p
            []
            [ span
                []
                [ text "This SPA is written in Elm, hosted on Github Pages. It aimes to replicate the " ]
            , a
                [ href "https://www.stellar.org/laboratory/#explorer?resource=accounts&endpoint=single", target "blank_" ]
                [ text "official Stellar Laboratory Endpoint Explorer."]
            , span
                []
                [ text " Click on any Endoint in the menu on the left to see what it looks like!" ]
            ]
        , p
            []
            [ a
                [ href "https://github.com/ryan-senn/stellar-elm", target "blank_" ]
                [ text "The source code is visible on Github."]
            ]
        , p
            []
            [ text "The Readme contains a section about the structure, future plans and how to build!" ]
        ]