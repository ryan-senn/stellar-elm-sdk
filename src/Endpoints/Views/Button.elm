module Endpoints.Views.Button exposing (view)

import Html.Styled exposing (..)
import Html.Styled.Events exposing (..)

import Html.Styled.Bdt exposing ((?))

import Msg exposing (Msg)

import Endpoints.Styles as Css


view : Bool -> Msg -> Html Msg
view isLoading msg =

    button
        [ Css.requestButton isLoading
        , onClick msg ? not isLoading ]
        [ text "Submit Request" ]