module Endpoints.Views.Button exposing (view)

import Html.Styled exposing (..)
import Html.Styled.Events exposing (..)

import Msg exposing (Msg)

import Endpoints.Styles as Css

import Helpers.Html.Attributes exposing ((?))


view : Bool -> Msg -> Html Msg
view isLoading msg =

    button
        [ Css.requestButton isLoading
        , onClick msg ? not isLoading ]
        [ text "Submit Request" ]