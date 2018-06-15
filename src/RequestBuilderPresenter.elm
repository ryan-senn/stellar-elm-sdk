module RequestBuilderPresenter exposing (view)

import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)

import Http
import HttpBuilder exposing (RequestBuilder)

import Json.Encode as Encode

import Msg exposing (Msg)

import Styles as Css


view : RequestBuilder a -> Html Msg
view requestBuilder =

    case requestBuilder.method of
        "GET" ->
            div
                [ Css.request ]
                [ div
                    [ Css.requestType ]
                    [ text "GET" ]
                , div
                    [ Css.requestUrl
                    , class "clipboard"
                    , title "Copy to Clipboard"
                    , attribute "data-clipboard-text" (requestBuilder.url ++ queryParams requestBuilder.queryParams)
                    ]
                    [ text (requestBuilder.url ++ queryParams requestBuilder.queryParams) ]
                ]

        "POST" ->
            div
                []
                [ text "POST" ]

        _ ->
            div
                []
                [ text "Request Type not Supported" ]


queryParams : List ( String, String ) -> String
queryParams args =

    case List.isEmpty args of
        False ->
            "?" ++ joinUrlEncoded args

        True ->
            ""


-- taken from HttpBuilder --


joinUrlEncoded : List ( String, String ) -> String
joinUrlEncoded args =
    String.join "&" (List.map queryPair args)


queryPair : ( String, String ) -> String
queryPair ( key, value ) =
    queryEscape key ++ "=" ++ queryEscape value


queryEscape : String -> String
queryEscape =
    Http.encodeUri >> replace "%20" "+"


replace : String -> String -> String -> String
replace old new =
    String.split old >> String.join new