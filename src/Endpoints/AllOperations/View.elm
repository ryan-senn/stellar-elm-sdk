module Endpoints.AllOperations.View exposing (view)

import Html.Styled as Html exposing (..)
import Html.Styled.Events exposing (..)
import Html.Styled.Attributes exposing (..)

import Form.Input as Input
import Form.IntInput as IntInput

import Stellar.Sorting as Sorting

import Msg exposing (Msg)

import Endpoints.Msg as Endpoints

import Endpoints.Styles as Css

import Endpoints.Views.Title as Title
import Endpoints.Views.Endpoint as Endpoint
import Endpoints.Views.Request as Request
import Endpoints.Views.Button as Button
import Endpoints.Views.Response as Response

import Endpoints.AllOperations.Msg as AllOperations
import Endpoints.AllOperations.MsgFactory as AllOperations
import Endpoints.AllOperations.Model as AllOperations

import Endpoints.AllOperations.RequestBuilder exposing (requestBuilder)

import Endpoints.Helpers exposing (endpointFromInput, publicKeyFromInput)


view : Input.Model -> AllOperations.Model -> Html Msg
view endpoint model =

    div
        []
        [ Title.view "All Operations" "https://www.stellar.org/developers/horizon/reference/endpoints/operations-all.html"
        , div
            [ Css.page ]
            [ h2
                []
                [ text "Request" ]
            , Endpoint.view endpoint
            , div
                [ class "form-group" ]
                [ label
                    [ Css.label ]
                    [ span
                        []
                        [ text "Cursor" ]
                    , span
                        [ Css.labelExample ]
                        [ text "(eg: 1)" ]
                    ]
                , model.settings.cursor
                    |> Input.view
                    |> Input.render
                    |> Html.map (AllOperations.UpdateCursor >> AllOperations.SettingsMsg >> AllOperations.composeMsg)
                ]
            , div
                [ class "form-group" ]
                [ label
                    [ Css.label ]
                    [ span
                        []
                        [ text "Limit" ]
                    , span
                        [ Css.labelExample ]
                        [ text "(eg: 200, default: 10)" ]
                    ]
                , model.settings.limit
                    |> IntInput.view
                    |> IntInput.render
                    |> Html.map (AllOperations.UpdateLimit >> AllOperations.SettingsMsg >> AllOperations.composeMsg)
                ]
            , div
                [ class "form-group" ]
                [ label
                    [ Css.label ]
                    [ span
                        []
                        [ text "Sorting" ]
                    , span
                        [ Css.labelExample ]
                        [ text "(default: asc)" ]
                    ]
                , div
                    []
                    [ span
                        [ Css.radioButton (model.settings.sorting == Just Sorting.Asc)
                        , onClick (AllOperations.UpdateSorting Sorting.Asc |> AllOperations.SettingsMsg |> AllOperations.composeMsg)
                        ]
                        [ text "Asc" ]
                    , span
                        [ Css.radioButton (model.settings.sorting == Just Sorting.Desc)
                        , onClick (AllOperations.UpdateSorting Sorting.Desc |> AllOperations.SettingsMsg |> AllOperations.composeMsg)
                        ]
                        [ text "Desc" ]
                    ]
                ]
            , Request.view (requestBuilder (endpointFromInput endpoint) model.settings)
            , Button.view model.isLoading (AllOperations.Request (endpointFromInput endpoint) model.settings |> AllOperations.composeMsg)
            , Response.view model.response model.isLoading
            ]
        ]