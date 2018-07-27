module Endpoints.Views.Endpoint exposing (view)

import Html.Styled as Html exposing (..)
import Html.Styled.Attributes exposing (..)

import Form.Input as Input

import Msg exposing (Msg)

import Endpoints.Msg as Endpoints
import Endpoints.MsgFactory as Endpoints

import Endpoints.Styles as Css


view : Input.Model -> Html Msg
view inputModel =

    div
        [ class "form-group" ]
        [ label
            [ Css.label, Css.labelMandatory ]
            [ text "Endpoint" ]
        , inputModel
            |> Input.view
            |> Input.render
            |> Html.map (Endpoints.UpdateEndpoint >> Endpoints.composeMsg)
        ]