module Endpoints.Views.Title exposing (view)

import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)

import Msg exposing (Msg)

import Endpoints.Styles as Css


view : String -> String -> Html Msg
view title link =
    div
        [ Css.titleContainer ]
        [ h1
            [ Css.title ]
            [ text title ]
        , span
            [ Css.officialLink ]
            [ text "Link to the offial docs: " ]
        , a
            [ Css.officialLink, href link, target "_blank" ]
            [ text title ]
        ]