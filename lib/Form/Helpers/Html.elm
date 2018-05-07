module Helpers.Html exposing (..)

import Html exposing (Html, text)


viewIf : Bool -> Html msg -> Html msg
viewIf show view =

    case show of

        True ->
            view

        False ->
            text ""