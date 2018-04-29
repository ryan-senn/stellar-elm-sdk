module View exposing (view)

import Http

import Stellar.Endpoint as Endpoint
import Stellar.PublicKey as PublicKey

import Html
import Html.Styled exposing (..)
import Html.Styled.Events exposing (..)
import Html.Styled.Attributes exposing (..)
import Styles as S

import SyntaxHighlight
import RecordFormatter

import Msg exposing (Msg (AccountRequest, AllAssetsRequest))
import Model exposing (Model)

import Routes exposing (Route)


view : Model -> Html Msg
view model =

    div
        [ S.layout ]
        [ header
        , body model
        ]


header : Html Msg
header =

    div
        [ S.header ]
        [ h1
            [ S.title
            ]
            [ span
                [ S.stellarTitle ]
                [ text "stellar" ]
            , span
                [ S.elmTitle ]
                [ text "elm api" ]
            ]
        ]


body : Model -> Html Msg
body model =

    div
        [ S.body ]
        [ sidebar model.route
        , content model
        ]


sidebar : Maybe Route -> Html Msg
sidebar mRoute =
    div
        [ S.sidebar ]
        [ h4
            [ S.sidebarTitle ]
            [ text "Endpoints" ]
        , ul
            [ S.sidebarList
            ]
            [ li
                [ S.sidebarItem <| Routes.isActiveRoute mRoute (Routes.Endpoints Routes.AccountDetails) ]
                [ a
                    [ S.sidebarItemLink, Routes.href <| Routes.Endpoints Routes.AccountDetails ]
                    [ text "Account Details" ]
                ]
            , li
                [ S.sidebarItem <| Routes.isActiveRoute mRoute (Routes.Endpoints Routes.AllAssets) ]
                [ a
                    [ S.sidebarItemLink, Routes.href <| Routes.Endpoints Routes.AllAssets ]
                    [ text "All Assets" ]
                ]
            ]
        ]


content : Model -> Html Msg
content model =

    case model.route of

        Nothing ->
            div
                [ S.content ]
                [ text "Page not found D:" ]

        Just route ->
            div
                [ S.content ]
                [ page model route ]


page : Model -> Route -> Html Msg
page model route =

    case route of

        Routes.Home ->
            div
                []
                [ text "Home" ]

        Routes.Endpoints Routes.AccountDetails ->
            account model

        Routes.Endpoints Routes.AllAssets ->
            assets model


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


account : Model -> Html Msg
account model =

    div
        []
        [ pageTitle "Account Details" "https://www.stellar.org/developers/horizon/reference/endpoints/accounts-single.html"
        , div
            [ S.page ]
            [ button
                [ onClick <| AccountRequest Endpoint.dummy PublicKey.dummy ]
                [ text "Request" ]
            , h4
                []
                [ text "response" ]
            , response model.accountResponse
            ]
        ]


assets : Model -> Html Msg
assets model =

    div
        []
        [ pageTitle "All Assets" "https://www.stellar.org/developers/horizon/reference/endpoints/assets-all.html"
        , div
            [ S.page ]
            [ button
                [ onClick <| AllAssetsRequest Endpoint.dummy ]
                [ text "Request" ]
            , h4
                []
                [ text "response" ]
            , response model.allAssetsResponse
            ]
        ]


response : Maybe (Result Http.Error record) -> Html Msg
response response =

    case response of

        Nothing ->
            text ""

        Just (Err error) ->
            div
                []
                [ div
                    []
                    [ text "Something went wrong D:" ]
                , div
                    []
                    [ text <| toString error ]
                ]

        Just (Ok record) ->
            div
                [ S.response ]
                [ SyntaxHighlight.useTheme SyntaxHighlight.monokai
                    |> Html.Styled.fromUnstyled
                , SyntaxHighlight.elm (RecordFormatter.toString record)
                    |> Result.map (SyntaxHighlight.toBlockHtml (Just 1) >> Html.Styled.fromUnstyled)
                    |> Result.withDefault
                        (div [] [ text "Displaying response failed" ])
                ]