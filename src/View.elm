module View exposing (view)

import Stellar.Endpoint as Endpoint
import Stellar.PublicKey as PublicKey

import Msg exposing (Msg (AccountRequest))
import Model exposing (Model)

import Routes exposing (Route)

import Html
import Html.Styled exposing (..)
import Html.Styled.Events exposing (..)
import Html.Styled.Attributes exposing (..)

import Styles as S

import String
import SyntaxHighlight


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
            div
                []
                [ text "All Assets" ]


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
            , div
                []
                [ SyntaxHighlight.useTheme SyntaxHighlight.monokai
                    |> Html.Styled.fromUnstyled
                , SyntaxHighlight.elm (viewModel model.accountResponse)
                    |> Result.map (SyntaxHighlight.toBlockHtml (Just 1))
                    |> Result.map Html.Styled.fromUnstyled
                    |> Result.withDefault
                        (div [] [ text "Displaying response failed" ])
                ]
            ]
        ]


quote = "\""
indentChars = "[{("
outdentChars = "]})"
newLineChars = ","
uniqueHead = "__HEAD__"
spaces = 4


viewModel : a -> String
viewModel record =

    record
        |> toString
        |> formatString False 0
        |> String.split uniqueHead
        |> List.map viewLine
        |> List.intersperse "\n"
        |> String.concat


viewLine : String -> String
viewLine lineStr =
    let
        (indent, lineTxt) =
            splitLine lineStr

    in
        String.repeat indent " " ++ lineTxt


formatString : Bool -> Int -> String -> String
formatString isInQuotes indent string =

    case String.left 1 string of

        "" ->
            ""

        firstChar ->
            if isInQuotes then
                if firstChar == quote then
                    firstChar ++ formatString (not isInQuotes) indent (String.dropLeft 1 string)
                else
                    firstChar ++ formatString isInQuotes indent (String.dropLeft 1 string)
            else
                if String.contains firstChar newLineChars then
                    uniqueHead ++ pad indent ++ firstChar ++ formatString isInQuotes indent (String.dropLeft 1 string)
                else if String.contains firstChar indentChars then
                    uniqueHead ++ pad (indent + spaces) ++ firstChar ++ formatString isInQuotes (indent + spaces) (String.dropLeft 1 string)
                else if String.contains firstChar outdentChars then
                    uniqueHead ++ pad indent ++ firstChar ++ formatString isInQuotes (indent - spaces) (String.dropLeft 1 string)
                else if String.contains firstChar outdentChars then
                    firstChar ++ uniqueHead ++ pad (indent - spaces) ++ formatString isInQuotes (indent - spaces) (String.dropLeft 1 string)
                else if firstChar == quote then
                    firstChar ++ formatString (not isInQuotes) indent (String.dropLeft 1 string)
                else
                    firstChar ++ formatString isInQuotes indent (String.dropLeft 1 string)


pad : Int -> String
pad =
    toString >> String.padLeft 5 '0'


splitLine : String -> (Int, String)
splitLine line =

    let
        indent =
            line
                |> String.left 5
                |> String.toInt
                |> Result.withDefault 0

        newLine =
            String.dropLeft 5 line

    in
        (indent, newLine)